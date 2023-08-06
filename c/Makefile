IMAGE := riscv/devenv

SRCS := $(shell find src/*.c)
OBJS := $(SRCS:.c=.o)

hex: main
	riscv64-unknown-elf-objcopy -O binary main main.bin
	od -An -tx1 -w1 -v main.bin > main.hex

main: $(OBJS)
	riscv64-unknown-elf-ld -b elf32-littleriscv $(OBJS) -T link.ld -o main

.c.o:
	riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -c $< -o $@

clean:
	rm src/*.o *.bin *.hex main
