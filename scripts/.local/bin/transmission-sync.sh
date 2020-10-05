#!/bin/sh

rsync -av $HOME/.config/transmission/torrents $HOME/disco/transmission_backup/torrents && \\
rsync -av $HOME/.config/transmission/resume $HOME/disco/transmission_backup/resume
