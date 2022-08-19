/**
* 메모리: 2412 KB, 시간: 16 ms
* 2022.08.19
* by Alub
*/
#include <algorithm>
#include <iostream>

using namespace std;

int N;
int t[100001];

void solve() {
    for (int i = 0; i < N; i++) {
        t[i] -= N-i-1;
    }
    cout << N+1 + *max_element(begin(t), end(t));
}

void input() {
    cin >> N;
    for (int i = 0; i < N; i++)
        cin >> t[i];
    sort(t, t+N, greater<int>());
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);
    input();
    solve();
}