#!/bin/bash

# prepare esp-idf
cd esp-idf
./install.sh esp32
source export.sh
cd ..

# copy esp32-camera to esp-idf
mkdir esp-idf/components/esp32-camera
cp -v -r esp-idf-components-esp32-camera/* esp-idf/components/esp32-camera

# copy board definition of lemariva's camera driver into micropython folder structure
cp -v -r modules/micropython-camera-driver/boards/* micropython/ports/esp32/boards/

# compile micropython
cd micropython/ports/esp32
make BOARD=GENERIC_CAM clean && make USER_C_MODULES=../../../../modules/micropython.cmake BOARD=GENERIC_CAM all

echo If everything went well, your firmware.bin should be in micropython/ports/esp32/build-GENERIC_CAM/
