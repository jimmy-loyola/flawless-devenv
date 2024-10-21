# Go to home directory
cd ~

# Install binaries
curl -s https://raw.githubusercontent.com/jimmy-loyola/flawless-devenv/refs/heads/main/.install.sh

# Get support files
wget https://raw.githubusercontent.com/jimmy-loyola/flawless-devenv/refs/heads/main/.alias -O ~/.alias
wget https://raw.githubusercontent.com/jimmy-loyola/flawless-devenv/refs/heads/main/.colors -O ~/.colors
wget https://raw.githubusercontent.com/jimmy-loyola/flawless-devenv/refs/heads/main/.funcs -O ~/.funcs
wget https://raw.githubusercontent.com/jimmy-loyola/flawless-devenv/refs/heads/main/.profile -O .profile
wget https://raw.githubusercontent.com/jimmy-loyola/flawless-devenv/refs/heads/main/.tmux.conf -O .tmux.conf

# update bash
wget https://raw.githubusercontent.com/jimmy-loyola/flawless-devenv/refs/heads/main/.bashrc -O .bashrc
source .bashrc

