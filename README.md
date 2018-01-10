# Jan Chwiejczak Dot Files

These are config files to set up a system the way I like it. I now use [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh).

No extra tooling is required, files are tracked on version control system in a bare git repository using an alias for commands run against that repository. Original idea by StreakyCobra700 [HackerNews](https://news.ycombinator.com/item?id=11070797)

## Installation

Prior to installtion add the following alias to *.zsh* or *.bashrc*:

```terminal
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Run the following commands in your terminal:

```terminal
echo ".cfg" >> .gitignore
git clone --bare https://github.com/janhak/dotfiles $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
```

Manage them as any regular git repo substituting the git command for config.
