/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.29
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int n, L[1001];

void solve() {
    int answer = 0;
    for (int i = n-2; i >= 0; i--)
        answer += L[n-1] + L[i];
    cout << answer;
}

void input() {
    cin >> n;
    for (int i = 0; i < n; i++)
        cin >> L[i];
    sort(L, L+n);
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}

