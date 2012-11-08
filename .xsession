# Load ssh keys
eval `ssh-agent -s`
export SSH_ASKPASS=ssh-askpass
ssh-add ~/.ssh/comqi < /dev/null&
ssh-add ~/.ssh/vaughan < /dev/null&

# Load programs
gnome-settings-daemon&
#fbsetbg ~/Dropbox/Images/Wallpapers/Rocks_1600x1200.jpg&
fbsetbg ~/Dropbox/Images/Wallpapers/Minecraft/18270-minecraft-creeper-stare.png&
xrdb -load ~/.Xdefaults
urxvt -geometry 129x59+1-16&
urxvt -geometry 96x59-2-16&
nm-applet&
guake&
conky&
~/.dropbox-dist/dropboxd&
aerofs-gui&

# Start fluxbox
exec fluxbox

# Unload ssh keys and kill agent
if [ "$SSH_AGENT_PID" ]; then
	ssh-add -D < /dev/null
	eval `ssh-agent -s -k`
fi
