# Electronics
SPICE simulations

## Circuits

### Passive 
- [Voltage Divider](./src/passive/div.cir)
- [Lowpass Filter](./src/passive/lowpass.cir)
- [Highpass Filter](./src/passive/highpass.cir)
- [Bandpass Filter](./src/passive/bandpass.cir)
- [Notch Trap](./src/passive/notch.cirp)

### Diodes
- [Zener Voltage Regulator](./src/diodes/zenreg.cir)

### Transistors
- [LED drive](./src/transistors/led_drive.cir)
- [Load Switching I](./src/transistors/switching_load_a.cir)
- [Load Switching II](./src/transistors/switching_load_b.cir)
- [Pulse Generator I](./src/transistors/pulse_gen_1.cir)
- [Pulse Generator II](./src/transistors/pulse_gen_2.cir)
- [Schmitt Trigger](./src/transistors/schmitt_trigger.cir)
- [Emitter Follower](./src/transistors/ef.cir)
- [Emitter Follower Voltage Regulator](./src/transistors/efreg.cir)

### OpAmps
- [Voltage Inverter](./src/opamps/inverter.cir)

## Spice Memo

- dc \<src\> \<start\> \<stop\> \<step\>
- tran \<step\> \<stop\> [\<start\> [\<max\>]] [\<uic\>]
- ac \<dec|oct|lin\> \<npoints\> \<fstart\> \<fstop\>
- pulse (\<v1\> \<v2\> \<delayt\> \<riset\> \<fallt\> \<width\> \<period\>)