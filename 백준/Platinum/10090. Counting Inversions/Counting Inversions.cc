#include <stdio.h>
#include <malloc.h>

int arr[1000005];
int tmp[1000005];

typedef long long ll;
ll ans;
void merge(int start, int mid, int end) { // [start, mid) [mid, end)
    int p1, p2, index = 0;
    p1 = start;
    p2 = mid;
    while (p1 < mid && p2 < end) {
        if (arr[p1] < arr[p2]) {
            tmp[index++] = arr[p1++];
        }
        else if (arr[p1] > arr[p2]) {
            ans += mid - p1;
            tmp[index++] = arr[p2++];
        }
        else {
            tmp[index++] = arr[p2++];
        }
    }
    while (p1 < mid) {
        tmp[index++] = arr[p1++];
    }
    while (p2 < end) {
        tmp[index++] = arr[p2++];
    }
    for (int i = 0; i < end - start; ++i) {
        arr[start + i] = tmp[i];
    }
}

void merge_sort(int start, int end) { // [start, end)
    int mid = (start + end) / 2;
    if (start < mid) {
        merge_sort(start, mid);
        merge_sort(mid, end);
        merge(start, mid, end);
    }    
}

int main() {

    ans = 0;
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; ++i) {
        scanf("%d", arr + i);
    }

    merge_sort(0, n);
    printf("%lld\n", ans);

    return 0;
}