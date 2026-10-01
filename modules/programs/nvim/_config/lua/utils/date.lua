local M = {}

function M.increment_date_under_cursor()
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

return M