# Assume .dotfiles/ repo is in home (~) directory

# bash config
ln -sf ./.bashrc ~/.bashrc

# git config
ln -sf ./git/.gitconfig ~/.gitconfig
ln -sf ./git/.gitconfig-work ~/.gitconfig-work

# poetry config
ln -sf ./.config/pypoetry/.config.toml ~/.config/pypoetry/.config.toml
