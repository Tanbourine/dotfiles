# Git Cheatsheet

## Common Workflow
1. `git pull` to sync your local repo to server repo
2. Write code however you like
3. `git status` to see which files have changed and need to be staged
4. `git add` to stage files you want to commit
5. `git commit -m "commit message" to commit the staged files to your local repo 
6. `git push` to push commits to server repo


## Multiple ways to do the same thing
### `git add`
#### Add all files in the repo
```
git add .
git add -A
git add --all
```

#### Add specific files only
```
git add <file1>
git add <file1> <file2> <file3>
```

### `git commit`
Note that `git commit` will commit all the staged files together with the same commit message. The
"cleaner" way to commit your files is to group them by similar function changes so it's easy to
track. For example if you need to change a variable in three different files, and also change a
function in another file, it's preferrable to stage the variable change files and commit on a single
message. Afterwards, you can stage the other change and commit it under a different message. This
keeps the commit logs clean and easy to track.
```
# this pulls up your preferred text editor where you can write a multi-line commit message
git commit 

# this is more of what you'll use normally, a single-line messge
git commit -m "your message here!"

# or if you use my aliases
git ci "your message here!"



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



