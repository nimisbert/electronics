# Emulation/Hardware
FREQ   = 1843200 # microcontroller internal frequency
DEVICE = atmega328 # microcontroller
BOARD  = uno # electronic board to emulate
QEMU   = /Users/nm/Documents/Workspace/qemu/build/qemu-system-avr # QEMU emulator
SERIAL = /dev/stdout # UART Serial output
TMP105 = tmp105,id=i2c,slave_addr=0x50
QFLAGS = -serial $(SERIAL) 
# Compilation
AVRCC  = avr-gcc # avr gcc compiler
AVRHC  = avr-objcopy # avr copy and transform binary files
AVRSC  = avr-size # avr elf size inspection
# Files
SRC    = main.c
OBJ    = $(SRC:.c=.o)
ELF    = $(OBJ:.o=.elf)
HEX    = $(ELF:.elf=.hex)

%.o: %.c
	$(AVRCC) -Os -mmcu=$(DEVICE) -DF_CPU=$(FREQ) $< -c

%.elf: %.o
	$(AVRCC) -Os -mmcu=$(DEVICE) -DF_CPU=$(FREQ) $^ -o $@

%.hex: %.elf
	$(AVRHC) -O ihex $^ $@
	$(AVRSC) --format=avr --mcu=$(DEVICE) $^

.PHONY: all emulate clean

all: $(HEX)

emulate: $(ELF)
	$(QEMU) -machine $(BOARD) -bios $^ -nographic $(QFLAGS)
#-device tmp105,id=sensor,address=0x50

clean:
	rm -f *.o *.elf *.hex