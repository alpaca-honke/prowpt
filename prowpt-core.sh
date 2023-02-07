#Prowpt - Simple, lightweight, and customizable Powerline-like prompt theme for Bash and Zsh  
#Copyright (C) 2023 Alkappa/alpaca-honke
#
#This file is part of Prowpt.
#
#Prowpt is free software: you can redistribute it and/or modify
#it underthe terms of the GNU General Public License as published by 
#the Free Software Foundation, version 2.0 of the License.
#
#Prowpt is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with Prowpt. If not, see <https://www.gnu.org/licenses/>.

PROWPT_REPO_ROOT="$( cd "$( dirname "${BASH_SOURCE:-$0}")" && pwd -P )"

source $PROWPT_REPO_ROOT/git-prompt.sh

PROWPT_SEGMENT_DELIMITER=$'\ue0b0' # 
PROWPT_PWD_DELIMITER=$'\ue0b1' # 
PROWPT_PWD_DELIMITER_FG="250"
PROWPT_CURRENT_TIME_BG="31"
PROWPT_CURRENT_TIME_FG="253"
PROWPT_USER_BG="242"
PROWPT_USER_FG="253"
PROWPT_HOST_BG="239"
PROWPT_HOST_FG="253"
PROWPT_PWD_BG="237"
PROWPT_PWD_FG="253"
PROWPT_PWD_HOME_HIGHLIGHT="yes"
PROWPT_PWD_HOME_BG="31"
PROWPT_PWD_HOME_FG="253"
PROWPT_GIT_BG="148"
PROWPT_GIT_FG="236"
PROWPT_PROMPT_BG="237"
PROWPT_PROMPT_FG="253"
PROWPT_PROMPT_ERROR_BG="5"
PROWPT_PROMPT_ERROR_FG="253"
GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_SHOWSTASHSTATE="yes"
GIT_PS1_SHOWUNTRACKEDFILES="yes"
GIT_PS1_SHOWUPSTREAM="auto"

if [ -e ~/.config/prowpt/config.sh ] ;then
    source ~/.config/prowpt/config.sh
fi

prowpt_init() {
    PROWPT_LAST_STATUS=$?

    PROWPT_PWD_FULL="$(pwd)"
    if [ ${PROWPT_PWD_FULL:0:${#HOME}} = $HOME ] ;then
        if [ $PROWPT_SHELL = "bash" ] ;then
            PROWPT_PWD_ABBR="${PROWPT_PWD_FULL/${HOME}/\~}"
        elif [ $PROWPT_SHELL = "zsh" ] ;then
            PROWPT_PWD_ABBR="${PROWPT_PWD_FULL/${HOME}/~}"
        fi
    else
        PROWPT_PWD_ABBR="$PROWPT_PWD_FULL"
    fi

    if [ ${#PROWPT_PWD_ABBR} -gt 20 ] ;then
        PROWPT_PWD_ABBR_HEAD=${PROWPT_PWD_ABBR:0:-18}
        PROWPT_PWD_ABBR_SHORTHEAD=${PROWPT_PWD_ABBR_HEAD##*/}
        PROWPT_PWD_ABBR_TALE=${PROWPT_PWD_ABBR:${#PROWPT_PWD_ABBR_HEAD}:$((${#PROWPT_PWD_ABBR} - ${#PROWPT_PWD_ABBR_HEAD}))}
        PROWPT_PWD_ABBR_SHORT=".../${PROWPT_PWD_ABBR_SHORTHEAD}${PROWPT_PWD_ABBR_TALE}"
    elif [ ${PROWPT_PWD_ABBR:0:1} = "/" ] ;then
        PROWPT_PWD_ABBR_SHORT="${PROWPT_PWD_ABBR#/}"
    elif [ ${PROWPT_PWD_ABBR} = "~" ] ;then
        PROWPT_PWD_ABBR_SHORT=""
    elif [ ${PROWPT_PWD_ABBR:0:1} = "~" ] ;then
        PROWPT_PWD_ABBR_SHORT="${PROWPT_PWD_ABBR:2:$((${#PROWPT_PWD_ABBR} - 2))}"
    fi

    PROWPT_GIT_PROMPT="$(__git_ps1 " %s ")"
}

prowpt_ansi_color () {
    if [ $1 = "bash" ] ;then
        if [ $2 = "reset" ] ;then
            echo -n "\[\e[0m\]\[\e[38;5;${3}m\]"
        else
            echo -n "\[\e[48;5;${2}m\]\[\e[38;5;${3}m\]"
        fi
    elif [ $1 = "zsh" ] ;then
        if [ $2 = "reset" ] ;then
            echo -n "\e[0m\e[38;5;${3}m"
        else
            echo -n "\e[48;5;${2}m\e[38;5;${3}m"
        fi
    fi
}

prowpt_current_time () {
    echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_CURRENT_TIME_BG} ${PROWPT_CURRENT_TIME_FG}) ${PROWPT_CURRENT_TIME} $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_USER_BG} ${PROWPT_CURRENT_TIME_BG})${PROWPT_SEGMENT_DELIMITER}"
}

prowpt_user () {
    echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_USER_BG} ${PROWPT_USER_FG}) ${PROWPT_USER} $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_HOST_BG} ${PROWPT_USER_BG})${PROWPT_SEGMENT_DELIMITER}"
}

