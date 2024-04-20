# Electronics
> Exploring the topic of electronics simulation with different tools.

## Firmware
> Microcontroller programming & emulation with qemu.
### AVR
- [test](./firmware/avr/test/) : test the setup
- [hello](./firmware/avr/hello/) : hello world through UART0, redirected to stdout
- [tmp105](./firmware/avr/tmp105/) : get information from an I2C temperature sensor

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