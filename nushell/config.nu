# Nushell Config File

# sourcing scripts
# source alias
source ~/.config/nushell/alias.nu
source ~/.config/nushell/functions.nu
source ~/.config/nushell/completions.nu
source ~/.config/nushell/keymaps.nu
source ~/.config/nushell/menus.nu
source ~/.config/nushell/themes/catppuccin_mocha.nu

# Get just the extern definitions without the custom completion commands

# The default config record. This is where much of your global configuration is setup.
let-env config = {
  show_banner: false
  filesize_metric: true
  table_mode: reinforced # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
  use_ls_colors: true
  rm_always_trash: true
  # color_config: $rose_pine# if you want a light theme, replace `$dark_theme` to `$light_theme`
  color_config: $catppuccin_mocha# if you want a light theme, replace `$dark_theme` to `$light_theme`
  use_grid_icons: true
  footer_mode: "25" # always, never, number_of_rows, auto
  quick_completions: true  # set this to false to prevent auto-selecting completions when only one remains
  partial_completions: true  # set this to false to prevent partial filling of the prompt
  completion_algorithm: "prefix"  # prefix, fuzzy
  float_precision: 2
  # buffer_editor: "emacs" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
  use_ansi_coloring: true
  filesize_format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
  edit_mode: emacs # emacs, vi
  max_history_size: 10000 # Session has to be reloaded for this to take effect
  sync_history_on_enter: true # Enable to share the history between multiple sessions, else you have to close the session to persist history to file
  history_file_format: "plaintext" # "sqlite" or "plaintext"
  shell_integration: true # enables terminal markers and a workaround to arrow keys stop working issue
  disable_table_indexes: false # set to true to remove the index column from tables
  cd_with_abbreviations: false # set to true to allow you to do things like cd s/o/f and nushell expand it to cd some/other/folder
  case_sensitive_completions: false # set to true to enable case-sensitive completions
  enable_external_completion: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up my be very slow
  max_external_completion_results: 100 # setting it lower can improve completion performance at the cost of omitting some options

  # A strategy of managing table view in case of limited space.
  table_trim: {
    methodology: wrapping, # truncating
    # A strategy which will be used by 'wrapping' methodology
    wrapping_try_keep_words: true,
    # A suffix which will be used with 'truncating' methodology
    # truncating_suffix: "..."
  }

  hooks: {
    pre_prompt: [{
      $nothing  # replace with source code to run before the prompt is shown
    }]
    pre_execution: [{
      $nothing  # replace with source code to run before the repl input is run
    }]
    env_change: {
      PWD: [{|before, after|
        $nothing  # replace with source code to run if the PWD environment is different since the last repl input
      }]
    }
  }
  menus: $menus
  keybindings: $keymaps
}

# source starship
source ~/.cache/starship/init.nu

