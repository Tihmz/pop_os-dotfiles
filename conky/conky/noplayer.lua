conky.config = {
    -- Run settings
    total_run_times = 0,
    update_interval = 1,

    -- Positioning
    alignment = 'bottom_left',
    gap_x = 200,
    gap_y = -70,
    minimum_width = 470,
    maximum_width = 470,
    minimum_height = 200,

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
    own_window_type = 'dock',

    -- Text settings
    uppercase = true,
    use_xft = true,
    override_utf8_locale = true
};

conky.text = [[
${if_match "" == "${exec playerctl -l}" }
${font Gotham Book:pixelsize=30} 
${font Gotham Book:pixelsize=12}
$color[CPU] $cpu% ${color #f00}${cpubar 4} 
${font Gotham Book:pixelsize=12}$color[RAM] $mem% ${color #f00}${membar 4 }
$color[NET] UP: ${color f00} ${upspeedgraph wlo1 15,170 000000 ffff00}$color  DOWN: ${color f00} ${downspeedgraph wlo1 15,170 000000 ff00ff}
${endif}
]];