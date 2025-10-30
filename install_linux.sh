#!/bin/bash

echo "Installing Traffic Cone Detection System for Linux..."

# Update system
sudo apt update

# Install Python and dependencies
echo "Installing Python and system dependencies..."
sudo apt install -y python3 python3-pip python3-venv git wget curl
sudo apt install -y libgl1-mesa-glx libglib2.0-0 libsm6 libxext6 libxrender-dev libgomp1
sudo apt install -y v4l-utils

# Create virtual environment
echo "Creating Python virtual environment..."
python3 -m venv traffic_cone_env
source traffic_cone_env/bin/activate

# Install Python packages
echo "Installing Python packages..."
pip install --upgrade pip
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
pip install opencv-python-headless
pip install matplotlib
pip install numpy
pip install Pillow
pip install PyYAML
pip install tqdm
pip install seaborn
pip install pandas

echo "Installation complete!"
echo ""
echo "To run the detection:"
echo "1. Activate environment: source traffic_cone_env/bin/activate"
echo "2. Run script: ./run_camera_detection.sh"
echo ""
echo "Available camera devices:"
ls /dev/video* 2>/dev/null || echo "No video devices found"