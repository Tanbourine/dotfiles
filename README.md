# dotfiles
Here are my dotfiles for commonly used programs
Feel free to use or suggest improvements!

I use GNU Stow to maintain a symlink with my git repo
see [this link](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) for a guide to do this yourself. It provides a much cleaner way to keep your dotfiles up to date. This will allow you to **git pull** to get the latest files. I setup the gitignore to ignore plugins and other files that will automatically download on install


## Installation Instructions

### For Linux:

#### Install basic tools
```
# utilities
sudo apt-get -y install vim git stow curl ranger terminator zsh

# programming 
sudo apt-get -y install python-dev python3-dev build-essential cmake llvm

# visual
sudo apt-get -y install feh compton 

# fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

#### SSH for Git
1. `ssh-keygen`
2. Enter a password for your ssh key
3. Copy and paste `cat ~/.shh/id_rsa.pub` to your git authentication
4. `eval 'ssh-agent'`
5. `ssh-add ~/.ssh/id_rsa`

#### Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
```
# Automatic method
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# You can do it manually too!
1. `git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh`
2. `cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
3. `chsh -s /bin/zsh`

# Reboot your terminal and zsh will be loaded!
```

#### Clone dotfiles and symlink it
```
# clone dotfiles repo via HTTP 
git clone https://github.com/Tanbourine/dotfiles.git ~/dotfiles

# OR clone dotfiles repo via SSH
git clone git@github.com:Tanbourine/dotfiles.git

# Remove pre-populated files, if any
rm ~/.zshrc
rm -r ~/.config/ranger
rm -r ~/.config/i3

mkdir ~/.config/ranger
mkdir ~/.config/i3

# symbolically link files stored in ~/
cd ~/dotfiles && stow vim && stow zsh && stow git

# i3 and ranger files are stored in ~/.config
cd ~/dotfiles
stow ranger -t ~/.config/ranger
stow i3 -t ~/.config/i3
```

#### Vim Setup
- Open vim and run `**:PlugInstall**`  to initialize plugins
    - If you have git authentication errors, make sure sslVerify is false in ~/.gitconfig

##### YouCompleteMe
[YouCompleteMe](https://github.com/Valloric/YouCompleteMe) is a handy completion engine that
requires a little extra work to install
```
cd ~/.vim/plugged/youcompleteme
./install.py --clang-completer
```

#### i3 gaps setup [instructions](https://github.com/pasiegel/i3-gaps-install-ubuntu)
```
# installing dependencies
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool

# run this if you have issues with libxcb-xrm-dev
mkdir tmp
cd /tmp
git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
sudo make install


# install gaps here
cd /tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install


# install status bar and application launcher
sudo apt-get install i3status dmenu

#reboot your computer and select i3 from the login screen

```


### For MacOS:

- Install [homebrew](https://brew.sh/)
```
i/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade
```

- Install [iTerm2](https://www.iterm2.com/)

- Install oh-my-zsh [Wiki](https://github.com/robbyrussell/oh-my-zsh/wiki)
```
brew install zsh zsh-completions
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
- Install GNU stow
```
brew install stow
```

- Clone dotfiles and symlink it
```
git clone https://github.com/Tanbourine/dotfiles.git ~/
cd ~/ rm .zshrc
cd dotfiles && stow vim && stow zsh
```

- To get the zsh powerline to display fonts correctly, install a powerline font
I use Source Code Pro from https://github.com/powerline/fonts 
Change your iTerm font to Souce Code Pro for Powerline


- Open vim and run **:PlugInstall**  to initialize plugins

- Finish installation of YouCompleteMe
```
brew install --with-toolchain llvm
python ~/.vim/plugged/youcompleteme/install.py
```

- Enjoy! 

### For Windows:
- Burn your computer
- But really it's work in progress


## vim

vim is life!

I split my modularized my .vimrc configurations and just sourced them all in my main .vimrc. It makes things much cleaner and easier to follow.

- settings.vim
- plugins.vim
- plugin_configs.vim
