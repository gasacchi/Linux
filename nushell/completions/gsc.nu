# Gasacchi System 

def commands [] {
  ["update", "sync", "reboot", "shutdown"]
}

# Control Gsc System
def "gsc sys" [
  cmd: string@commands # The name of commands: update,sync,reboot,shutdown
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

