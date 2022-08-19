/**
* 메모리: 5804 KB, 시간: 644 ms
* 2022.08.19
* by Alub
*/
#include <algorithm>
#include <iostream>

using namespace std;
typedef long long int ll;

void solve() {
    int N; cin >> N;
    int benefit[N+1];

    for (int i = 0; i < N; i++)
        cin >> benefit[i];

    int maxValue = benefit[N-1];
    ll sum = 0;

    for (int i = N-2; i >= 0; i--)
        if (benefit[i] < maxValue)
            sum += maxValue - benefit[i];
        else maxValue = benefit[i];

    cout << sum << endl;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    int T; cin >> T;

    while (T--) {
        solve();
    }
}