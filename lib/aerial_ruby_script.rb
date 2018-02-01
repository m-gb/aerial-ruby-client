#!/usr/bin/env ruby

mpv = "mpv --really-quiet --shuffle --no-audio --fs --loop=inf --no-stop-screensaver --wid=$XSCREENSAVER_WINDOW --panscan=1"

aerialdir = File.join(Dir.home, 'Aerial')
day = File.join(aerialdir, 'day-*.mov')
night = File.join(aerialdir, 'night-*.mov')

if Time.new.hour >= 7 && Time.new.hour <= 19
    cmd = "#{mpv} #{day}"
    exec(cmd)
else
    cmd = "#{mpv} #{night}"
    exec(cmd)
end
