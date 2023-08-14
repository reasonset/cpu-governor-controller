CHECK_INTERVAL=20

typeset -A icons=(
  performance face-devilish
  schedutil face-in-love
  ondemand face-in-love
  conservative face-quiet
  powersave face-sleeping
  userspace face-cool
)

(while sleep $CHECK_INTERVAL
do
  gov=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
  print "icon:${icons[$gov]}"
  print "tooltip:$gov"
done) | yad --notification --image="${icons[$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)]}" --listen

