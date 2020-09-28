import sys
import random

def main(args):

    if len(args) != 2:
        print("Usage: python numberGenerator.py numberCount")
        exit()

    numberCount = args[1]

    newfilename = "numbers.txt"
    open(newfilename, 'w').close()              # Clear any previously created files
    destination = open(newfilename, "a")        # Create a new file to append lines to
    random.seed(0)
    for i in range(int(numberCount)):    
        destination.write(str(random.randint(0, 999)) + "\n")
    destination.close()

if __name__ == "__main__":
    main(sys.argv)
