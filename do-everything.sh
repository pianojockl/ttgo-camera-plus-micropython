#!/bin/bash

# prepare esp-idf
cd esp-idf
git checkout v4.2
./install.sh esp32
source export.sh
cd ..

# copy esp32-camera to esp-idf
mkdir esp-idf/components/esp32-camera
cp -v -r esp-idf-components-esp32-camera/* esp-idf/components/esp32-camera

# checkout micropython version v1.18
cd micropython
git checkout v1.18
cd ..

# checkout the right version of lemariva's camera driver and copy board definition into micropython folder structure
cd modules/micropython-camera-driver
git checkout 83051e2130791a26781559b851e7f717eda5a752
cd ../..

cp -v -r modules/micropython-camera-driver/boards/* micropython/ports/esp32/boards/

# checkout the right version of ross hughes' st7789 driver module
cd modules/st7789_mpy
git checkout eeaaa927bc8419e94ced95b27a6f2d6285dc86b8
cd ../..

# compile micropython
cd micropython/ports/esp32
make BOARD=GENERIC_CAM clean && make USER_C_MODULES=../../../../modules/micropython.cmake BOARD=GENERIC_CAM all
