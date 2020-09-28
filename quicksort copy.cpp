#include <bits/stdc++.h> 
using namespace std;  

/* Function to print an array */
void printArray(int arr[], int size)  
{  
    int i;  
    for (i = 0; i < size; i++)  
        cout << arr[i] << " ";  
    cout << endl;  
}

void quickSort(int arr[], int low, int high)
{
    if (low < high)
    {
        int pivot = arr[high];
        int i = low - 1;

        for (int j = low; j < high; j++)
        {
            if (arr[j] <= pivot)
            {
                i++;
                cout << arr[i] << ", " << arr[j] << endl;
                int tmp = arr[i];
				arr[i] = arr[j];
				arr[j] = tmp;
            }
        }
        i++;
        cout << arr[i] << ", " << arr[high] << endl;
        int tmp = arr[i];
		arr[i] = arr[high];
		arr[high] = tmp;

        quickSort(arr, low, i - 1);
        quickSort(arr, i + 1, high);
    }
}

int main() {
    int arr[] = {23, 71, 33, 5, 93, 82, 34, 13, 111, 23, 8, 9, 46, 75, 82};
    quickSort(arr, 0, 14);
    printArray(arr, 15);
}
