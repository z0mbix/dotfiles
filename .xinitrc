# If we have a private ssh key, start ssh-agent and add the key(s)
if [ -f $HOME/.ssh/id_rsa ]; then
	eval `ssh-agent -s`
	export SSH_ASKPASS=gnome-ssh-askpass2
	ssh-add < /dev/null&
fi

#gnome-settings-daemon&
#xset +fp /usr/local/lib/X11/fonts/artwiz-latin1&
fbsetbg ~/Dropbox/Photos/Wallpapers/Rocks_1600x1200.jpg&
#fbsetroot -mod 4 4 -bg rgb:10/18/20 -fg rgb:30/38/40&
conky&
gnome-terminal --geometry 116x48+0+20&
gnome-terminal --geometry 116x48-0+20&
gnome-terminal --geometry 116x26+0-40&
pidgin&
exec fluxbox
#exec gnome-session

if [ "$SSH_AGENT_PID" ]; then
	ssh-add -D < /dev/null
	eval `ssh-agent -s -k`
fi
