#!/bin/bash

# Set xray directory
XRAY_DIR="/usr/local/xray"
APP_DIR="/usr/src/app"

# Run xray version and initialize if needed
echo "Initializing xray..."
cd $XRAY_DIR
./xray_linux_amd64 version

# Generate xray config if it doesn't exist
if [ ! -f "$XRAY_DIR/config.yaml" ]; then
    echo "Generating xray config..."
    ./xray_linux_amd64 --config $XRAY_DIR/config.yaml
fi

echo "xray initialization completed"

# Return to the app directory
cd $APP_DIR

# Remove any existing xray config files or symlinks in the app directory
# rm -f xray.yaml module.xray.yaml plugin.xray.yaml

# Apply database migrations
python3 manage.py migrate

# Start the Django development server
python3 manage.py runserver 0.0.0.0:8000

# Execute any additional commands passed to the script
exec "$@"