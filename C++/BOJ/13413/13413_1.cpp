/**
* 메모리: 2652 KB, 시간: 68 ms
* 2022.08.22
* by Alub
*/
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

void solve() {
    int N, fromCnt = 0, toCnt = 0, differ = 0;
    string from, to;
    cin >> N >> from >> to;

    for(int i = 0; i < from.size(); i++) {
        if (from[i] == 'W') fromCnt++;
        if (to[i] == 'W') toCnt++;
    }

    for(int i = 0; i < from.size(); i++)
        if (from[i] != to[i])
            differ++;

    int rvs = abs(fromCnt-toCnt);
    cout << rvs + (differ-rvs)/2 << '\n';
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int T; cin >> T;
    while (T--) solve();
}
