import sys

header_size = 62

def read_line(f):
    # Flip the bits because black is 0 and white is 1, but we want 1 for set
    # pixels, i.e. the black ones
    if sys.version_info[0] < 3:
        line = [~ord(byte) & 0xFF for byte in f.read(3)]
    else:
        line = [~byte & 0xFF for byte in f.read(3)]
    f.read(1) # Discard padding byte
    return line

def read_bitmap_data(filename):
    with open(filename, "rb") as f:
        # Skip header
        f.read(header_size)
        line = read_line(f)
        while line:
            yield line
            line = read_line(f)

line_number = int(sys.argv[2])
# Reverse the lines because lines are stored bottom-to-top in BMP
for line in reversed(list(read_bitmap_data(sys.argv[1]))):
    print("{} data {}".format(line_number, ", ".join(str(byte) for byte in line)))
    line_number += 1
