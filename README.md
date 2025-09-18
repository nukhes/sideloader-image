# sideloader-image
This is an image to run https://github.com/Dadoum/Sideloader on any Linux distribution.

Sideloader is an application made to install third-party applications on iOS devices, Leave a star in the Dadoum's repo.

## setup
get latest image.
```bash
docker pull ghcr.io/nukhes/sideloader-image:latest
```

run it.
```bash
docker run --rm -it \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    ghcr.io/nukhes/sideloader-image:latest
```
