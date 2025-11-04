import sys

def read_matrix(file_path, rows, cols):
    """Reads a binary matrix of integers from a file."""
    try:
        with open(file_path, 'rb') as f:
            data = f.read()
        
        # Verify data length matches the expected size
        expected_bytes = rows * cols * 4  # Each `int32` is 4 bytes
        if len(data) != expected_bytes:
            raise ValueError(f"File size does not match the expected size for a {rows}x{cols} matrix.")
        
        # Convert binary data into a 2D list of integers
        matrix = []
        for i in range(rows):
            row = []
            for j in range(cols):
                start = (i * cols + j) * 4
                end = start + 4
                # Interpret the 4 bytes as a signed 32-bit integer (big-endian by default)
                row.append(int.from_bytes(data[start:end], byteorder='little', signed=True))
            matrix.append(row)
        return matrix
    except Exception as e:
        print(f"Error reading matrix from {file_path}: {e}")
        sys.exit(1)

def matrix_multiply(mat1, mat2):
    """Performs matrix multiplication using for loops."""
    rows_a, cols_a = len(mat1), len(mat1[0])
    rows_b, cols_b = len(mat2), len(mat2[0])
    
    if cols_a != rows_b:
        print("Matrix dimensions do not match for multiplication.")
        sys.exit(1)
    
    # Initialize the result matrix with zeros
    result = [[0 for _ in range(cols_b)] for _ in range(rows_a)]
    
    # Perform matrix multiplication
    for i in range(rows_a):
        for j in range(cols_b):
            for k in range(cols_a):
                result[i][j] += mat1[i][k] * mat2[k][j]
    return result

def print_matrix(matrix):
    """Prints a matrix."""
    for row in matrix:
        print(" ".join(map(str, row)))

def main():
    if len(sys.argv) != 7:
        print("Usage: python matrix_multiplication.py <matrix1.bin> <rows1> <cols1> <matrix2.bin> <rows2> <cols2>")
        sys.exit(1)
    
    # Parse command-line arguments
    matrix1_path = sys.argv[1]
    rows1, cols1 = int(sys.argv[2]), int(sys.argv[3])
    matrix2_path = sys.argv[4]
    rows2, cols2 = int(sys.argv[5]), int(sys.argv[6])
    
    if rows1 <= 0 or cols1 <= 0 or rows2 <= 0 or cols2 <= 0:
        print("Matrix dimensions must be positive integers.")
        sys.exit(1)
    
    # Read matrices
    matrix1 = read_matrix(matrix1_path, rows1, cols1)
    matrix2 = read_matrix(matrix2_path, rows2, cols2)
    
    # Perform multiplication
    result = matrix_multiply(matrix1, matrix2)
    
    # Print the resulting matrix
    print("Resultant Matrix:")
    print_matrix(result)

if __name__ == "__main__":
    main()
