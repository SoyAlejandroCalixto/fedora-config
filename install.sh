# Instalar paquetes
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable atim/starship

sudo dnf install git gh neovim cascadia-code-nf-fonts ghostty zsh starship fastfetch zoxide atuin zsh-autosuggestions zsh-syntax-highlighting lsd bat fzf steam
flatpak install flathub com.brave.Browser dev.vencord.Vesktop com.bitwarden.desktop com.obsproject.Studio
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell # fnm

# Descargar RPMs restantes en ~/Descargas
curl -L -o $HOME/pear-desktop.rpm https://github.com/pear-devs/pear-desktop/releases/download/v3.11.0/youtube-music-3.11.0.x86_64.rpm
sudo dnf install $HOME/pear-desktop.rpm
rm -rf $HOME/*.rpm

# Dotfiles
git clone https://github.com/SoyAlejandroCalixto/arch4devs $HOME/arch4devs
rm -rf $HOME/.config/ghostty/ && mv $HOME/arch4devs/.config/ghostty/ $HOME/.config/
rm -rf $HOME/.config/starship.toml && mv $HOME/arch4devs/.config/starship.toml $HOME/.config/
rm -rf $HOME/arch4devs

cat << EOF > $HOME/.zshrc
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias vim=nvim
alias rcat=/usr/bin/cat
alias cat=bat
alias rls=/usr/bin/ls
alias ls=lsd

eval "$(fnm env --use-on-cd --shell zsh)"

eval "$(starship init zsh)"
EOF

cat << EOF > $HOME/.gitconfig
[credential "https://github.com"]
	helper =
	helper = !/usr/bin/gh auth git-credential
[credential "https://gist.github.com"]
	helper =
	helper = !/usr/bin/gh auth git-credential
[user]
	email = soyalejandrocalixto@gmail.com
	name = soyalejandrocalixto
[core]
	editor = zeditor
	autocrlf = input
EOF
