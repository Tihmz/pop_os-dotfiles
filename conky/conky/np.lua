conky.config = {
    -- Run settings
    total_run_times = 0,
    update_interval = 1,

    -- Positioning
    alignment = 'bottom_left',
    gap_x = 10,
    gap_y = -50,
    minimum_width = 700,
    maximum_width = 700,
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
${if_match "" != "${exec playerctl -p spotify status}"}


${color #fff}${font Gotham Book:pixelsize=25}
${color #fff}${font Gotham Book:pixelsize=20}            ${if_match ${exec playerctl -p spotify metadata title | wc -c} < 50}${font Gotham Book:bold:pixelsize=15}${exec playerctl -p spotify metadata title}${else}${font Gotham Book:bold:pixelsize=15}${scroll 50 2 ${exec playerctl -p spotify metadata title}}${endif}
${color #fff}${font Gotham Book:pixelsize=20}            ${font Gotham Book:italic:pixelsize=13}By : ${exec playerctl -p spotify metadata artist}${font Gotham:style=italic:pixelsize=10}
${color #fff}${font Gotham Book:pixelsize=20}            ${font Gotham:pixelsize=13}${exec playerctl -p spotify metadata album}${font Gotham:style=italic:pixelsize=10}

${else}${if_match "" != "${exec playerctl -l | grep firefox}"}


${color #fff}${font Gotham Book:pixelsize=30}
${color #fff}${font Gotham Book:pixelsize=20}                   ${if_match ${exec playerctl -p firefox metadata title | wc -c} < 50}${font Gotham Book:bold:pixelsize=15}${exec playerctl -p firefox metadata title}${else}${font Gotham Book:bold:pixelsize=15}${scroll 50 2 ${exec playerctl -p firefox metadata title}}${endif}
${color #fff}${font Gotham Book:pixelsize=20}                   ${font Gotham Book:italic:pixelsize=13}By : ${exec playerctl -p firefox metadata artist}${font Gotham:style=italic:pixelsize=10}

${else}




${font Pirulen:bold:size=12}${time %B %d, %Y}
${font Pirulen:bold:size=12}    ${time %H}:${time %M}:${time %S}

${endif}${endif}
]];