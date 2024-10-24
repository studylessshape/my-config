# upgrade installed package
pkg upgrade -y
# install package for neovim and rust
apt install -y rust rust-std-wasm32-unknown-unknown python ruff proot-distro neovim nodejs git stylua

# sync git repo
git pull --recurse-submodules

if [[ -z $(cat ~/.bashrc | grep "~/.cargo/bin") ]]; then
  echo "-- Add cargo bin to PATH"
  echo -e "\nexport PATH=\$PATH:~/.cargo/bin" >>~/.bashrc
else
  echo "-- Already has cargo bin PATH"
fi

echo "-- Install wasm runner"
cargo install wasm-server-runner

echo "-- Copy nvim config files"
cp ~/.config/nvim ~/.config/nvim.bak -r
rm -rf ~/.config/nvim
cp ./nvim ~/.config/nvim -r

if [ ".termux" = "$(ls ~ -a | grep .termux)" ]; then
  echo "-- Backup termux settings"
  mv ~/.termux/termux.properties ~/.termux/termux.properties.bak
  mv ~/.termux/font.ttf ~/.termux/font.ttf.bak
else
  echo "-- Make .termux folder"
  mkdir ~/.termux
fi

echo "-- Copy settings"
cp ./termux/styling/* ~/.termux/

echo "-- Reload settings"
termux-reload-settings

echo "-- Finish"
