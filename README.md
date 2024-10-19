# Development environment

## Installation

```bash
# run sh shell to avoid some bash pitfalls
sh

# Run the following commands (this will delete the files in your home directory)
cd ~
rm -rf $(find ~)
git clone https://github.com/jimmy-loyola/flawless-devenv.git .
chmod +x .install.sh
./.install.sh
exit # go back to bash or whatever you were
```

