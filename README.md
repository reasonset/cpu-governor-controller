# cpu-governor-controller

Check and change CPU governor with cpupower quickly.

# Dependency

* `cpupower`
* `yad`
* `pkexec`, `gksu`, `kdesu` or `sudo`

# Install

Copy `cpu` and `cpu-governor-controller-tray.zsh` to your path.

# Usage

## Controller

```
cpu [high|power|up|down]
```

Set governor.

|arg|governor|
|------|---------------|
|`high`|`performance`|
|`power`|`performance`|
|`up`|`schedutil` or `performance`|
|`down`|`powersave`|

Edit `SUDO_COMMAND` and `avilable_governors` if you want.

## Checker

```
cpu-governor-controller-tray.zsh
```

Show current governor with icon.

Edit `CHECK_INTERVAL` and `icons` if you want.