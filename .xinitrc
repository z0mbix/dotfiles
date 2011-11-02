# Load ssh keys
if [ -f $HOME/.ssh/id_rsa ]; then
	eval `ssh-agent -s`
	export SSH_ASKPASS=ssh-askpass
	ssh-add ssh-add ~/.ssh/id_rsa ~/.ssh/id_rsa_vaughan < /dev/null&
fi

# Load programs
gnome-settings-daemon&
fbsetbg ~/Dropbox/Images/Wallpapers/Rocks_1600x1200.jpg&
xrdb -load ~/.Xdefaults
conky&
xterm -geometry 94x47+0+18&
xterm -geometry 94x47-0-16&
nm-applet&
/var/lib/dropbox/.dropbox-dist/dropboxd&

# Start fluxbox
exec fluxbox

# Unload ssh keys and kill agent
if [ "$SSH_AGENT_PID" ]; then
	ssh-add -D < /dev/null
	eval `ssh-agent -s -k`
fi
