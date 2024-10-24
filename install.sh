# upgrade installed package
pkg upgrade -y
# install package for neovim and rust
apt install -y rust rust-std-wasm32-unknown-unknown python ruff proot-distro neovim nodejs git stylua

if [[ -z $(cat ~/.bashrc | grep "~/.cargo/bin") ]]; then
  echo "-- Add cargo bin to PATH"
  echo -e "\nexport PATH=\$PATH:~/.cargo/bin" >>~/.bashrc
else
  echo "-- Already has cargo bin PATH"
fi

echo "-- Install wasm runner"
cargo install wasm-server-runner

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

echo "-- Copy nvim config files"
rm ~/.config/nvim.bak -rf
cp ~/.config/nvim/. ~/.config/nvim.bak -r
rm -rf ~/.config/nvim
mkdir ~/.config/nvim
cd ~/.config/nvim
git init ~/.config/nvim
git remote add origin git@github.com:studylessshape/neovim-config.git
git pull origin main

echo "-- Reload settings"
termux-reload-settings

echo "-- Finish"
