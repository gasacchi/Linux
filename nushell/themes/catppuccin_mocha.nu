# Catppuccin Mocha Nushell Theme

let rosewater = "#f5e0dc"
let flamingo = "#f2cdcd"
let pink = "#f5c2e7"
let mauve = "#cba6f7"
let red = "#f38ba8"
let maroon = "#eba0ac"
let peach = "#fab387"
let yellow = "#f9e2af"
let green = "#a6e3a1"
let teal = "#94e2d5"
let sky = "#89dceb"
let sapphire = "#74c7ec"
let blue = "#89b4fa"
let lavender = "#b4befe"
let text = "#cdd6f4"
let subtext_0 = "#a6adc8"
let subtext_1 = "#bac2de"
let overlay_0 = "#6c7086"
let overlay_1 = "#7f849c"
let overlay_2 = "#9399b2"
let surface_0 = "#313244"
let surface_1 = "#45475a"
let surface_2 = "#585b70"
let base = "#1e1e2e"
let mantle = "#181825"
let crust = "#11111b"

# TODO: Need improvment
let catppuccin_mocha = {
    # color for nushell primitives
    # Border table
    separator: $overlay_0
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: {fg: $green attr: b}
    # primitive
    empty: $peach
    bool: {fg:$peach attr: b }
    int: $peach
    filesize: $blue
    duration: $surface_1
    date: $peach
    range: $green
    float: $peach
    string: $text
    nothing: $peach
    binary: $red
    cellpath: $blue
    row_index: {fg: $subtext_0 attr: b}
    record: $pink
    list: $pink
    block: $pink

    # completion hint
    hints: $overlay_0

    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: $base bg: $pink attr: b }
    shape_binary: { fg: $red attr: b }
    shape_bool: { fg: $peach attr: b }
    shape_int: { fg: $peach attr: b }
    shape_float: { fg: $peach attr: b }
    shape_range: { fg: $overlay_1 attr: b }
    shape_internalcall: { fg: $blue attr: b }
    shape_external: { fg: $blue attr: b }
    shape_externalarg: { fg: $flamingo attr: b }
    shape_literal: $peach
    shape_operator: $pink
    shape_signature: { fg: $red attr:b }
    shape_string: $green
    shape_string_interpolation: { fg: $green attr: b }
    shape_datetime: { fg: $peach attr: b }
    shape_list: { fg: $pink attr: b }
    shape_table: { fg: $pink attr: b }
    shape_record: { fg: $pink attr: b }
    shape_block: { fg: $pink attr: b }
    shape_filepath: $yellow
    shape_globpattern: { fg: $yellow attr: b }
    shape_variable: $flamingo
    shape_flag: { fg: $flamingo attr: b }
    shape_custom: $subtext_1
    shape_nothing: { fg: $peach attr: b}
}

