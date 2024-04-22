# Testing x86_64 setup with kernel and initramfs built using docker
KERNEL_X86_64 = ../../kernel/obj/linux-x86-basic/arch/x86_64/boot/bzImage
INITRD_X86_64 = ../../kernel/obj/initramfs-busybox-x86.cpio.gz
QFLAGS_X86_64 = -kernel $(KERNEL_X86_64) \
				-initrd $(INITRD_X86_64) \
				-nographic \
				-append "console=ttyS0"
QEMU_X86_64   = qemu-system-x86_64

run_x86_64:
	$(QEMU_X86_64) $(QFLAGS_X86_64)