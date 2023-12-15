# Install zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)"

#Neovim
wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
tar xvf nvim-linux64.tar.gz
ln -s $HOME/nvim-linux64/bin/nvim ~/.local/bin
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
echo -e '\nexport PATH="$HOME/.local/bin:$PATH"\n' >> ~/.zshrc
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

# Node install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.zshrc
nvm install --lts
nvm use --lts

# Coc Compile
cd ~/.local/share/nvim/plugged/coc.nvim
npm install yarn -g
yarn install

# Miniconda install
cd
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# For arm: wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
conda install mamba -c conda-forge -y
mamba clean --all -y
rm ./Miniconda3-latest-Linux-x86_64.sh

# Install Rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Juliaup
curl -fsSL https://install.julialang.org | sh

# Install libssl-dev pkg-config
# Rust utils
cargo install jql exa bat du-dust ripgrep tokei hyperfine ytop zoxide git-delta bottom sd dutree flamegraph samply
cargo install bob-nvim gitui irust evcxr_jupyter cargo-info nu zellij mprocs coreutils cargo-update counts exa navi

# latex install
cd
zcat install-tl-unx.tar.gz | tar xf -
cd install-tl-* # fill this
perl ./install-tl # Make sure the insstall folder is correct <D>
# Should takke 2 hours!!
echo -e '\nexport PATH="$HOME/.local/texlive/2022/bin:$PATH"\n' >> ~/.zshrc

# Lunarvim install
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
