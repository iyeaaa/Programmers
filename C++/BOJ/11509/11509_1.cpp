/**
* 메모리: 5928 KB, 시간: 64 ms
* 2022.08.25
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N, x, cnt = 0;
int isArrow[1000001];

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> N;
    for (int i = 0; i < N; i++) {
        cin >> x;
        if (!isArrow[x]) {
            isArrow[x-1]++;
            cnt++;
        } else {
            isArrow[x]--;
            isArrow[x-1]++;
        }
    }

    cout << cnt;
}

