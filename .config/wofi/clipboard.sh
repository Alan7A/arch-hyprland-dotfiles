# ~/.config/wofi/clipboard.sh
#!/bin/bash
cliphist list | wofi --show dmenu -n | cliphist decode | wl-copy