prowpt_host () {
    if [ "${PROWPT_PWD_ABBR:0:1}" = "~" ] ;then
        echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_HOST_BG} ${PROWPT_HOST_FG}) ${PROWPT_HOST} $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_HOME_BG} ${PROWPT_HOST_BG})${PROWPT_SEGMENT_DELIMITER}"
    else
        echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_HOST_BG} ${PROWPT_HOST_FG}) ${PROWPT_HOST} $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_HOST_BG})${PROWPT_SEGMENT_DELIMITER}"
    fi
}

prowpt_pwd () {
    if [ "${PROWPT_PWD_HOME_HIGHLIGHT}" = "yes" ] ;then
        if [ "${PROWPT_PWD_ABBR:0:1}" = "/" ] ;then
            if [ -z ${PROWPT_PWD_ABBR_SHORT} ] ;then
                echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG}) / "
            else
                echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG}) / $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_DELIMITER_FG})${PROWPT_PWD_DELIMITER} $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG})${PROWPT_PWD_ABBR_SHORT//\// $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_DELIMITER_FG})${PROWPT_PWD_DELIMITER}$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG}) }"
            fi
        elif [ "${PROWPT_PWD_ABBR:0:1}" = "~" ] ;then
            echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_HOME_BG} ${PROWPT_PWD_HOME_FG}) ~ $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_HOME_BG})${PROWPT_SEGMENT_DELIMITER}$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG}) ${PROWPT_PWD_ABBR_SHORT//\// $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_DELIMITER_FG})${PROWPT_PWD_DELIMITER}$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG}) }"
        fi
    else
        if [ "${PROWPT_PWD_ABBR:0:1}" = "/" ] ;then
            echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG}) / $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_DELIMITER_FG})${PROWPT_PWD_DELIMITER}$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG}) ${PROWPT_PWD_ABBR_SHORT//\// $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_DELIMITER_FG})${PROWPT_PWD_DELIMITER}$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG}) }"
        elif [ "${PROWPT_PWD_ABBR:0:1}" = "~" ] ;then
            echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG}) ~ $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_DELIMITER_FG})${PROWPT_PWD_DELIMITER}$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG}) ${PROWPT_PWD_ABBR_SHORT//\// $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_DELIMITER_FG})${PROWPT_PWD_DELIMITER}$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PWD_BG} ${PROWPT_PWD_FG}) }"
        fi
    fi

    if [ -z ${PROWPT_GIT_PROMPT} ] ;then
        echo -n " $(prowpt_ansi_color ${PROWPT_SHELL} reset ${PROWPT_PWD_BG})${PROWPT_SEGMENT_DELIMITER}"
    else
        echo -n " $(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_GIT_BG} ${PROWPT_PWD_BG})${PROWPT_SEGMENT_DELIMITER}"
    fi
}

prowpt_git() {
    if [ -z ${PROWPT_GIT_PROMPT} ] ;then
        echo -n ""
    else
        echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_GIT_BG} ${PROWPT_GIT_FG})${PROWPT_GIT_PROMPT}$(prowpt_ansi_color ${PROWPT_SHELL} reset ${PROWPT_GIT_BG})${PROWPT_SEGMENT_DELIMITER}"
    fi
}

prowpt_prompt() {
    if [ $PROWPT_LAST_STATUS -eq 0 ] ;then
        echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PROMPT_BG} ${PROWPT_PROMPT_FG}) ${PROWPT_PROMPT} $(prowpt_ansi_color ${PROWPT_SHELL} reset ${PROWPT_PROMPT_BG})${PROWPT_SEGMENT_DELIMITER}"
    else
        echo -n "$(prowpt_ansi_color ${PROWPT_SHELL} ${PROWPT_PROMPT_ERROR_BG} ${PROWPT_PROMPT_ERROR_FG}) ${PROWPT_LAST_STATUS} ${PROWPT_PROMPT} $(prowpt_ansi_color ${PROWPT_SHELL} reset ${PROWPT_PROMPT_ERROR_BG})${PROWPT_SEGMENT_DELIMITER}"
    fi
}