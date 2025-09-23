# sideloader-image
This is an image to run https://github.com/Dadoum/Sideloader on any Linux distribution.

Sideloader is an application made to install third-party applications on iOS devices, Leave a star in the Dadoum's repo.

## setup
get latest image.
```bash
docker pull ghcr.io/nukhes/sideloader-image:latest
```

setup xorg permission.
```bash
xhost +local:root
```

run it.
```bash
docker run --rm -it \
  --device /dev/ttyUSB0:/dev/ttyUSB0 \
  --device /dev/ttyACM0:/dev/ttyACM0 \
  --cap-add=SYS_ADMIN \
  --cap-add=NET_RAW \
  --user root \
  -e DISPLAY="$DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  ghcr.io/nukhes/sideloader-image:latest
```
