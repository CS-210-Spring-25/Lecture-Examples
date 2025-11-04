matmul1: matmul1.c
	gcc matmul1.c -Wall -o matmul1

matmul: matmul.c
	gcc matmul.c -Wall -o matmul

matmul-o1: matmul.c
	gcc matmul.c -Wall -o matmul-o1 -O1

matmul-o2:  matmul.c
	gcc matmul.c -Wall -o matmul-o2 -O2

matmul-o3:  matmul.c
	gcc matmul.c -Wall -o matmul-o3 -O3

matmul.S: matmul.c
	gcc matmul.c -Wall -masm=intel -o matmul.S -S

matmul-o1.S: matmul.c
	gcc matmul.c -Wall -masm=intel -o matmul-o1.S -O1 -S 

matmul-o2.S:  matmul.c
	gcc matmul.c -Wall -masm=intel -o matmul-o2.S -O2 -S

matmul-o3.S:  matmul.c
	gcc matmul.c -Wall -masm=intel -o matmul-o3.S -O3 -S

matmul-parallel: matmul-parallel.c
	gcc matmul-parallel.c -Wall -o matmul-parallel -O3 -fopenmp
