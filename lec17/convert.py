import sys
import string

def process_file(input_path, output_path):
    with open(input_path, 'r', encoding='utf-8') as infile:
        text = infile.read()

    # Convert to lowercase and remove punctuation
    text = text.lower()
    text = text.translate(str.maketrans('', '', string.punctuation))

    # Split into words
    words = text.split()

    # Write one word per line
    with open(output_path, 'w', encoding='utf-8') as outfile:
        for word in words:
            outfile.write(word + '\n')

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: python split_words.py input.txt output.txt")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    process_file(input_file, output_file)
