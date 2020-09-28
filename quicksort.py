import sys

def main(args):
    arr = [23, 71, 33, 5, 93, 82, 34, 13, 111, 23, 8, 9, 46, 75, 82]
    quick_sort(arr, 0, 14)
    print (arr)

def quick_sort(arr, low, high):
    if (low < high):
        pivot = arr[high]
        i = low - 1

        for j in range(low, high):
            if arr[j] <= pivot:

                i += 1
                print(arr[i], arr[j])
                tmp = arr[i]
                arr[i] = arr[j]
                arr[j] = tmp

        i += 1
        print(arr[i], arr[high])
        tmp = arr[i]
        arr[i] = arr[high]
        arr[high] = tmp

        quick_sort(arr, low, i - 1)
        quick_sort(arr, i + 1, high)

if __name__ == "__main__":
    main(sys.argv)
