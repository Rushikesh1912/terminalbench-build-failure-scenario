#!/bin/bash
set -e

pip install --no-cache-dir -r requirements.txt
OUTPUT=$(python app.py)

if [[ "$OUTPUT" == "BUILD SUCCESS" ]]; then
    exit 0
else
    exit 1
fi