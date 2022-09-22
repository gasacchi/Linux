# Various function wrapper for some programs

# Broot
def-env j [
  --args (-a): string
] {
  let cmd_file = (^mktemp | str trim)
  if ($args | is-empty) {
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

