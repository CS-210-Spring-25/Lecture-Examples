python3 -c "import numpy as np; np.random.seed(42); np.random.randint(-100, 100, (1000, 1000), dtype=np.int32).tofile('matrix1-1000.bin')"
python3 -c "import numpy as np; np.random.seed(43); np.random.randint(-100, 100, (1000, 1000), dtype=np.int32).tofile('matrix2-1000.bin')"
