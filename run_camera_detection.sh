#!/bin/bash

echo "==================================="
echo " Traffic Cone Detection - Camera"
echo "==================================="
echo "Starting camera detection..."
echo ""
echo "CONTROLS:"
echo "- Press 'q' or ESC in detection window to quit"
echo "- Ctrl+C in this terminal also works"
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Navigate to yolov5 directory
cd "${SCRIPT_DIR}/yolov5"

# Run the detection
python3 detect_custom.py --weights "../model/best.pt" --source 0 --img-size 640 --conf-thres 0.25 --view-img

echo ""
echo "Detection stopped."
echo "Press Enter to exit..."
read