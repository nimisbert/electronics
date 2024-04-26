# Docker build environment
TOOLS = /Users/nm/Documents/Workspace/kernel
DNAME = teeny-linux-builder
build_docker:
	docker build . -t $(DNAME)

run_docker:
	docker run -ti -v $(TOOLS):/teeny $(DNAME)

# Testing ARM :

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