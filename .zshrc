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
