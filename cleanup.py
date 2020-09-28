# ********************************************* #
# Assembly Comment Remover                      #
# Trevor Loula & Joshua Tarwater                #
# EGCP-4210 Advanced Computer Architecture      #
# ********************************************* #

import sys

def main(args):

    if len(args) != 2:
        print("Usage: python cleanup.py filename.s")
        exit()

    filename = args[1]

    newfilename = "clean-" + filename
    open(newfilename, 'w').close()              # Clear any previously cleaned files
    destination = open(newfilename, "a")        # Create a new file to append lines to

    try:
        source = open(filename, "r")            # Open source file
    except FileNotFoundError as e:
        print ("File", filename, "not found")
        exit()
    else:
        try:
            content = source.readlines()        # Read source line by line
            for line in content:
                newline = line.split('#')[0]    # Split line on '#' comments
                newline = newline.strip()       # Remove extra whitespace
                if (len(newline) != len(line)): newline += '\n'
                destination.write(newline)
        finally:
            source.close()
            destination.close()

if __name__ == "__main__":
    main(sys.argv)
