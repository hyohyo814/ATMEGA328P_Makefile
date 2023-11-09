default:
	avr-gcc -0s -DF_CPU=16000000UL -mmcu=atmega328p -c -o filename.o filename.c
	avr-gcc -o filename.bin filename.o
	avr-objcopy -O ihex -R .eeprom filename.bin filename.hex
	sudo avrdude -F -V -c arduino -p ATMEGA328P -P /dev/bus/usb/001/002 -b 115200 -U -flash:w:filename.hex
