# Path to your oh-my-zsh installation.
export ZSH="/home/${USER}/.oh-my-zsh"

POWERLEVEL9K_MODE="nerdfont-complete"

ZSH_THEME=powerlevel10k/powerlevel10k

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status
                                    command_execution_time
                                    root_indicator
                                    background_jobs
                                    pyenv
                                    virtualenv
                                    docker_machine
                                    )
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=' \uf101 '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uF408 '
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"


plugins=(git
        vi-mode
        pyenv
        extract
        cloudapp
        docker
        )

source $ZSH/oh-my-zsh.sh

# Advanced tab completion
autoload -U compinit
compinit

alias d="dirs -v | head -10"


