.PHONY: all

all:
	clang --target=riscv64-unknown-elf \
	      -march=rv64imafdc \
	      -mabi=lp64d \
	      -c factorial_my.ll -o factorial_rv.o
	riscv64-unknown-elf-gcc \
	      factorial_rv.o ~/lib/libsysy_riscv.a \
	      -o factorial_rv
run: all
	qemu-riscv64 ./factorial_rv
