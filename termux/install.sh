pkg upgrade -y
apt install -y rust rust-std-wasm32-unknown-unknown python ruff proot-distro neovim nodejs

if [[ -z $(cat ~/.bashrc | grep "~/.cargo/bin") ]]; then
  echo "-- Add cargo bin to PATH"
  echo -e "\nexport PATH=\$PATH:~/.cargo/bin" >>~/.bashrc
else
  echo "-- Already has cargo bin PATH"
fi

if [ ".termux" = "$(ls ~ -a | grep .termux)" ]; then
  echo "-- Backup termux settings"
  mv ~/.termux/termux.properties ~/.termux/termux.properties.bak
  mv ~/.termux/font.ttf ~/.termux/font.ttf.bak
else
  echo "-- Make .termux folder"
  mkdir ~/.termux
fi

echo "-- Copy settings"
cp ./styling/* ~/.termux/

echo "-- Reload settings"
termux-reload-settings

echo "-- Finish"
