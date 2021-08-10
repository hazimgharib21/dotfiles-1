unbind-key -n C-a
unbind-key -n C-s
unbind-key -n C-q
set -g prefix ^Q
set -g prefix2 ^Q
bind q send-prefix

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
