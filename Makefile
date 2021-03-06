obj-m += hello.o
hello-y := main.o linux-wrappers.o lib/libadakernelmodule.a rts/adalib/libgnat.a

all:
	gprbuild -Prts/gnat.gpr --create-missing-dirs
	gprbuild -Pkernel_module_lib.gpr --create-missing-dirs

	make  -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules V=0

clean:

	make  -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean V=0

	gnatclean -Pkernel_module_lib.gpr
	gnatclean -Prts/gnat.gpr



