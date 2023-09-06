REMOTE_USER="dummy"
REMOTE_IP="localhost"
REMOTE_PATH="$HOME"

cd "$HOME/.config/gcloud"
scp *.db "$REMOTE_USER@$REMOTE_IP:$REMOTE_PATH"
