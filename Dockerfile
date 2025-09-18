FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    libgtk-3-0 \
    libgdk-pixbuf2.0-0 \
    libnotify4 \
    libadwaita-1-0 \
    libharfbuzz-gobject0 \
    libglib2.0-0 \
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
    libpango1.0-0 \
    libcairo2 \
    libatk1.0-0 \
    libepoxy0 \
    libplist3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then BIN="sideloader-gtk-x86_64-linux-gnu"; \
    elif [ "$ARCH" = "aarch64" ]; then BIN="sideloader-gtk-aarch64-linux-gnu"; \
    else echo "$ARCH not supported"; exit 1; fi && \
    wget -O sideloader-linux-gnu "https://github.com/nukhes/sideloader-image/releases/download/35f486c/$BIN" && \
    chmod +x sideloader-linux-gnu

ENTRYPOINT ["./sideloader-linux-gnu"]
