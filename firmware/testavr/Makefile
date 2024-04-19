FREQ    = 1000000
DEVICE  = atmega328
BOARD   = uno
SRCS    = main.c
TARGETS = main

build: $(SRCS)
	avr-gcc -Os -mmcu=$(DEVICE) -DF_CPU=$(FREQ) $(SRCS) -o $(TARGETS).elf
	avr-objcopy -O ihex $(TARGETS).elf $(TARGETS).hex
	avr-size --format=avr --mcu=$(DEVICE) $(TARGETS).elf

emulate: $(TARGETS).elf
	qemu-system-avr -machine $(BOARD) -bios $(TARGETS).elf -nographic -serial tcp::5678,server=on,wait=off

clean:
	rm *.o *.elf *.hex