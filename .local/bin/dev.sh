#!/bin/bash

# Define the session name and directories
SESSION_NAME="dev_session"
DIR1="/home/kali/work/fretemax-workspace/fretemax-lambdas/"
DIR2="/home/kali/work/fretemax-workspace/fretemax-frontend/"

# Start a new tmux session and create the first window
tmux new-session -d -s $SESSION_NAME -n first_window

# Split the window vertically
tmux split-window -v -t $SESSION_NAME:first_window

# Navigate to the first directory and run npm run start in the first pane
tmux send-keys -t $SESSION_NAME:first_window.0 "cd $DIR1 && npm run start" C-m

# Navigate to the second directory and run npm run dev in the second pane
tmux send-keys -t $SESSION_NAME:first_window.1 "cd $DIR2 && npm run dev" C-m

# Attach to the tmux session
tmux attach -t $SESSION_NAME
