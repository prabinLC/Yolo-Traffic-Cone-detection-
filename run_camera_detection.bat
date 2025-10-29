@echo off
echo ===================================
echo  Traffic Cone Detection - Camera
echo ===================================
echo Starting camera detection...
echo.
echo CONTROLS:
echo - Press 'q' or ESC in detection window to quit
echo - Ctrl+C in this window also works
echo.
cd /d "%~dp0\yolov5"
"%USERPROFILE%\AppData\Local\Microsoft\WindowsApps\python3.11.exe" detect_custom.py --weights "../model/best.pt" --source 0 --img-size 640 --conf-thres 0.25 --view-img
echo.
echo Detection stopped.
pause