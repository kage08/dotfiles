# Install zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)"

#Neovim
wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz
tar xvf nvim-linux64.tar.gz
ln -s $HOME/nvim-linux64/bin/nvim ~/.local/bin/nvim
rm nvim-linux64.tar.gz
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Add ~/.local/bin to PATH
echo -e '\nexport PATH="/home/user/.local/bin:$PATH"\n' >> ~/.bashrc
source ~/.bashrc

# Install OMZ
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh
curl -sS https://starship.rs/install.sh ~/.local/bin | sh -s -- --bin-dir ~/.local/bin
echo -e '\nexport PATH="/home/user/.local/bin:$PATH"\n' >> ~/.zshrc
echo -e 'eval "$(starship init zsh)"\n' >> ~/.zshrc
source ~/.zshrc

git clone https://github.com/kage08/dotfiles.git
cd dotfiles

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Sub-string search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

./pull.sh
source ~/.zshrc
cd

git config --global user.email "harshavardhan864.hk@gmail.com"
git config --global user.name "kage08"

# Install plugins
nvim -c 'PlugInstall --sync' +qa

# Cleanup
cd
rm -rf dotfiles
rm -rf nvim-linux64
