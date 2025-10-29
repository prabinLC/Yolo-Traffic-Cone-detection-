# Traffic Cone Detection

This is a YOLOv5-based model that detects traffic cones in real-time using camera feed. The model can identify traffic cones and classify their colors (red, yellow, green, blue) using computer vision techniques.

## What it does

- Detects traffic cones in live camera feed
- Classifies cone colors automatically
- Processes video at ~5-6 FPS on CPU
- Shows bounding boxes around detected cones

## How to run

### Quick Start

1. Double-click `run_camera_detection.bat`
2. Press 'q' to quit

### Command Line

```bash
cd yolov5
python detect_custom.py --weights "../model/best.pt" --source 0 --img-size 640 --conf-thres 0.25 --view-img
```

### Parameters

- `--source 0` = Use webcam (try 1, 2 for other cameras)
- `--source "../images"` = Process images from folder
- `--conf-thres 0.25` = Detection confidence (lower = more sensitive)

## Credits

Based on the original work by [jhan15](https://github.com/jhan15/traffic_cones_detection.git)
| **q** | Quit detection |
| **ESC** | Quit detection |
| **Ctrl+C** | Force stop in terminal |

## 📁 Project Structure

```
📦 Yolo-Traffic-Cone-detection
├── 📁 images/                    # Sample test images
├── 📁 model/                     # Trained YOLOv5 model weights
│   └── best.pt                   # Pre-trained traffic cone model
├── 📁 yolov5/                    # YOLOv5 inference engine
│   ├── detect_custom.py          # Main detection script
│   ├── 📁 models/               # Model architectures
│   └── 📁 utils/                # Utilities with custom color detection
├── 🚀 run_camera_detection.bat   # Quick launcher
├── 📄 USAGE.md                  # Detailed usage instructions
├── 📄 README.md                 # This file
├── 📓 train.ipynb               # Training notebook
└── 📓 predict.ipynb             # Prediction notebook
```

## ⚙️ Configuration

### Detection Parameters

| Parameter      | Description           | Example Values                                              |
| -------------- | --------------------- | ----------------------------------------------------------- |
| `--source`     | Input source          | `0` (webcam), `1` (external camera), `"../images"` (folder) |
| `--img-size`   | Processing resolution | `640` (default), `1024` (high quality)                      |
| `--conf-thres` | Confidence threshold  | `0.25` (default), `0.15` (sensitive), `0.4` (precise)       |
| `--view-img`   | Display results       | Include for visual output                                   |

### Usage Examples

```bash
# High sensitivity camera detection
python detect_custom.py --weights "../model/best.pt" --source 0 --conf-thres 0.15 --view-img

# Process image folder without display
python detect_custom.py --weights "../model/best.pt" --source "../images" --conf-thres 0.4

# High resolution processing
python detect_custom.py --weights "../model/best.pt" --source 0 --img-size 1024 --view-img
```

## 🎨 Color Detection System

The system uses **K-means clustering** to determine the dominant color of detected cones:

| Color          | Use Case                         | Description          |
| -------------- | -------------------------------- | -------------------- |
| 🔴 **Red**     | Construction, warning zones      | Danger/stop signals  |
| 🟡 **Yellow**  | Caution areas, temporary markers | Warning/slow down    |
| 🟢 **Green**   | Safe zones, go signals           | Proceed/safe areas   |
| 🔵 **Blue**    | Information, special zones       | Information/guidance |
| ⚪ **Unknown** | Unclassified colors              | Other cone types     |

## 📊 Performance Metrics

| Metric                 | Value               | Notes                     |
| ---------------------- | ------------------- | ------------------------- |
| **Processing Speed**   | ~5-6 FPS            | CPU-optimized performance |
| **Detection Accuracy** | Optimized for cones | Custom trained model      |
| **Latency**            | ~150-200ms/frame    | Real-time processing      |
| **Memory Usage**       | ~500MB RAM          | Efficient resource usage  |

## 🛠️ Development & Training

### Custom Model Training

Use the included **Jupyter notebooks** for training and prediction:

[![Train Model](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/jhan15/traffic_cones_detection/blob/master/train.ipynb) **Train custom models** with your dataset

[![Run Prediction](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/jhan15/traffic_cones_detection/blob/master/predict.ipynb) **Test predictions** on images

### Local Development

1. **Training**: See `train.ipynb` for training procedures using your own datasets
2. **Prediction**: Use `predict.ipynb` for inference on static images without camera setup

## 📸 Results Gallery

### Detection Examples

<div align="center">
<img src="https://user-images.githubusercontent.com/62132206/118353597-5d822000-b567-11eb-9e09-dd39bc877487.jpeg" width="45%" style="margin: 10px;">
<img src="https://user-images.githubusercontent.com/62132206/118353605-62df6a80-b567-11eb-9bc0-4983853664b0.jpeg" width="45%" style="margin: 10px;">
<img src="https://user-images.githubusercontent.com/62132206/118353609-683cb500-b567-11eb-8dd3-9624d8382d5f.jpeg" width="45%" style="margin: 10px;">
<img src="https://user-images.githubusercontent.com/62132206/118353614-6a9f0f00-b567-11eb-81bd-bc4234948a0e.jpeg" width="45%" style="margin: 10px;">
</div>

## 📜 Credits & Acknowledgments

### Original Research

This project is based on the excellent work by **jhan15**:

- **Original Repository**: [traffic_cones_detection](https://github.com/jhan15/traffic_cones_detection.git)
- **Author**: [jhan15](https://github.com/jhan15)
- **Dataset**: Self-collected cone dataset with 303 images
- **Annotation**: Created using [Roboflow](https://roboflow.com/)

### Key Technologies

- **YOLOv5**: [Ultralytics YOLOv5](https://github.com/ultralytics/yolov5)
- **Test Video**: Research project from [ETH Zurich](https://www.trace.ethz.ch/publications/2019/TrafficCone/)
- **Color Classification**: K-means clustering implementation

### Enhancements in This Fork

- ✅ Simplified installation and setup process
- ✅ One-click launcher for Windows
- ✅ Improved quit functionality (q/ESC keys)
- ✅ Enhanced documentation and user guide
- ✅ Optimized for CPU-only environments
- ✅ Better error handling and user feedback

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to:

1. 🍴 Fork the repository
2. 🌟 Create a feature branch
3. 💡 Submit a pull request
4. 🐛 Report issues

## 📞 Support

- 🐛 **Issues**: [GitHub Issues](https://github.com/prabinLC/Yolo-Traffic-Cone-detection-/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/prabinLC/Yolo-Traffic-Cone-detection-/discussions)
- 📧 **Contact**: Open an issue for questions

## 🌟 Show Your Support

If this project helped you, please consider:

- ⭐ **Starring** this repository
- 🍴 **Forking** for your own modifications
- 📢 **Sharing** with others who might benefit

---

<div align="center">

### 🚦 Made with ❤️ for Safer Traffic Management

**Building safer roads through AI-powered detection systems**

[⭐ Star this repo](https://github.com/prabinLC/Yolo-Traffic-Cone-detection-) • [🐛 Report Bug](https://github.com/prabinLC/Yolo-Traffic-Cone-detection-/issues) • [✨ Request Feature](https://github.com/prabinLC/Yolo-Traffic-Cone-detection-/issues)

</div>

A complete YOLOv5-based traffic cone detection system with real-time color classification. This project detects traffic cones in images and video streams, and classifies their colors using K-means clustering.

## 🚀 Features

- **Real-time Detection**: Live camera feed processing at ~5-6 FPS
- **Color Classification**: Automatic color detection (red, yellow, green, blue, unknown)
- **Easy Setup**: One-click execution via batch file
- **Cross-platform**: Works on Windows, with easy adaptation for other platforms
- **YOLOv5 Integration**: Based on the proven YOLOv5 architecture
- **Custom Model**: Trained on traffic cone datasets for optimal performance

## 📋 Requirements

All dependencies are automatically managed. Core requirements:

- Python 3.11+
- PyTorch (CPU optimized)
- OpenCV
- NumPy
- Matplotlib

## 🎯 Quick Start

### Option 1: One-Click Launch

1. Double-click `run_camera_detection.bat`
2. The camera window will open automatically
3. Press 'q' or ESC to quit

### Option 2: Command Line

```bash
cd yolov5
python detect_custom.py --weights "../model/best.pt" --source 0 --img-size 640 --conf-thres 0.25 --view-img
```

## 🎮 Controls

- **'q' or ESC**: Quit detection
- **Ctrl+C**: Force stop in terminal

## 📁 Project Structure

```
├── images/                    # Sample test images
├── model/                     # Trained YOLOv5 model weights
├── yolov5/                    # YOLOv5 inference engine
│   ├── detect_custom.py       # Main detection script
│   ├── models/               # Model architectures
│   └── utils/                # Utilities with custom color detection
├── run_camera_detection.bat   # Quick launcher
├── USAGE.md                  # Detailed usage instructions
└── README.md                 # This file
```

## 🔧 Configuration

### Detection Parameters

- `--source 0`: Use webcam (change to 1, 2 for other cameras)
- `--source "../images"`: Process image folder
- `--img-size 640`: Processing resolution (higher = more accurate)
- `--conf-thres 0.25`: Confidence threshold (0.1-0.9)
- `--view-img`: Display results window

### Examples

```bash
# Camera detection with high sensitivity
python detect_custom.py --weights "../model/best.pt" --source 0 --conf-thres 0.15 --view-img

# Image processing without display
python detect_custom.py --weights "../model/best.pt" --source "../images" --conf-thres 0.4

# High resolution processing
python detect_custom.py --weights "../model/best.pt" --source 0 --img-size 1024 --view-img
```

## 🎨 Color Detection

The system uses K-means clustering to determine the dominant color of detected cones:

- **Red Cones**: Construction, warning zones
- **Yellow Cones**: Caution areas, temporary markers
- **Green Cones**: Safe zones, go signals
- **Blue Cones**: Information, special zones
- **Unknown**: Colors not matching the above categories

## 📊 Performance

- **Speed**: ~5-6 FPS on CPU
- **Accuracy**: Optimized for traffic cone detection
- **Latency**: ~150-200ms per frame
- **Memory**: ~500MB RAM usage

## 🛠️ Development

### Training Custom Models

See `train.ipynb` for training procedures using your own datasets.

### Prediction Only

Use `predict.ipynb` for inference on static images without camera setup.

## 📝 License

This project builds upon YOLOv5 and follows the same licensing terms.

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📞 Support

For questions or issues, please open a GitHub issue.

---

**Made with ❤️ for safer traffic management**

You can try the codes in colab if you are interested in.

#### Train

If you have an annotated dataset, you can train directly use train.ipynb [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/jhan15/traffic_cones_detection/blob/master/train.ipynb)

#### Prediction

If you want to detect cones directly, use predict.ipynb [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/jhan15/traffic_cones_detection/blob/master/predict.ipynb)

You should use the weights I trained in [model](https://github.com/jhan15/traffic_cones_detection/tree/master/model). Besides, I customized some files of yolov5, which are located in [utils](https://github.com/jhan15/traffic_cones_detection/tree/master/utils) folder, you need to use them as well.

## Result

#### Video

I clipped a video from one research project of [ETH Zurich](https://www.trace.ethz.ch/publications/2019/TrafficCone/) to test the peroformance.

![cone1](https://user-images.githubusercontent.com/62132206/120334300-d1a31e80-c2f0-11eb-962e-17c4d5481917.gif)

#### Images

<img src="https://user-images.githubusercontent.com/62132206/118353597-5d822000-b567-11eb-9e09-dd39bc877487.jpeg" width="600">
<img src="https://user-images.githubusercontent.com/62132206/118353605-62df6a80-b567-11eb-9bc0-4983853664b0.jpeg" width="600">
<img src="https://user-images.githubusercontent.com/62132206/118353609-683cb500-b567-11eb-8dd3-9624d8382d5f.jpeg" width="600">
<img src="https://user-images.githubusercontent.com/62132206/118353614-6a9f0f00-b567-11eb-81bd-bc4234948a0e.jpeg" width="600">
<img src="https://user-images.githubusercontent.com/62132206/118353625-75f23a80-b567-11eb-98c5-919eba29bdda.jpeg" width="600">
<img src="https://github.com/jhan15/traffic_cones_detection/blob/master/images/3.jpeg" width="600">
<img src="https://github.com/jhan15/traffic_cones_detection/blob/master/images/6.jpeg" width="600">
#   Y o l o - T r a f f i c - C o n e - d e t e c t i o n - 
 
 
