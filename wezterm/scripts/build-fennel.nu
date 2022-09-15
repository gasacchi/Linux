# build fnl file in wezterm dir

# path
let wezterm_path = "~/.config/wezterm"
let workspace_path = "~/Dev/github/Linux"

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


# TODO: fix this mess
# compile all fennel file
ls | where type == file | get name | where (is_fnl $it) | each {
  |it| 
  echo $"Compiling to build/: ($it)"
  pwd

  let not_exist = (ls | where type == dir | where name == build | is-empty)
  if $not_exist {
    mkdir build
    ^bash -c $"($workspace_path)/bin/fennel -c ($wezterm_path)/($it) > ./build/(get_name $it).lua"
  } else {
    ^bash -c $"($workspace_path)/bin/fennel -c ($wezterm_path)/($it) > ./build/(get_name $it).lua"
  }
}

