def add_category [name, val: string] {
  $name | insert "category" $val
}

let base = [
  {name: "linux", description: "linux kernel"}
  {name: "linux-firmware", description: "linux firmware"}
  {name: "linux-headers", description: "linux headers file"}
  {name: "intel-ucode", description: "intel microcode"}
  {name: "xf86-video-intel", description: "intel video driver"}
  {name: "dosfstool", description: "DOS disk utility"}
  {name: "exfatprogs", description: "Exfat disk utility"}
  {name: "ntfs-3g", description: "NTFS disk utility"}
  {name: "grub", description: "Grub boot manager"}
  {name: "efibootmgr", description: "UEFI boot manager"}
  {name: "reflector", description: "Archlinux mirrorlist updater"}
  {name: "man-db", description: "Manual database"}
  {name: "man-pages", description: "Manual pages"}
  {name: "networkmanager", description: "Network Managers"}
  {name: "opendoas", description: "Super User tools"}
  {name: "xdg-user-dirs", description: "Xdg user directiory tools"}
]

let development = [
  {name: "git", description: "git version control"}
  {name: "rustup", description: "rust installer"}
  {name: "rust-analyzer", description: "rust code analyzer"}
  {name: "upwork", description: "Freelance tools"}
  {name: "wezterm-nightly-bin", description: "Terminal Emulator"}
  {name: "nushell" , description: "New kind of shell written in rust"}
  {name: "starship", description: "Pretty prompt"}
  {name: "nodejs", description: "Nodejs js on backend"}
  {name: "helix", description: "Helix text editor"}
  {name: "wl-clipboard", description: "Wayland clipboard"}
  {name: "figma-linux-bin", description: "Web UI Design tools"}
  {name: "pnpm-bin", description: "Better npm"}
  {name: "fennel", description: "Fennel programming language"}
  {name: "lua-language-server", description: "lua language server"}
  {name: "just", description: "Command runner like make"}
]

let hardware_development = [
  {name: "kicad", description: "PCB and semantic editor"}
  {name: "kicad-library", description: "Kicad library"}
  {name: "kicad-library-3d", description: "Kicad 3D library"}
  {name: "librecad", description: "2D CAD program"}
]

let daily = [
  {name: "brave-beta-bin", description: "Brave browser"}
  {name: "mpv", description: "Video Player"}
  {name: "virtualbox", description: "Virtual Machine"}
]

let cli = [
  {name: "github-cli", description: "Github CLI"}
  {name: "bat", description: "Cat alternative"}
  {name: "bottom", description: "System resources monitor"}
  {name: "broot", description: "New way to navigate to file/folder"}
  {name: "duf", description: "Disk usage / free Utility better than df"}
  {name: "dust", description: "Intuitive version from du"}
  {name: "pastel", description: "Color manipulation tools"}
  {name: "onefetch", description: "Git repo details info"}
  {name: "gping", description: "Ping with graph"}
  {name: "git-delta", description: "Git syntax highlighting pager"}
  {name: "gitui", description: "Git Terminal User Interface"}
  {name: "hyperfine", description: "Benchmarking tools"}
  {name: "ripgrep", description: "Rg alternative"}
  {name: "tealdeer", description: "Command line cheatsheet"}
  {name: "tokei", description: "Count line of code"}
  {name: "unrar", description: "Rar tools"}
  {name: "unzip", description: "Zip tools"}
  {name: "wget", description: "Download file"}
  {name: "pfetch", description: "System informations"}
  {name: "lolcat", description: "Rainbow cat"}
  {name: "nyancat", description: "Refresh with cat"}
  {name: "glow", description: "Markdown previewer in terminal"}
  {name: "android-file-transfer", description: "Android File Transfer"}
  {name: "android-tools", description: "Android tools"}
  {name: "yt-dlp", description: "Download youtube content"}
]

let fonts = [
  {name: "noto-fonts" , description:"Noto fonts"}
  {name: "noto-fonts-cjk" , description:"Noto Fonts Japan,China,Korea"}
  {name: "noto-fonts-emoji" , description:"Noto Fonts emoji"}
  {name: "nerd-fonts-jetbrains-mono" , description:"Nerd fonts jetbrains"}
]

let desktop = [
  {name: "xorg", description: "X display server"}
  {name: "gnome", description: "Gnome Desktop Environment"}
  {name: "gnome-tweaks", description: "Gnome tweak tools"}
  {name: "gnome-browser-connector", description: "Gnome browser extensions plugin"}
  {name: "catppuccin-gtk-theme-mocha", description: "Catppuccin Mocha GTK Theme"}
  {name: "pulseaudio", description: "Audio tools"}
  {name: "puseaudio-alsa", description: "Alsa pulse audio integrations"}
  {name: "alsa-utils", description: "Alsa extra utils"}
]

let tauri_requirement = [
  {name: "cargo-tauri", description: "tauri cli"}
  {name: "webkit2gtk", description: ""}
  {name: "base-devel", description: ""}
  {name: "curl", description: ""}
  {name: "wget", description: ""}
  {name: "openssl", description: ""}
  {name: "appmenu-gtk-module", description: ""}
  {name: "gtk3", description: ""}
  {name: "libappindicator-gtk3", description: ""}
  {name: "librsvg", description: ""}
  {name: "libvips", description: ""}
]

let pnpm_global = [
  {name: "@prisma/language-server", description: "Prisma language server"}
  {name: "@taplo/cli", description: "Toml linting"}
  {name: "svelte-language-server", description: "Svelte language server"}
  {name: "typescript", description: "Typescript programming language"}
  {name: "typescript-language-server", description: "Typescript language server"}
  {name: "vscode-langservers-extracted", description: "Vscode extracted: css, html,json"}
  {name: "yaml-language-server", description: "Yaml language server"}
]

let packages = (add_category $base "base"
                | append (add_category $development "dev")
                | append (add_category $hardware_development "hardware-dev")
                | append (add_category $daily "daily")
                | append (add_category $cli "cli")
                | append (add_category $fonts "fonts")
                | append (add_category $desktop "desktop")
                | append (add_category $tauri_requirement "tauri")
                | append (add_category $pnpm_global "pnpm")
                )

echo $packages


