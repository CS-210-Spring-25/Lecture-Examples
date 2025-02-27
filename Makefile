all: usesum  mov movend movex popcnt1 popcnt2 popcnt3 

usesum: usesum.o sumit.o
	ld -g usesum.o sumit.o -o usesum

usesum.o: usesum.s
	as -g usesum.s -o usesum.o

sumit.o: sumit.s
	as -g sumit.s -o sumit.o

mov: mov.o
	ld -g mov.o -o mov

mov.o: mov.s
	as -g mov.s -o mov.o

movend: movend.o
	ld -g movend.o -o movend

movend.o: movend.s
	as -g movend.s -o movend.o

movex: movex.o
	ld -g movex.o -o movex

movex.o: movex.s
	as -g movex.s -o movex.o

popcnt1: popcnt1.o
	ld -g popcnt1.o -o popcnt1

popcnt1.o: popcnt1.s
	as -g popcnt1.s -o popcnt1.o

popcnt2: popcnt2.o
	ld -g popcnt2.o -o popcnt2

popcnt2.o: popcnt2.s
	as -g popcnt2.s -o popcnt2.o

popcnt3: popcnt3.o
	ld -g popcnt3.o -o popcnt3

popcnt3.o: popcnt3.s
	as -g popcnt3.s -o popcnt3.o

clean:
	-rm -f $(wildcard *.o usesum mov popcnt1 popcnt2 popcnt3 movend movex)
