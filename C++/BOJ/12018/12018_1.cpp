/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.24
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int cnt, n, m, P, L, mileage[101], object[101];

void solve() {
    for (cnt = 0; cnt < n && m >= object[cnt]; m-=object[cnt], cnt++){}
    cout << cnt;
}

void input() {
    cin >> n >> m;
    for (int i = 0; i < n; i++) {
        cin >> P >> L;
        for (int j = 1; j <= P; j++)
            cin >> mileage[j];
        sort(mileage+1, mileage+P+1, greater<int>());
        object[i] = P < L ? 1 : mileage[L];
    }
    sort(object, object+n);
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
