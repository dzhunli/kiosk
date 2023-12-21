#!/bin/sh
#set -e
export DEBIAN_FRONTEND=noninteractive
autologin=/etc/lightdm/lightdm.conf
autostart=/home/kiosk-user/.config/openbox/autostart
custom_port=2228

echo "export PATH=\$PATH:/usr/sbin/" >> ~/.bashrc
. ~/.bashrc
useradd -m kiosk-user -s /bin/bash || echo "user already added"
apt-get update
apt-get install -y -qqq \
	sudo \
	xorg \
	wget \
	openbox \
	openssh-server \
	libvulkan1 \
	lightdm
cd / && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i /google-chrome-stable_current_amd64.deb
apt install -f -y
cat > "$autologin" << 'EOF1'
[SeatDefaults]
autologin-user=kiosk-user
user-session=openbox
EOF1
mkdir -p /home/kiosk-user/.config/openbox
cat > "$autostart" << 'EOF2'
HOME=$(mktemp -d)
google-chrome-stable \
    --no-first-run \
    --disable \
    --disable-translate \
    --disable-infobars \
    --disable-suggestions-service \
    --disable-save-password-bubble \
    --start-maximized \
    --kiosk "http://example.org/" &
EOF2
chmod a+x "$autostart" 
echo "/home/kiosk-user/.config/openbox/autostart" >> /home/kiosk-user/.bashrc
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "Port $custom_port" >> /etc/ssh/sshd_config
