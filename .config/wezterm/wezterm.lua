local wezterm = require 'wezterm'
local config = wezterm.config_builder()

require('use-multiplexer')(wezterm)

require('style-tabs')(wezterm, config)

config.enable_wayland = false
config.audible_bell = 'Disabled'
config.term = 'wezterm'
config.color_scheme = 'kanagawabones'
config.window_decorations = "RESIZE"
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 12.0

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    --Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    { key = 'a',     mods = 'LEADER|CTRL', action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' }, },
    -- Pane management
    { key = 'x',     mods = 'LEADER',      action = wezterm.action.CloseCurrentPane({ confirm = false }) },
    { key = 't',     mods = 'LEADER',      action = wezterm.action.SpawnTab('CurrentPaneDomain') },
    { key = '1',     mods = 'LEADER',      action = wezterm.action.ActivateTab(0) },
    { key = '2',     mods = 'LEADER',      action = wezterm.action.ActivateTab(1) },
    { key = '3',     mods = 'LEADER',      action = wezterm.action.ActivateTab(2) },
    { key = '4',     mods = 'LEADER',      action = wezterm.action.ActivateTab(3) },
    { key = '5',     mods = 'LEADER',      action = wezterm.action.ActivateTab(4) },

    --Copy/paste
    { key = 'c',     mods = 'CTRL|SHIFT',  action = wezterm.action({ CopyTo = 'Clipboard' }) },
    { key = 'v',     mods = 'CTRL|SHIFT',  action = wezterm.action({ PasteFrom = 'Clipboard' }) },
    { key = "Space", mods = "LEADER",      action = require('use-hyperlinks-action')(wezterm) },
    { key = "r",     mods = "LEADER",      action = wezterm.action.ReloadConfiguration },
    { key = "p",     mods = "LEADER",      action = wezterm.action.ActivateCommandPalette },
}


-- config.hyperlink_rules = wezterm.default_hyperlink_rules()
--
-- local file_patterns = {
--     -- Absolute paths (Unix/Mac)
--     [[/(?:[^\\\s\n\r<>|"':;*?]|\\ )+]],
--     -- Relative paths
--     [[(?:\.{1,2}[\\/])(?:[^\\\s\n\r<>|"':;*?]|\\ )+]],
-- }
--
-- for _, pattern in ipairs(file_patterns) do
--     table.insert(config.hyperlink_rules, {
--         regex = pattern,
--         format = 'file://$0',
--     })
-- end

-- Key binding to open clicked files in Neovim
-- config.keys = {
--     {
--         key = 'g',
--         mods = 'CTRL|SHIFT',
--         action = wezterm.action_callback(function(window, pane)
--             local hyperlink = pane:get_hyperlink_at_mouse_cursor()
--             if hyperlink then
--                 -- Extract file path from hyperlink
--                 local file_path = hyperlink:gsub('file://', '')
--                 -- Open in Neovim
--                 window:perform_action(
--                     wezterm.action.SpawnCommandInNewTab {
--                         args = { 'nvim', file_path },
--                     },
--                     pane
--                 )
--             end
--         end),
--     },
-- }
return config
