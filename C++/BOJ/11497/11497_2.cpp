/**
* 메모리: 2020 KB, 시간: 36 ms
* 2022.08.17
* by Alub
*/
#include <iostream>
#include <algorithm>

using namespace std;

void solve() {
    int N; cin >> N;
    int L[N + 1];

    for (int i = 0; i < N; i++)
        cin >> L[i];

    sort(L, L + N);

    int maxLevel = L[1] - L[0];
    for (int i = 0; i <= N-3; i++)
        maxLevel = max(maxLevel, L[i + 2] - L[i]);

    cout << maxLevel << '\n';
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    int T; cin >> T;
    while (T--)
        solve();
}