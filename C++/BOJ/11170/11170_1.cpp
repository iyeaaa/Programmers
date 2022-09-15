/**
* 메모리: 2020 KB, 시간: 112 ms
* 2022.09.15
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int T, N, M;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> T;

    while (T--) {
        cin >> N >> M;

        int cnt = 0;
        for (int i = N; i <= M; i++) {
            string cur = to_string(i);
            for (char v: cur)
                if (v == '0')
                    cnt++;
        }

        cout << cnt << '\n';
    }
}