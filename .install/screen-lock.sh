#!/usr/bin/env bash
set -e

cat <<-I3LOCK | sudo tee /etc/systemd/system/i3lock.service
[Unit]
Description=i3lock

[Service]
User=rik
Type=forking
Environment=DISPLAY=:0
ExecStart=/usr/bin/i3lock -c 000000 -i $HOME/.config/i3/Pictures/LockScreen.png -t -p default -d -n

[Install]
WantedBy=sleep.target suspend.target
I3LOCK

sudo systemctl enable i3lock.service
sudo apt install -y xautolock
