/**
* 메모리: 2020 KB, 시간: 4 ms
* 2022.08.19
* by Alub
*/
#include <algorithm>
#include <iostream>

using namespace std;


int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    int N; cin >> N;
    int cur; cin >> cur;
    int count = 0;
    int maxValue = 0;

    for (int i = 1; i < N; i++) {
        int x; cin >> x;
        if (cur > x) {
            count += 1;
        } else {
            cur = x;
            count = 0;
        }
        maxValue = max(maxValue, count);
    }

    cout << maxValue << endl;
}