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
Install neovim (see website for latest stable install) ie using nvim.appimage
```
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage   //opens nvim
```
*check* website to get latest stable version

In order to be able to save files in nvim create a backup folder using:

```sh
mkdir -p ~/.local/share/nvim/tmp 
```
If plugins in vim don't work, reload Plug and reinstall and update Plugins.

### Path
if your shortcuts (example: n for opening nvim) aren't working check you paths:
```
echo $PATH
```
in my case, returns:
```
/anaconda3/bin:/home/amyalicedee/bin:/home/amyalicedee/.homesick/repos/homeshick/bin:/home/amyalicedee/bin/node-dir/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
```
this prints the paths that system looks in for programs. I generally use home/amyalicedee/bin and this install of neovim needs to be moved as follows:

```
$ mkdir bin
$ mv nvim.appimage bin/nvim
```
(I did not have a bin dir prior to this on my chromebook. To find where a program is use whereis or which)

### Autojump

install using:
```
sudo apt-get install autojump
```
restart terminal ( type `bash`)

### Serve

make sure you have a version of ruby installed (apt-get is fine for this) so that serve runs

