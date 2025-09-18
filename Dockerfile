FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libgtk-3-0 \
    libgdk-pixbuf2.0-0 \
    libnotify4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    libgbm1 \
    libdrm-dev \
    libgles2-mesa \
    libgl1-mesa-glx \
    libglx-mesa0 \
    mesa-vulkan-drivers \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN wget -O sideloader-gtk-x86_64-linux-gnu.zip "https://github.com/Dadoum/Sideloader/actions/runs/17197829616/artifacts/3839906922"
RUN unzip sideloader-gtk-x86_64-linux-gnu.zip
RUN chmod +x sideloader-gtk-x86_64-linux-gnu/sideloader-gtk-x86_64-linux-gnu

ENTRYPOINT ["./sideloader-gtk-x86_64-linux-gnu/sideloader-gtk-x86_64-linux-gnu"]
