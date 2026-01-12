local function parse_file_name(file_path)
    local file, line, column = file_path:match([[^([^:]*):?([^:]*):?([^:]*)$]])
    file = file ~= '' and file or selection
    line = line ~= '' and line or '0'
    column = column ~= '' and column or '0'

    return file, line, column
end
local function module(wezterm)
    return wezterm.action.QuickSelectArgs({
        label = "open in vi",
        patterns = {
            [[(?!\s|\r)[\S\/~\.]*\/\S+\.\S*(?<!\s|\r)]]
        },
        action = wezterm.action_callback(function(window, pane)
            local selection = window:get_selection_text_for_pane(pane)
            local file, line, column = parse_file_name(selection)
            window:perform_action(wezterm.action.ClearSelection, pane)
            window:mux_window():spawn_tab { args = { 'nvim', '+' .. line, '+normal! '.. column ..'|', file } }
        end),
    })
end

return module
