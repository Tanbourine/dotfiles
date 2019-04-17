# Git Cheatsheet

## Common Workflow
1. `git pull` to sync your local repo to server repo
2. Write code however you like
3. `git add` to stage files you want to commit
4. `git commit -m "commit message" to commit the staged files to your local repo 
5. `git push` to push commits to server repo


## Multiple ways to do the same thing
### `git add`
```
# stage all files in repo
git add .
# OR
git add -A
# OR
git add --all
```


## SSH for Git
In order to push to certain secure repositories, you'll need to set up your SSH key with the repo to
show that you're a trusted computer.

1. `ssh-keygen`
2. Enter a password for your ssh key
3. Copy and paste `cat ~/.shh/id_rsa.pub` to your git authentication
4. `eval 'ssh-agent'`
5. `ssh-add ~/.ssh/id_rsa`



## Aliases
These aliases make it easier to constantly type out these commands.
```
st = status
co = checkout
ci = commit -m 
br = branch
cl = clone

# this is without aliases
git status
git add .
git commit -m "your message here"
git push


# this is with aliases
git st
git add .
git ci "your message here"
git push
```



