/**
* 메모리: 2168 KB, 시간: 0 ms
* 2022.08.20
* by Alub
*/
#include <algorithm>
#include <iostream>
#include <cstring>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    int N, K; cin >> N >> K;
    string strn; cin >> strn;
    bool isAte[N]; memset(isAte, false, sizeof(isAte));

    int cnt = 0;
    for (int i = 0; i < N; i++) if (strn[i] == 'P') {
        for (int j = i - K; j <= i + K; j++) {
            if (j < 0 || j >= N) continue;
            if (strn[j] != 'H' || isAte[j]) continue;
            cnt++; isAte[j] = true;
            break;
        }
    }

    cout << cnt;
}