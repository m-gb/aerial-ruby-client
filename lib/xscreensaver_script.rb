#!/usr/bin/env ruby

# Will be used by exec to launch mpv.
mpv = "mpv --really-quiet --shuffle --no-audio --fs --loop=inf --no-stop-screensaver --wid=$XSCREENSAVER_WINDOW --panscan=1"

day = File.join(Dir.home, '*', 'day-*.mov')
#=> /home/username/*/day-*.mov
night = File.join(Dir.home, '*', 'night-*.mov')
#=> /home/username/*/night-*.mov

if Time.new.hour.between?(7,19)
    exec("#{mpv} #{day}") # Replaces the current process by running the external command.
else
    exec("#{mpv} #{night}")
end
