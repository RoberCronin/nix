local M = {}

function M.sync()
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

    local has_content = false
    for _, l in ipairs(lines) do
        if string.gsub(l, "^%s*(.-)%s*$", "%1") ~= "" then
            has_content = true
            break
        end
    end

    if not has_content then
        local today = os.date("%Y-%m-%d")
        local template = "task name due:" .. today .. " 11:59 pm"
        vim.api.nvim_buf_set_lines(0, 0, -1, false, { template })
        vim.cmd("stopinsert")
        return
    end

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
                        h = h + 12
                    end
                elseif am_pm == "am" then
                    if h == 12 then
                        h = 0
                    end
                end

                payload_table.due_date = string.format("%s-%s-%sT%02d:%02d:00%s", year, month, day, h, m, TZ_OFFSET)

                payload_table.reminders = {
                    { relative_to = "due_date", relative_period = -3600 },
                    { relative_to = "due_date", relative_period = -7200 },
                    { relative_to = "due_date", relative_period = -86400 },
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

return M
