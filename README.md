# Electronics
> Exploring the topic of electronics simulation with different tools.

## Linux 
> Teeny linux builder with docker by Mitchel Humpherys.

### Docker Memo 
- Building : docker build . -t teeny-linux-builder
- Running : docker run -ti -v <local>:<docker> teeny-linux-builder
    - <local> : path to dir used as a docker volume (without ".." i.e. /Users/.../Workspace/kernel)
    - <docker> : path to the directory in the docker (i.e. /teeny)

## Firmware
> Microcontroller programming & emulation with qemu.

### AVR
- [test](./firmware/test/) : Testing the cross-compiler+qemu setup with atmega328
- [serial](./firmware/hello/) : Serial Output of UART0 to stdout with atmega328

### STM32
- [adc](./firmware/adc/) : Testing ADC conversion device with stm32

### Requirement Memo
- brew install qemu (ALL targets)
- brew install avr-gcc (AVR targets)
- brew install gcc-arm-embedded (STM targets)

## ESL
> Electronic System Level simulation with GHDL & GTKwave.

## AMS
> Analog & Mixed Signals simulations with SPICE3 scripts.
### Passive 
- [Voltage Divider](./src/passive/div.cir)
- [Lowpass Filter](./src/passive/lowpass.cir)
- [Highpass Filter](./src/passive/highpass.cir)
- [Bandpass Filter](./src/passive/bandpass.cir)
- [Notch Trap](./src/passive/notch.cirp)

### Diodes
- [Diode Model](./src/diodes/diode.cir)
- [Zener Voltage Regulator](./src/diodes/zenreg.cir)

### Transistors
- [LED drive](./src/transistors/led_drive.cir)
- [Load Switching I](./src/transistors/switching_load_a.cir)
- [Load Switching II](./src/transistors/switching_load_b.cir)
- [Pulse Generator I](./src/transistors/pulse_gen_1.cir)
- [Pulse Generator II](./src/transistors/pulse_gen_2.cir)
- [Schmitt Trigger](./src/transistors/schmitt_trigger.cir)
- [Emitter Follower](./src/transistors/ef.cir)
- [Emitter Follower driving switch](./src/transistors/efdrive.cir)
- [Emitter Follower Voltage Regulator I](./src/transistors/efreg_1.cir)
- [Emitter Follower Voltage Regulator II](./src/transistors/efreg_2.cir)

### OpAmps
- [Voltage Inverter Amplifier](./src/opamps/inverter.cir)
- [Voltage Non-Inverter Amplifier](./src/opamps/noninverter.cir)
- [Voltage AC Amplifier I](./src/opamps/acamp_1.cir)

### Spice Memo
- dc \<src\> \<start\> \<stop\> \<step\>
- tran \<step\> \<stop\> [\<start\> [\<max\>]] [\<uic\>]
- ac \<dec|oct|lin\> \<npoints\> \<fstart\> \<fstop\>
- pulse (\<v1\> \<v2\> \<delayt\> \<riset\> \<fallt\> \<width\> \<period\>)