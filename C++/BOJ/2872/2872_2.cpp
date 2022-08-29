/**
* 메모리: 3192 KB, 시간: 28 ms
* 2022.08.29
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N, A[300001];

void solve() {
    int next = N;
    for (int i = N-1; i >= 0; i--) if (next == A[i]) {
        next--;
    }
    cout << next;
}

void input() {
    cin >> N;
    for (int i = 0; i < N; i++)
        cin >> A[i];
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}

