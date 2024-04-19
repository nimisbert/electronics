# Emulation/Hardware
FREQ   = 1000000          # microcontroller internal frequency
DEVICE = atmega328        # microcontroller
BOARD  = uno              # electronic board to emulate
QEMU   = qemu-system-avr  # QEMU emulator
# Compilation
AVRCC  = avr-gcc          # avr gcc compiler
AVRHC  = avr-objcopy      # avr copy and transform binary files
AVRSC  = avr-size         # avr elf size inspection
# Files
SRC    = main.c
OBJ    = $(SRC:.c=.o)
ELF    = $(OBJ:.o=.elf)
HEX    = $(ELF:.elf=.hex)

.PHONY: all emulate clean

all: $(HEX)

emulate: $(HEX)
	$(QEMU) -machine $(BOARD) -bios $^ -nographic -serial tcp::5678,server=on,wait=off

clean:
	rm -f *.o *.elf *.hex

%.o: %.c
	$(AVRCC) -Os -mmcu=$(DEVICE) -DF_CPU=$(FREQ) $< -c

%.elf: %.o
	$(AVRCC) -Os -mmcu=$(DEVICE) -DF_CPU=$(FREQ) $< -o $@

%.hex: %.elf
	$(AVRHC) -O ihex $^ $@
	$(AVRSC) --format=avr --mcu=$(DEVICE) $^

