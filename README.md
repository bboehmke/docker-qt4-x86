# 32 Bit QT build environment

## Build

If you have created a project in ```~/dev/project``` you can build it with:

```bash
docker run --rm -it \
    -v ~/dev/project:/build \
    bboehmke/qt4-x86:latest /bin/bash -c "qmake project.pro && make"
```
