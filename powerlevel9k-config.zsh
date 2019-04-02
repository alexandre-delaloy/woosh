#!/bin/bash

# LEFT SIDE
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    context
    ip
    disk_usage
    node_version
    dir
    load
    dir_writable
    vcs
)

# RIGHT SIDE
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    history
    time
    date
    battery
)

# #794A98: purple // 055
# #98e014: green // 040
# #c10b29: red // 124
# #E9F4F7: white // 231

# CONTEXT =======================================
export POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="055"
export POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="040"

# IP ============================================
export POWERLEVEL9K_IP_BACKGROUND="231"
export POWERLEVEL9K_IP_FOREGROUND="124"

# DISK ==========================================
#     NORMAL ------------------------------------
export POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND="040"
export POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND="055"
#     WARNING -----------------------------------
export POWERLEVEL9K_DISK_USAGE_WARNING_BACKGROUND="214"
export POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND="124"
#     CRITICAL ----------------------------------
export POWERLEVEL9K_DISK_USAGE_CRITICAL_BACKGROUND="196"
export POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND="088"

# NODE VERSION ==================================
export POWERLEVEL9K_NODE_VERSION_FOREGROUND="231"
export POWERLEVEL9K_NODE_VERSION_BACKGROUND="124"

# DIR ===========================================
#     ICON --------------------------------------
export POWERLEVEL9K_HOME_ICON='🃏'
export POWERLEVEL9K_HOME_SUB_ICON='🔪'
export POWERLEVEL9K_FOLDER_ICON='💣'
export POWERLEVEL9K_ETC_ICON='🔨'
#     HOME --------------------------------------
export POWERLEVEL9K_DIR_HOME_BACKGROUND="055"
export POWERLEVEL9K_DIR_HOME_FOREGROUND="124"
#      DEFAULT ----------------------------------
export POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="055"
export POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="231"
#      HOME_SUBFOLDER ---------------------------
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="055"
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="231"
#     ETC ---------------------------------------
export POWERLEVEL9K_DIR_ETC_BACKGROUND="251"
export POWERLEVEL9K_DIR_ETC_FOREGROUND="235"
#      DIR_WRITABLE -----------------------------
export POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="196"
export POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="226"

# BATTERY =======================================
#     STAGES ------------------------------------
export POWERLEVEL9K_BATTERY_STAGES="😡😩🙁😐🙂😌😄🤩"
#     LEVELS ------------------------------------
export POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(
    235
    237
    239
    241
    243
    245
    247
    251
)
#      CHARGING ---------------------------------
export POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="051"
export POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="039"
#      CHARGED ----------------------------------
export POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="046"
export POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="034"
#      LOW --------------------------------------
export POWERLEVEL9K_BATTERY_LOW_BACKGROUND="196"
export POWERLEVEL9K_BATTERY_LOW_FOREGROUND="088"



# STATUS ========================================
#     OK ----------------------------------------
export POWERLEVEL9K_STATUS_OK_BACKGROUND="046"
export POWERLEVEL9K_STATUS_OK_FOREGROUND="034"
#     LOW ---------------------------------------
export POWERLEVEL9K_STATUS_ERROR_BACKGROUND="196"
export POWERLEVEL9K_STATUS_ERROR_FOREGROUND="226"

# HISTORY =======================================
export POWERLEVEL9K_HISTORY_BACKGROUND="231"
export POWERLEVEL9K_HISTORY_FOREGROUND="124"

# TIME ==========================================
export POWERLEVEL9K_TIME_BACKGROUND="040"
export POWERLEVEL9K_TIME_FOREGROUND="055"

# DATE ==========================================
export POWERLEVEL9K_DATE_BACKGROUND="055"
export POWERLEVEL9K_DATE_FOREGROUND="040"