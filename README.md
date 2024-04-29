# Electronics
> Exploring the topic of electronic simulation with different tools.

1. ams : analog & mixed signals simulation with spice3
    1. brief 
    2. passive 
    3. diodes
    4. transistors
    5. opamps
2. drivers : linux, drivers and hardware emulation
    1. brief
3. esl : electronics system level simulation 
    1. brief 
    2. boolean logic
    3. boolean arithmetic
4. firmware : firmware programming and microcontroller emulation
    1. brief
    2. avr

## 1. AMS : Analog & Mixed Signals electronics
### 1.1. Brief
> Analog & Mixed Signals simulations with SPICE3 scripts. <br>

> SPICE3 memo
> - dc \<src\> \<start\> \<stop\> \<step\>
> - tran \<step\> \<stop\> [\<start\> [\<max\>]] [\<uic\>]
> - ac \<dec|oct|lin\> \<npoints\> \<fstart\> \<fstop\>
> - pulse (\<v1\> \<v2\> \<delayt\> \<riset\> \<fallt\> \<width\> \<period\>)

### 1.2. Passive 
- [Voltage Divider](./src/passive/div.cir)
- [Lowpass Filter](./src/passive/lowpass.cir)
- [Highpass Filter](./src/passive/highpass.cir)
- [Bandpass Filter](./src/passive/bandpass.cir)
- [Notch Trap](./src/passive/notch.cirp)

### 1.3. Diodes
- [Diode Model](./src/diodes/diode.cir)
- [Zener Voltage Regulator](./src/diodes/zenreg.cir)

### 1.4. Transistors
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

### 1.5. OpAmps
- [Voltage Inverter Amplifier](./src/opamps/inverter.cir)
- [Voltage Non-Inverter Amplifier](./src/opamps/noninverter.cir)
- [Voltage AC Amplifier I](./src/opamps/acamp_1.cir)

## 2. Drivers 
### 2.1. Brief
> Teeny linux builder with docker by Mitchel Humpherys <br>
> My linux kernel build, busybox, qemu workspace <br> 

> Building Linux Kernel & Rootfs memo (with docker)
> - Building : docker build . -t teeny-linux-builder
> - Running : docker run -ti -v \<local>:\<docker> teeny-linux-builder
>     - \<local> : path to dir used as a docker volume (without ".." i.e. /Users/.../Workspace/kernel)
>     - \<docker> : path to the directory in the docker (i.e. /teeny)
> - Exiting docker : exit
> - Can't mknod in a docker volume, the workaround is (in zsh)
>     - sudo mknod -m dev/mem c 1 1
>     - sudo mknod -m dev/tty2 c 4 2 
>     - sudo mknod -m dev/tty3 c 4 3 
>     - sudo mknod -m dev/tty4 c 4 4 
> - Create rootfs.cpio.gz, from rootfs dir
>     - find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../rootfs.cpio.gz
> - Running QEMU 
>     - ./qemu-system-arm -M virt-2.10 -m 256M -kernel ../../linux-5.11.7/arch/arm/boot/zImage -initrd ../../rootfs.cpio.gz -append "root=/dev/mem" -nographic -device pci-echodev
> - Exiting QEMU nographics 
>     - Ctrl-A
>     - X

## 3. ESL : Electronics System Level
### 3.1. Brief
> Electronic System Level simulation with GHDL & GTKwave.

## 4. Firmware
### 4.1. Brief
> Microcontroller programming & emulation with qemu.

> Requirement memo
> - brew install qemu (ALL targets)
> - brew install avr-gcc (AVR targets)
> - brew install gcc-arm-embedded (STM targets)

### 4.2. AVR
- [test](./firmware/test/) : Testing the cross-compiler+qemu setup with atmega328
- [serial](./firmware/hello/) : Serial Output of UART0 to stdout with atmega328