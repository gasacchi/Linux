-- Installed packages

-- Base system packages
local base = {
  { name = 'base', desc = 'base Archlinux packages' },
  { name = 'linux-zen', desc = 'linux zen kernel' },
  { name = 'linux-firmware', desc = 'linux firmware' },
  { name = 'linux-zen-headers', desc = 'linux zen headers file' },
  { name = 'intel-ucode', desc = 'intel microcode' },
  { name = 'xf86-video-intel', desc = 'intel video driver' },
  { name = 'dosfstool', desc = 'DOS disk utility' },
  { name = 'exfatprogs', desc = 'Exfat disk utility' },
  { name = 'ntfs-3g', desc = 'NTFS disk utility' },
  { name = 'grub', desc = 'Grub boot manager' },
  { name = 'efibootmgr', desc = 'UEFI boot manager' },
  { name = 'reflector', desc = 'Archlinux mirrorlist updater' },
  { name = 'man-db', desc = 'Manual database' },
  { name = 'man-pages', desc = 'Manual pages' },
  { name = 'networkmanager', desc = 'Network Managers' },
  { name = 'opendoas', desc = 'Super User tools' },
  { name = 'xdg-user-dirs', desc = 'Xdg user directiory tools' },
  { name = 'yay', desc = 'Aur helper' },
}

-- Fonts packages
local fonts = {
  { name = 'noto-fonts', desc = 'Noto fonts' },
  { name = 'noto-fonts-cjk', desc = 'Noto Fonts Japan,China,Korea' },
  { name = 'noto-fonts-emoji', desc = 'Noto Fonts emoji' },
  { name = 'nerd-fonts-jetbrains-mono', desc = 'Nerd fonts jetbrains' },
}

-- Desktop packages
local destop = {
  { name = 'xorg', desc = 'X display server' },
  { name = 'gnome', desc = 'Gnome Desktop Environment' },
  { name = 'gnome-tweaks', desc = 'Gnome tweak tools' },
  { name = 'gnome-browser-connector', desc = 'Gnome browser extensions plugin' },
  { name = 'catppuccin-gtk-theme-mocha', desc = 'Catppuccin Mocha GTK Theme' },
  { name = 'pulseaudio', desc = 'Audio tools' },
  { name = 'puseaudio-alsa', desc = 'Alsa pulse audio integrations' },
  { name = 'alsa-utils', desc = 'Alsa extra utils' },
}


-- development tools
local dev_tool = {
  { name = 'git', desc = 'git version control' },
  { name = 'mdbook', desc = 'make book with markdown' },
  { name = 'rustup', desc = 'rust installer' },
  { name = 'rust-analyzer', desc = 'rust code analyzer' },
  { name = 'upwork', desc = 'Freelance tools' },
  { name = 'wezterm-nightly-bin', desc = 'Terminal Emulator' },
  { name = 'fish', desc = 'fish shell' },
  { name = 'starship', desc = 'Pretty prompt' },
  { name = 'nodejs', desc = 'Nodejs js on backend' },
  { name = 'helix-git', desc = 'Helix text editor' },
  { name = 'wl-clipboard', desc = 'Wayland clipboard' },
  { name = 'figma-linux-bin', desc = 'Web UI Design tools' },
  { name = 'pnpm-bin', desc = 'Better npm' },
  { name = 'lua-language-server', desc = 'lua language server' },
  { name = 'just', desc = 'Command runner like make' },
}

-- Tauri development
local tauri_dev = {
  { name = 'cargo-tauri', desc = 'tauri cli' },
  { name = 'webkit2gtk', desc = '' },
  { name = 'base-devel', desc = '' },
  { name = 'curl', desc = '' },
  { name = 'wget', desc = '' },
  { name = 'openssl', desc = '' },
  { name = 'appmenu-gtk-module', desc = 'Gtk appmenu module' },
  { name = 'gtk3', desc = '' },
  { name = 'libappindicator-gtk3', desc = '' },
  { name = 'librsvg', desc = '' },
  { name = 'libvips', desc = '' },
}

