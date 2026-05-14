# Dotfiles
mv dots/. $HOME/

# Instalar paquetes
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable atim/starship
sudo dnf copr enable lihaohong/yazi
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

sudo dnf install git gh neovim ghostty code zsh starship yazi fastfetch zoxide atuin zsh-autosuggestions zsh-syntax-highlighting lsd bat fzf steam kvantum
flatpak install flathub com.brave.Browser dev.vencord.Vesktop com.bitwarden.desktop com.obsproject.Studio net.davidotek.pupgui2

# Paquetes que solo existen como RPMs
curl -L -o $HOME/pear-desktop.rpm https://github.com/pear-devs/pear-desktop/releases/download/v3.11.0/youtube-music-3.11.0.x86_64.rpm
sudo dnf install $HOME/pear-desktop.rpm
rm -rf $HOME/*.rpm

# Paquetes que solo existen como ejecutables sueltos
curl -fsSL https://fnm.vercel.app/install | bash # fnm

curl -fsSL https://pyenv.run | bash # pyenv
echo -e '\n# pyenv' >> ~/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc

# Tipografías que no existen como paquetes
mkdir -p ~/.local/share/fonts
git clone https://github.com/simpals/onest.git /tmp/onest
mv /tmp/onest/fonts/ttf/*.ttf "$HOME/.local/share/fonts/"

mkdir /tmp/nf && curl -L -o /tmp/nf/CascadiaCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.zip
unzip -o /tmp/nf/CascadiaCode.zip -d ~/.local/share/fonts/

rm -rf /tmp/onest && rm -rf /tmp/nf
