local function module(wezterm, config)
    config.show_new_tab_button_in_tab_bar = false;
    config.use_fancy_tab_bar = false
    config.tab_bar_at_bottom = true

    wezterm.on('format-tab-title', function(tab)
        local activeMarker = ' ';
        if tab.is_active then
            activeMarker = '*'
        end
        local title = ' ' .. tab.tab_index + 1 .. ':' .. tab.active_pane.title .. activeMarker
        return {
            { Text = title },
        }
    end)

    config.colors = {
        tab_bar = {
            background = 'transparent',
            active_tab = {
                bg_color = 'transparent',
                fg_color = '#7eb3c9',
                intensity = 'Normal',
                underline = 'None', -- "None", "Single", "Double"
            },
            inactive_tab = {
                bg_color = 'transparent',
                fg_color = '#7eb3c9',
            },
            inactive_tab_hover = {
                bg_color = '#7eb3c9',
                fg_color = 'white',
                italic = false,
            },

        },
    }
    return config
end

return module
