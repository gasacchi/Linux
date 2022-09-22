source ~/.config/nushell/themes/catppuccin_mocha.nu
let menus = [
  # Configuration for default nushell menus
  # Note the lack of souce parameter
  {
    name: completion_menu
    only_buffer_difference: false
    marker: " completions: "
    type: {
        layout: columnar
        columns: 4
        col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
        col_padding: 2
    }
    style: {
        text: $blue
        selected_text: {bg: $surface_2 fg: $text}
        description_text: $green
    }
  }
  {
    name: history_menu
    only_buffer_difference: true
    marker: " history: "
    type: {
        layout: list
        page_size: 10
    }
    style: {
        text: $blue
        selected_text: {bg: $surface_2 fg: $text}
        description_text: $green
    }
  }
  {
    name: help_menu
    only_buffer_difference: true
    marker: " help: "
    type: {
        layout: description
        columns: 4
        col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
        col_padding: 2
        selection_rows: 4
        description_rows: 10
    }
    style: {
        text: $blue
        selected_text: {bg: $surface_2 fg: $text}
        description_text: $green
    }
  }
  # Example of extra menus created using a nushell source
  # Use the source field to create a list of records that populates
  # the menu
  {
    name: commands_menu
    only_buffer_difference: false
    marker: " commands: "
    type: {
        layout: columnar
        columns: 4
        col_width: 20
        col_padding: 2
    }
    style: {
        text: $blue
        selected_text:{bg: $surface_2 fg: $text}
        description_text: $green
    }
    source: { |buffer, position|
        $nu.scope.commands
        | where command =~ $buffer
        | each { |it| {value: $it.command description: $it.usage} }
    }
  }
  {
    name: vars_menu
    only_buffer_difference: true
    marker: " vars: "
    type: {
        layout: list
        page_size: 10
    }
    style: {
        text: $blue
        selected_text: {bg: $surface_2 fg: $text}
        description_text: $green
    }
    source: { |buffer, position|
        $nu.scope.vars
        | where name =~ $buffer
        | sort-by name
        | each { |it| {value: $it.name description: $it.type} }
    }
  }
  {
    name: commands_with_description
    only_buffer_difference: true
    marker: " commands: "
    type: {
        layout: description
        columns: 4
        col_width: 20
        col_padding: 2
        selection_rows: 4
        description_rows: 10
    }
    style: {
        text: $blue
        selected_text: {bg: $surface_2 fg: $text}
        description_text: $green
    }
    source: { |buffer, position|
        $nu.scope.commands
        | where command =~ $buffer
        | each { |it| {value: $it.command description: $it.usage} }
    }
  }
]