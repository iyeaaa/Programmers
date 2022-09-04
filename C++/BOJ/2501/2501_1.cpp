/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.09.04
* by Alub
*/
#include <iostream>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int cnt = 1;
    int N, K;

    cin >> N >> K;

    if (cnt == K) {
        cout << 1;
        return 0;
    }

    for (int i = 2; i <= N; i++) {
        if (N%i == 0) cnt++;
        if (cnt == K) {
            cout << i;
            return 0;
        }
    }

    cout << 0;
}