-- pnpm global packages
local pnpm = {
  { name = '@prisma/language-server', desc = 'Prisma language server' },
  { name = '@taplo/cli', desc = 'Toml linting' },
  { name = 'svelte-language-server', desc = 'Svelte language server' },
  { name = 'typescript', desc = 'Typescript programming language' },
  { name = 'typescript-language-server', desc = 'Typescript language server' },
  { name = 'vscode-langservers-extracted', desc = 'Vscode extracted= css, html,json' },
  { name = 'yaml-language-server', desc = 'Yaml language server' },
}

-- cli utility tools
local cli_utils = {
  { name = 'github-cli', desc = 'Github CLI' },
  { name = 'bat', desc = 'Cat alternative' },
  { name = 'fd', desc = 'find alternative' },
  { name = 'exa', desc = 'ls alternative' },
  { name = 'bottom', desc = 'System resources monitor' },
  { name = 'broot', desc = 'New way to navigate to file/folder' },
  { name = 'duf', desc = 'Disk usage / free Utility better than df' },
  { name = 'dust', desc = 'Intuitive version from du' },
  { name = 'pastel', desc = 'Color manipulation tools' },
  { name = 'onefetch', desc = 'Git repo details info' },
  { name = 'gping', desc = 'Ping with graph' },
  { name = 'git-delta', desc = 'Git syntax highlighting pager' },
  { name = 'gitui', desc = 'Git Terminal User Interface' },
  { name = 'hyperfine', desc = 'Benchmarking tools' },
  { name = 'ripgrep', desc = 'Rg alternative' },
  { name = 'tealdeer', desc = 'Command line cheatsheet' },
  { name = 'tokei', desc = 'Count line of code' },
  { name = 'unrar', desc = 'Rar tools' },
  { name = 'unzip', desc = 'Zip tools' },
  { name = 'wget', desc = 'Download file' },
  { name = 'pfetch', desc = 'System informations' },
  { name = 'lolcat', desc = 'Rainbow cat' },
  { name = 'nyancat', desc = 'Refresh with cat' },
  { name = 'glow', desc = 'Markdown previewer in terminal' },
  { name = 'android-file-transfer', desc = 'Android File Transfer' },
  { name = 'android-tools', desc = 'Android tools' },
  { name = 'yt-dlp', desc = 'Download youtube content' },
  { name = 'inlyne', desc = 'markdown viewer' },
}

-- pcb and 3d development tools
local hw_dev = {
  { name = 'kicad', desc = 'PCB and semantic editor' },
  { name = 'kicad-library', desc = 'Kicad library' },
  { name = 'kicad-library-3d', desc = 'Kicad 3D library' },
  { name = 'librecad', desc = '2D CAD program' },
}

-- daily packges
local daily = {
  { name = 'brave-beta-bin', desc = 'Brave browser' },
  { name = 'discord', desc = 'Discord' },
  { name = 'mpv', desc = 'Video Player' },
  { name = 'virtualbox', desc = 'Virtual Machine' },
  { name = 'waydroid', desc = 'Android on linux' },
}

---@diagnostic disable-next-line: unused-local
local todo = {
  grex = 'regex gen',
  htmlq = 'jq for html',
  jless = 'command line json viewer',
  jql = 'json query language',
  miniserve = 'simple serve file over http',
  ouch = 'compression and decompression tools',
  topgrade = 'update everything',
  xcp = 'extended cp',
}

local system = {
  base,
  fonts,
  destop,
}

local dev = {
  dev_tool,
  hw_dev,
  tauri_dev,
  pnpm,
  cli_utils,
}

---@diagnostic disable-next-line: unused-local
local packages = {
  system = system,
  dev = dev,
  daily = daily,
}

