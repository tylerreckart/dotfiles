export ZSH="/Users/tylerreckart/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="tylerreckart"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Alley
export PATH=~/broadway/bin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# source $HOME/broadway/apm/apm_completion
# There will be an indicator of >, <, or = next to the branch name indicating
# If you're ahead, behind, or equal to wherever the current branch is tracked
GIT_PS1_SHOWUPSTREAM="auto"
source ~/git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\u@\w" "\\\$ "'

# PHPUNIT
# export WP_TESTS_DIR=~/broadway/www/wordpress-develop/tests/phpunit/

