# /usr/share/oh-my-zsh/themes/zami3l.zsh-theme

# You can set your computer name in the ~/.box-name file if you want.

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo ">>>" && return
  echo '>'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

local ruby_env=']%{$FG[243]%} $(ruby_prompt_info)'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'


PROMPT="%{$FG[255]%}╭─[%{$reset_color%}%{$terminfo[bold]$FG[003]%}%n%{$reset_color%}%{$FG[255]%}@%{$reset_color%}%{$terminfo[bold]$FG[069]%}$(box_name)%{$reset_color%}%{$FG[255]%}]-[ %{$reset_color%}%{$terminfo[bold]$FG[003]%}%~%{$reset_color%}${git_info} %{$FG[255]%}${ruby_env}
%{$FG[255]%}╰─${prompt_char}%{$reset_color%} %{${FG[001]%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[255]%} ]-[%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
ZSH_THEME_RUBY_PROMPT_PREFIX="‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"
