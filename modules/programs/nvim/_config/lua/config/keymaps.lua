vim.keymap.set("n", "<Leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostic" })

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("t", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("t", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("t", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("t", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>P", '"+P')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y$')

local function increment_date_under_cursor()
    local days_to_add = vim.v.count1

    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2] + 1

    local start_idx, end_idx = 1, 1
    while true do
        local s, e = string.find(line, "%d%d%d%d%-%d%d%-%d%d", start_idx)
        if not s then
            break
        end
        if col >= s and col <= e then
            start_idx, end_idx = s, e
            break
        end
        start_idx = e + 1
    end

    if start_idx == 1 and end_idx == 1 then
        start_idx, end_idx = string.find(line, "%d%d%d%d%-%d%d%-%d%d")
    end

    if not start_idx then
        print("No date found under cursor or on this line.")
        return
    end

    local date_str = string.sub(line, start_idx, end_idx)
    local y, m, d = string.match(date_str, "(%d%d%d%d)%-(%d%d)%-(%d%d)")

    local current_epoch = os.time({
        year = tonumber(y),
        month = tonumber(m),
        day = tonumber(d),
        hour = 12,
        min = 0,
        sec = 0,
    })

    local next_epoch = current_epoch + (86400 * days_to_add)
    local new_date_str = os.date("%Y-%m-%d", next_epoch)

    local new_line = string.sub(line, 1, start_idx - 1) .. new_date_str .. string.sub(line, end_idx + 1)
    vim.api.nvim_set_current_line(new_line)
    print("Date advanced by " .. days_to_add .. " days to: " .. new_date_str)
end

vim.keymap.set(
    "n",
    "<leader>d",
    increment_date_under_cursor,
    { silent = true, desc = "Increment YYYY-MM-DD date under cursor" }
)

local function vikunja_sync()
    local base_url = vim.env.VIKUNJA_URL or os.getenv("VIKUNJA_URL")
    local api_token = vim.env.VIKUNJA_API_KEY or os.getenv("VIKUNJA_API_KEY")
    local LIST_ID = 1

    local TZ_OFFSET = "-07:00"

    if not base_url or base_url == "" or not api_token or api_token == "" then
        print("Error: Missing environment variables ($VIKUNJA_URL or $VIKUNJA_API_KEY)")
        return
    end

    base_url = string.gsub(base_url, "/$", "")
    local full_api_url = base_url .. "/api/v2/projects/" .. LIST_ID .. "/tasks"

    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local count = 0

    for _, line in ipairs(lines) do
        line = string.gsub(line, "^%s*(.-)%s*$", "%1")

        if line ~= "" then
            -- matches "task Name due:YYYY-MM-DD HH:MM am/pm"
            local task_text, year, month, day, hour, min, am_pm =
                string.match(line, "^(.-)%s*due:(%d%d%d%d)%-(%d%d)%-(%d%d)%s+(%d%d):(%d%d)%s+([aApP][mM])$")

            local payload_table = {}
            if task_text and year then
                payload_table.title = task_text

                local h = tonumber(hour)
                local m = tonumber(min)
                am_pm = string.lower(am_pm)

                if am_pm == "pm" then
                    if h < 12 then
                        h = h + 12 -- e.g., 1:00 pm becomes 13:00
                    end
                elseif am_pm == "am" then
                    if h == 12 then
                        h = 0 -- 12:00 am midnight becomes 00:00
                    end
                end

                payload_table.due_date = string.format("%s-%s-%sT%02d:%02d:00%s", year, month, day, h, m, TZ_OFFSET)

                payload_table.reminders = {
                    { relative_to = "due_date", relative_period = -3600 }, -- 1 hour before
                    { relative_to = "due_date", relative_period = -7200 }, -- 2 hours before
                    { relative_to = "due_date", relative_period = -86400 }, -- 1 day before
                }
            else
                payload_table.title = line
            end

            local json_payload = vim.fn.json_encode(payload_table)
            local curl_cmd = string.format(
                "curl -s -o /dev/null -w '%%{http_code}' -X POST %s "
                    .. "-H 'Authorization: Bearer %s' "
                    .. "-H 'Content-Type: application/json' "
                    .. "-d %s",
                vim.fn.shellescape(full_api_url),
                vim.fn.shellescape(api_token),
                vim.fn.shellescape(json_payload)
            )

            local http_code = vim.fn.system(curl_cmd)
            http_code = string.gsub(http_code, "%s+", "")

            if http_code == "201" or http_code == "200" then
                count = count + 1
            else
                local server_err = vim.fn.system(
                    string.format(
                        "curl -s -X POST %s -H 'Authorization: Bearer %s' -H 'Content-Type: application/json' -d %s",
                        vim.fn.shellescape(full_api_url),
                        vim.fn.shellescape(api_token),
                        vim.fn.shellescape(json_payload)
                    )
                )
                print(string.format("HTTP %s Error. Server details: %s", http_code, server_err))
            end
        end
    end

    if count > 0 then
        vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
        print(string.format("Successfully pushed %d tasks.", count))
    end
end

vim.api.nvim_create_user_command("VikunjaSync", vikunja_sync, {})
vim.keymap.set("n", "<leader>vk", ":VikunjaSync<CR>", { silent = true, desc = "Sync assignments to Vikunja" })
