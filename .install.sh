#!/bin/bash

apt-get update && apt-get install -y build-essential wget curl nnn cmake clangd zip tldr libevent-dev bison ncurses-dev

bin_folder=~/.local/bin
app_folder=~/.apps
rm -rf $app_folder && mkdir $app_folder
rm -rf $bin_folder && mkdir -p $bin_folder

# Install Fuzzy Finder
install_fzf() {
  wget https://github.com/junegunn/fzf/releases/download/0.46.1/fzf-0.46.1-linux_amd64.tar.gz -O $app_folder/fzf.tar.gz
  mkdir $app_folder/fzf
  tar -xvf $app_folder/fzf.tar.gz -C $app_folder/fzf
  chmod +x $app_folder/fzf/fzf
  rm -f $bin_folder/fzf $app_folder/fzf.tar.gz
  ln -s $app_folder/fzf/fzf $bin_folder/fzf
}

# Install Ripgrep
install_ripgrep() {
  wget https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep-14.1.0-x86_64-unknown-linux-musl.tar.gz -O $app_folder/rg.tar.gz
  mkdir $app_folder/rg
  tar -xvf $app_folder/rg.tar.gz -C $app_folder/rg
  chmod +x $app_folder/rg/ripgrep-14.1.0-x86_64-unknown-linux-musl/rg
  rm -f $bin_folder/rg $app_folder/rg.tar.gz
  ln -s $app_folder/rg/ripgrep-14.1.0-x86_64-unknown-linux-musl/rg $bin_folder/rg
}

# Install navi
install_navi() {
  wget https://github.com/denisidoro/navi/releases/download/v2.23.0/navi-v2.23.0-x86_64-unknown-linux-musl.tar.gz -O $app_folder/navi.tar.gz
  mkdir $app_folder/navi
  tar -xvf $app_folder/navi.tar.gz -C $app_folder/navi
  chmod +x $app_folder/navi/navi
  rm -f $bin_folder/navi $app_folder/navi.tar.gz
  ln -s  $app_folder/navi/navi $bin_folder/navi
}

# Install zoxide
install_zoxide() {
  wget https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.2/zoxide-0.9.2-x86_64-unknown-linux-musl.tar.gz -O $app_folder/zoxide.tar.gz
  mkdir $app_folder/zoxide
  tar -xvf $app_folder/zoxide.tar.gz -C $app_folder/zoxide
  chmod +x $app_folder/zoxide/zoxide
  rm -f $bin_folder/zoxide $app_folder/zoxide.tar.gz
  ln -s  $app_folder/zoxide/zoxide $bin_folder/zoxide
}

# pdf to html
install_pdftohtml() {
  wget https://github.com/pdf2htmlEX/pdf2htmlEX/releases/download/v0.18.8.rc1/pdf2htmlEX-0.18.8.rc1-master-20200630-Ubuntu-focal-x86_64.AppImage -O $app_folder/pdf2html
  chmod +x $app_folder/pdf2html
  rm -f $bin_folder/pdf2html
  ln -s $app_folder/pdf2html $bin_folder/pdf2html
}

# Install neovim 0.9.4
install_neovim() {
  wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz -O $app_folder/nvim.tar.gz
  mkdir $app_folder/nvim
  tar -xvf $app_folder/nvim.tar.gz -C $app_folder
  chmod +x $app_folder/nvim-linux64/bin/nvim
  rm -f $bin_folder/nvim $app_folder/nvim.tar.gz
  ln -s $app_folder/nvim-linux64/bin/nvim $bin_folder/nvim
  rm -rf ~/.local/share/nvim && rm -rf ~/.config/nvim
  cd ~ && git submodule init ~/.config/nvim && git submodule update ~/.config/nvim
  nvim && cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim && make && cd -
}

# Install tmux
install_tmux() {
  app_folder_tmux="$app_folder/tmux"
  rm -rf $app_folder_tmux && mkdir $app_folder_tmux
  mkdir $app_folder_tmux/build $app_folder_tmux/install
  wget https://github.com/tmux/tmux/releases/download/3.4/tmux-3.4.tar.gz -O $app_folder_tmux/tmux-3.4.tar.gz
  tar -xvf $app_folder_tmux/tmux-3.4.tar.gz -C $app_folder_tmux
  rm $app_folder_tmux/tmux-3.4.tar.gz
  cd $app_folder_tmux/build && ../tmux-3.4/configure --prefix=$app_folder_tmux/install && make -j install prefix=$app_folder_tmux/install && cd -
  chmod +x $app_folder_tmux/install/bin/tmux
  rm -f $bin_folder/tmux
  ln -s $app_folder_tmux/install/bin/tmux $bin_folder/tmux
}

install_trans() {
  wget git.io/trans -O $bin_folder/ttr
  chmod +x $bin_folder/ttr
}

install_tgpt() {
  curl -sSL https://raw.githubusercontent.com/aandrew-me/tgpt/main/install | bash -s /root/.local/bin
}

# install delta difftool
install_delta() {
  wget https://github.com/dandavison/delta/releases/download/0.17.0/delta-0.17.0-x86_64-unknown-linux-gnu.tar.gz -O $app_folder/delta.tar.gz
  rm -rf $app_folder/delta
  mkdir $app_folder/delta
  tar -xvf $app_folder/delta.tar.gz -C $app_folder/delta
  chmod +x $app_folder/delta/delta-0.17.0-x86_64-unknown-linux-gnu/delta
  rm -f $bin_folder/delta $app_folder/delta.tar.gz
  ln -s $app_folder/delta/delta-0.17.0-x86_64-unknown-linux-gnu/delta $bin_folder/delta
}

install_lazydocker() {
  wget https://github.com/jesseduffield/lazydocker/releases/download/v0.23.3/lazydocker_0.23.3_Linux_x86_64.tar.gz -O $app_folder/lazydocker.tar.gz
  rm -rf $app_folder/lazydocker
  mkdir $app_folder/lazydocker && tar -zxf $app_folder/lazydocker.tar.gz -C $app_folder/lazydocker
  chmod +x $app_folder/lazydocker/lazydocker
  rm -f $bin_folder/lazydocker $app_folder/lazydocker.tar.gz
  ln -s $app_folder/lazydocker/lazydocker $bin_folder/lazydocker
}

install_lazygit() {
  wget https://github.com/jesseduffield/lazygit/releases/download/v0.43.1/lazygit_0.43.1_Linux_x86_64.tar.gz -O $app_folder/lazygit.tar.gz
  rm -rf $app_folder/lazygit
  mkdir $app_folder/lazygit && tar -zxf $app_folder/lazygit.tar.gz -C $app_folder/lazygit
  chmod +x $app_folder/lazygit/lazygit
  rm -f $bin_folder/lazygit $app_folder/lazygit.tar.gz
  ln -s $app_folder/lazygit/lazygit $bin_folder/lazygit
}

install_kitty() {
  wget https://github.com/kovidgoyal/kitty/releases/download/v0.36.2/kitty-0.36.2-x86_64.txz -O $app_folder/kitty.txz
  mkdir $app_folder/kitty && tar -Jxvf $app_folder/kitty.txz -C $app_folder/kitty
  chmod +x $app_folder/kitty/bin/kitty
  ln -s $app_folder/kitty/bin/kitty $bin_folder/kitty
}

# Run install
install_fzf
install_ripgrep
install_navi
install_zoxide
install_pdftohtml
install_neovim
install_tmux
install_trans
install_tgpt
install_delta
install_lazydocker
install_lazygit
install_kitty

# Prevent the script from running unintentionally
chmod -x ~/.install.sh

