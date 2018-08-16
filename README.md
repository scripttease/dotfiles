dotfiles
========

## Usage

```sh
# Install homeshick, the dotfile manager
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick

# Add this repo to homeshick
~/.homesick/repos/homeshick/bin/homeshick clone git@github.com:scripttease/dotfiles

# Link the files into place
~/.homesick/repos/homeshick/bin/homeshick link dotfiles
```
## New Installs

### NVIM

In order to be able to save files in nvim create a backup folder using:

```sh
mkdir -p ~/.local/share/nvim/tmp 
```
