#Make File for Static and Dynamic Linking of Femto Shell
.PHONY: clean
linking:=static

ifeq ($(linking),static)
myexe: main.o mylib.a
	gcc -o myexe main.o ./mylib.a

mylib.a: fib.o fact.o rand.o
	ar rcs mylib.a fib.o fact.o rand.o


main.o: main.c fib.h fact.h rand.h
	 gcc -c main.c

fib.o: fib.c
	gcc -c fib.c


fact.o: fact.c
	gcc -c fact.c


rand.o: rand.c
	gcc -c rand.c

else
myexe: main.c mylib.so
	gcc -o myexe main.c ./mylib.so
mylib.so: fib.c fact.c rand.c
	gcc -shared -fpic  -o mylib.so fib.c fact.c rand.c


endif

clean:
	rm -f myexe *.o *.a *.so  *.gch
install: myexe
	@cp myexe  /usr/bin
	@chmod a+x /usr/bin/myexe
	@chmod og-w /usr/bin/myexe
	@echo "myexe is successfully installed in /usr/bin"

uninstall:
	@rm -f /usr/bin/myexe
	@echo "myexe is uninstalled successfully from /usr/bin"


#End of Makefile
