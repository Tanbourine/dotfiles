# dotfiles
Here are my dotfiles for commonly used programs
Feel free to use or suggest improvements!

I use GNU Stow to maintain a symlink with my git repo
see [this link](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) for a guide to do this yourself. It provides a much cleaner way to keep your dotfiles up to date. This will allow you to **git pull** to get the latest files. I setup the gitignore to ignore plugins and other files that will automatically download on install


## Installation Instructions

### For MacOS:

- Install [homebrew](https://brew.sh/)
```
i/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

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
cd dotfiles && stow vim && stow zsh
```

- Open vim and run **:PlugInstall**  to initialize plugins

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
