# Docker build environment
TOOLS = /Users/nm/Documents/Workspace/kernel
DNAME = teeny-linux-builder
build_docker:
	docker build . -t $(DNAME)

run_docker:
	docker run -ti -v $(TOOLS):/teeny $(DNAME)

# Testing ARM : 
KERNEL_ARM = ../../kernel/linux-5.11.7/arch/arm/boot/zImage
INITRD_ARM = ../../kernel/rootfs.cpio.gz
QFLAGS_ARM = -M virt \
			 -kernel $(KERNEL_ARM) \
			 -initrd $(INITRD_ARM) \
			 -nographic \
			 -append "root=/dev/mem"
QEMU_ARM    = qemu-system-arm 

run_arm:
	$(QEMU_ARM) $(QFLAGS_ARM)

# Testing x86_64 :
KERNEL_X86_64 = ../../kernel/obj/linux-x86-basic/arch/x86_64/boot/bzImage
INITRD_X86_64 = ../../kernel/obj/initramfs-busybox-x86.cpio.gz
QFLAGS_X86_64 = -kernel $(KERNEL_X86_64) \
				-initrd $(INITRD_X86_64) \
				-nographic \
				-append "console=ttyS0"
QEMU_X86_64   = qemu-system-x86_64

run_x86_64:
	$(QEMU_X86_64) $(QFLAGS_X86_64)

.PHONY: build_docker run_docker run_x86_64