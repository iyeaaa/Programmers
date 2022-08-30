/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.30
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int J, N, box[1001], r, c;

void solve() {
    cin >> J >> N;
    for (int i = 0; i < N; i++)
        cin >> r >> c, box[i] = r*c;
    sort(box, box+N, greater<int>());

    for (int i = 0; i < N; i++) {
        if (J > 0) J -= box[i];
        else {
            cout << i << endl;
            return;
        }
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    int T; cin >> T;
    while (T--) solve();
}

