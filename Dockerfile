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

RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
        BIN_NAME="sideloader-gtk-x86_64-linux-gnu"; \
    elif [ "$ARCH" = "aarch64" ]; then \
        BIN_NAME="sideloader-gtk-aarch64-linux-gnu"; \
    else \
        echo "$ARCH not supported"; exit 1; \
    fi && \
    LATEST_URL=$(wget -qO- https://github.com/nukhes/sideloader-image/releases/latest | grep -Eo "/nukhes/sideloader-image/releases/download/[0-9a-f]+/$BIN_NAME") && \
    wget -O sideloader-linux-gnu "https://github.com$LATEST_URL" && \
    chmod +x sideloader-linux-gnu

ENTRYPOINT ["./sideloader-linux-gnu"]
