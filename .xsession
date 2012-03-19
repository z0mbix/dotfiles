# Load ssh keys
eval `ssh-agent -s`
export SSH_ASKPASS=ssh-askpass
if [ -f ~/Dropbox/Configs/shared/ssh/comqi-ssh ]; then
	ssh-add ~/Dropbox/Configs/shared/ssh/comqi-ssh < /dev/null&
fi
if [ -f ~/Dropbox/Configs/shared/ssh/vaughan-ssh ]; then
	ssh-add ~/Dropbox/Configs/shared/ssh/vaughan-ssh < /dev/null&
fi

# Load programs
gnome-settings-daemon&
fbsetbg ~/Dropbox/Images/Wallpapers/Rocks_1600x1200.jpg&
xrdb -load ~/.Xdefaults
conky&
urxvt -geometry 94x47+0+18&
urxvt -geometry 94x47-0-16&
nm-applet&
guake&
/var/lib/dropbox/.dropbox-dist/dropboxd&

# Start fluxbox
exec fluxbox

# Unload ssh keys and kill agent
if [ "$SSH_AGENT_PID" ]; then
	ssh-add -D < /dev/null
	eval `ssh-agent -s -k`
fi
