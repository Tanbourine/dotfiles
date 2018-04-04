# dotfiles
Here are my dotfiles for commonly used programs
Feel free to use or suggest improvements!

I use GNU Stow to maintain a symlink with my git repo
see [this link](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) for a guide to do this yourself. It provides a much cleaner way to keep your dotfiles up to date. This will allow you to **git pull** to get the latest files. I setup the gitignore to ignore plugins and other files that will automatically download on install 


## vim

vim is life!

I split my modularized my .vimrc configurations and just sourced them all in my main .vimrc. It makes things much cleaner and easier to follow. 

To configure this on your computer from scratch:

### For MacOS:

- Install homebrew
```
i/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Install GNU stow
```
brew install stow
```
- Clone dotfiles and symlink it 
```
git clone https://github.com/Tanbourine/dotfiles.git ~/
cd dotfiles && stow vim
```

- Open vim and run **:PlugInstall**  to initialize plugins

