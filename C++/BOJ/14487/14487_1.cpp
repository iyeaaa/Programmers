/**
* 메모리: 1368 KB, 시간: 8 ms
* 2022.08.22
* by Alub
*/
#include <cstdio>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    int n, sum = 0;
    vector<int> cost(50001);

    scanf("%d", &n);
    for(int i=0;i<n;i++)
        scanf("%d", &cost[i]);

    sort(cost.begin(), cost.begin()+n);

    for(int i = 0; i < n-1; i++)
        sum += cost[i];

    printf("%d", sum);
}
