# Various function wrapper for some programs

# Broot
def-env j [
  --args (-a): string
] {
  let cmd_file = (^mktemp | str trim)
  if ($args | empty?) {
    ^broot --outcmd $cmd_file
  } else {
    ^broot $args --outcmd $cmd_file
  }
  let-env cmd = ((open $cmd_file) | str trim)
  ^rm $cmd_file
  cd ($env.cmd | str replace "cd" "" | str trim)
}

# gping (ping with graph)
def ping [
    host: string
    --color (-c): string = "#f6c177"
    ] {
  ^gping $host --color $color
}

# Gasacchi System 

# Control Gsc System
def "gsc sys" [
  cmd: string # The name of commands: update,sync
] {
  if $cmd == "update" {
    ^yay -Syyu
  } else if $cmd == "sync" {
    ^yay -Syy
  } else if $cmd == "reboot" {
    ^reboot
  } else if $cmd == "shutdown" {
    ^shutdown now
  } else {
    help "gsc sys"
  }
}

