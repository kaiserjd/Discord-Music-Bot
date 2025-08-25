#!/bin/bash

if [! -f .env]; then
    echo ".env file not present."
    exit 1
fi

source ./venv/bin/activate
python3 bot.py
