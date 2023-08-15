#!/bin/zsh

CHECK_INTERVAL=20
CPU_COMMAND=cpu

typeset -Ag icons

### Wireless network icons
icon_wireless() {
  icons=(
    performance notification-network-wireless-full
    schedutil notification-network-wireless-high
    ondemand notification-network-wireless-medium
    conservative notification-network-wireless-low
    powersave notification-network-wireless-none
    userspace notification-network-wireless-disconnected
  )
}

### Wireless network icons
icon_wireless2() {
  icons=(
    performance network-wireless-connected-100
    schedutil network-wireless-connected-75
    ondemand network-wireless-connected-50
    conservative network-wireless-connected-25
    powersave network-wireless-connected-00
    userspace network-wireless-connected-disconnected
  )
}

### UPS Battery
icon_battery() {
  icons=(
    performance notification-gpm-ups-100
    schedutil notification-gpm-ups-080
    ondemand notification-gpm-ups-060
    conservative notification-gpm-ups-040
    powersave notification-gpm-ups-020
    userspace notification-gpm-ups-000
  )
}

### Progress
icon_progress() {
  icons=(
    performance progress-100
    schedutil progress-80
    ondemand progress-60
    conservative progress-40
    powersave progress-20
    userspace progress-0
  )
}

### Audio
icon_audio() {
  icons=(
    performance audio-volume-high
    schedutil audio-volume-medium
    ondemand audio-volume-medium
    conservative audio-volume-low
    powersave audio-volume-off
    userspace audio-volume-muted
  )
}


### Empathy
icon_empathy() {
  icons=(
    performance empathy-busy
    schedutil empathy-away
    ondemand empathy-away
    conservative empathy-extended-away
    powersave empathy-avilable
    userspace empathy-invisible
  )
}

### Emote icons
icon_emote() {
  icons=(
    performance face-devilish
    schedutil face-in-love
    ondemand face-in-love
    conservative face-quiet
    powersave face-sleeping
    userspace face-cool
  )
}

### syspeek
icon_syspeek() {
  icons=(
    performance syspeek-100
    schedutil syspeek-80
    ondemand syspeek-60
    conservative syspeek-40
    powersave syspeek-20
    userspace syspeek-0
  )
}

### Copy.com
icon_copy() {
  icons=(
    performance copy-sync8
    schedutil copy-sync6
    ondemand copy-sync4
    conservative copy-sync2
    powersave copy-paused
    userspace copy-error
  )
}

# Choice icon
icon_progress

(while sleep $CHECK_INTERVAL
do
  gov=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
  print "icon:${icons[$gov]}"
  print "tooltip:$gov"
done) | yad --notification --image="${icons[$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)]}" --listen --command='zsh -c "notify-send -i cpu -a \"CPU Governor Controller\" -t 3 -u low -e $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)"' --menu="Power!${CPU_COMMAND} high|Balance!${CPU_COMMAND} up|Eco!${CPU_COMMAND} down"
