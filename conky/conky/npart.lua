conky.config = {
    -- Run settings
    total_run_times = 0,
    update_interval = 1,

    -- Positioning
    alignment = 'bottom_left',
    gap_x = 10,
    gap_y = 5,
    minimum_width = 107,
    maximum_width = 107,
    minimum_height = 60,

    -- Draw settings
    double_buffer = true,
    draw_shades = false,
    draw_blended = false,

    -- Compositor settings
    own_window = true,
    own_window_argb_visual = true,
    own_window_argb_value = 0,
    own_window_transparent = true,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    own_window_type = 'dock'
};

conky.text = [[
${if_match "" != "${exec playerctl -p spotify status}"}${exec ./scripts/fetch-art spotify}
    ${image ./data/spotify.png -p 0,0 -s 60x60 -n}
${else}${if_match "" != "${exec playerctl -l | grep firefox}"}${exec ./scripts/fetch-art firefox}
    ${image ./data/firefox.png -p 0,0 -s 107x60 -n}
${endif}
${endif}
]];
