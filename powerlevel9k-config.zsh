
source  ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme


# LEFT SIDE
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    context 
    ip 
    disk_usage 
    newline 
 
    node_version
    dir 
    dir_writable
    load 
    vcs
)

# RIGHT SIDE
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status    
    history
    newline
    time
    date
    battery
)

# ROOT ICON 
POWERLEVEL9K_HOME_ICON='🌳'


# BATTERY STAGES
POWERLEVEL9K_BATTERY_STAGES="😡😩🙁😐🙂😌😄🤩"

# BATTERY CHARGING LEVELS
POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(235 237 239 241 243 245 247 251)

# #794A98: purple // 055
# #98e014: green // 154
# #c10b29: red // 124
# #E9F4F7: white // 231

# POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="055"