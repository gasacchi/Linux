# Gsc system commands

def help_msg [] {
  
}

# gsc sys <commands>
def sys_cmds [] {
  ["reboot" "shutdown" "info"]
}

# Gsc system commands 
def "gsc sys" [
  cmd?: string@sys_cmds # command that will be execute by system
] {
  if $cmd == (sys_cmds).0 {
    echo "Rebooting the system..."
    ^reboot
  } else if $cmd == (sys_cmds).1 {
    echo "Shutting down the system..."
    ^shutdown now
  } else if $cmd == (sys_cmds).2 {
    ^pfetch
  } else {
    help gsc sys
  }
}

# gsc pkg <commands>
def pkg_cmds [] {
  ["up" "update"
   "sync"
   "i" "install"
   "rm" "remove"
   "installed"
   "o" "orphan"
   "s" "search"]
}

# Gsc yay wrapper
def "gsc pkg" [
  cmd?: string@pkg_cmds # 
  ...pkgs 
] {
  if $cmd == "up" || $cmd == "update" {
    echo "yay -Syyu"
    ^yay -Syyu
  } else if $cmd == "sync" {
    echo "yay -Syy"
    ^yay -Syy
  } else if ($cmd == "i" || $cmd == "install") && ($pkgs | length) != 0 {
    ^yay -S $pkgs
  } else if $cmd == "rm" || $cmd == "remove" {
    ^yay -Rsc $pkgs
  } else if $cmd == "installed" {
     ^yay -Qe
  } else if $cmd == "o" || $cmd == "orphan" {
    ^yay -Qdtq
  } else if ($cmd == "s" || $cmd == "search") && ($pkgs | length) != 0 {
    ^yay -Ss $pkgs.0 
  } else {
    help gsc pkg
  }
}
