/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.09.07
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int L[10];
    int ans = 0;
    int sum = 0;

    for (int i = 0; i < 10; i++)
        cin >> L[i];

    for (int i = 0; i < 10; i++) {
        sum += L[i];
        if (abs(ans-100) >= abs(sum-100))
            ans = sum;
    }

    cout << ans;
}