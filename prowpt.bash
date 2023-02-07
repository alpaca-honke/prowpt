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

PROWPT_SHELL="bash"
PROWPT_CURRENT_TIME="\t"
PROWPT_USER="\u"
PROWPT_HOST="\h"
PROWPT_PROMPT="\$"

source $( cd "$( dirname ${BASH_SOURCE:-$0} )" && pwd -P )/prowpt-core.sh

prowpt_precmd () {
    prowpt_init
    PS1="$(prowpt_current_time)$(prowpt_user)$(prowpt_host)$(prowpt_pwd)$(prowpt_git)
$(prowpt_prompt)\[\e[0m\] "
}

PROMPT_COMMAND="prowpt_precmd"