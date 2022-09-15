# build fnl file in wezterm dir

# path
let wezterm_path = "~/.config/wezterm"

# change directory to the path
cd $wezterm_path

# check if file extension is .fnl
def is_fnl [file: string] {
  ($file | split row ".").1 == "fnl"
}

# get only the name
def get_name [file: string] {
  ($file | split row ".").0
}

# compile all fennel file
ls | where type == file | get name | where (is_fnl $it) | each {
  |it| 
  echo $"Compiling: ($it)"
  ^fennel -c $it | save $"(get_name $it).lua"
}

