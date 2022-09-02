/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.09.02
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int E, S, M, i;

void solve() {
    int e = 1, s = 1, m = 1;
    for (i = 1; e!=E || s!=S || m!=M; i++) {
        e++, s++, m++;
        if (e == 16) e=1;
        if (s == 29) s=1;
        if (m == 20) m=1;
    }
    cout << i;
}

void input() {
    cin >> E >> S >> M;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
