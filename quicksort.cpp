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
                int tmp = arr[i];
				arr[i] = arr[j];
				arr[j] = tmp;
            }
        }
        i++;
        int tmp = arr[i];
		arr[i] = arr[high];
		arr[high] = tmp;

        quickSort(arr, low, i - 1);
        quickSort(arr, i + 1, high);
    }
}