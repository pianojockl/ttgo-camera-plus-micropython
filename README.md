# ttgo-camera-plus-micropython
This repo should contain everything to compile micropython for the ttgo camera plus board.
The cam driver comes from lemariva: https://github.com/lemariva/micropython-camera-driver
ST7789 display driver is from Ross Hughes: https://github.com/russhughes/st7789_mpy
Micropython version is 1.18, esp-idf version is 4.2

It really is pretty simple:

git checkout --recursive https://github.com/pianojockl/ttgo-camera-plus-micropython

cd ttgo-camera-plus-micropython

./do-everything.sh

Good luck!
