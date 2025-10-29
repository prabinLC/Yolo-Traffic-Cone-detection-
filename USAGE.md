# Traffic Cone Detection - Cleaned Project

This repository contains a YOLOv5-based traffic cone detection system with color classification.

## Quick Start

### Run Camera Detection

Double-click `run_camera_detection.bat` or use:

```bash
cd yolov5
python detect_custom.py --weights "../model/best.pt" --source 0 --img-size 640 --conf-thres 0.25 --view-img
```

### Run on Images

```bash
cd yolov5
python detect_custom.py --weights "../model/best.pt" --source "../images" --img-size 640 --conf-thres 0.25 --view-img
```

## Controls

- Press **'q'** in the display window to quit
- **Ctrl+C** in terminal also works

## Project Structure

```
├── images/           # Sample test images
├── model/           # Trained model weights (best.pt)
├── yolov5/          # YOLOv5 inference engine
│   ├── detect_custom.py  # Main detection script
│   ├── models/      # Model architectures
│   └── utils/       # Utilities (includes custom color detection)
├── predict.ipynb    # Jupyter notebook for prediction
├── train.ipynb      # Jupyter notebook for training
└── run_camera_detection.bat  # Quick launcher
```

## Features

- Real-time traffic cone detection via webcam
- Color classification (red, yellow, green, blue, unknown)
- Bounding box visualization
- Confidence scoring
- ~5-6 FPS on CPU

## Requirements

All dependencies are already installed. Core requirements:

- Python 3.11+
- PyTorch (CPU)
- OpenCV
- NumPy
- Matplotlib
