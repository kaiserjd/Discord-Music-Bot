#!/bin/bash
set -e

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    echo "Detected OS as: $OS $VER"
else
    echo "Distribution not supported."
    exit 1
fi

sudo apt update -y && sudo apt upgrade -y
sudo apt install -y ffmpeg python3 python3-venv git

git clone https://github.com/kaiserjd/Discord-Music-Bot.git
cd Discord-Music-Bot

python3 -m venv .venv
source .venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt

chmod +x run.sh

echo -e "\nSetup tasks complete. Run 'run.sh' to start the bot."
