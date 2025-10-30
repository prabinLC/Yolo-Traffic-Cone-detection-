# Use NVIDIA's official L4T PyTorch image for Jetson (JetPack 6/R36)
FROM nvcr.io/nvidia/l4t-pytorch:r36.3.0-pth2.2-py3

WORKDIR /workspace

# Copy all project files into the container
COPY . /workspace

# Install extra Python packages needed for your project
RUN pip install --upgrade pip && \
    pip install opencv-python matplotlib Pillow PyYAML tqdm seaborn pandas

CMD ["bash"]
