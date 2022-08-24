let base    = "#191724"
let surface = "#1f1d2e"
let overlay = "#26233a"
let muted   = "#6e6a86"
let subtle  = "#908caa"
let text    = "#e0def4"
let love    = "#eb6f92"
let gold    = "#f6c177"
let rose    = "#ebbcba"
let pine    = "#31748f"
let foam    = "#9ccfd8"
let iris    = "#c4a7e7"
let hl_low  = "#21202e"
let hl_med  = "#403d52"
let hl_high = "#524f67"

let rose_pine = {
    # color for nushell primitives
    separator: $hl_high
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: {fg: $love attr: b}
    empty: $muted
    bool: $pine
    int: $iris
    filesize: $gold
    duration: $foam
    date: $subtle
    range: $text
    float: $iris
    string: $gold
    nothing: $muted
    binary: $text
    cellpath: $love
    row_index: {fg: $muted attr: b}
    record: $rose
    list: $subtle
    block: $pine
    hints: $muted

    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: $base bg: $love attr: b }
    shape_binary: { fg: $text attr: b }
    shape_bool: { fg: $pine attr: b }
    shape_int: { fg: $iris attr: b }
    shape_float: { fg: $iris attr: b }
    shape_range: { fg: $text attr: b }
    shape_internalcall: { fg: $gold attr: b }
    shape_external: { fg: $gold attr: b }
    shape_externalarg: { fg: $iris attr: b }
    shape_literal: $text
    shape_operator: $rose
    shape_signature: { fg: $iris attr:b }
    shape_string: $gold
    shape_string_interpolation: { fg: $foam attr: b }
    shape_datetime: { fg: $subtle attr: b }
    shape_list: { fg: $subtle attr: b }
    shape_table: { fg: $pine attr: b }
    shape_record: { fg: $foam attr: b }
    shape_block: { fg: $pine attr: b }
    shape_filepath: $love
    shape_globpattern: { fg: $foam attr: b }
    shape_variable: $rose
    shape_flag: { fg: $foam attr: b }
    shape_custom: $muted
    shape_nothing: { fg: $muted attr: b}
}
