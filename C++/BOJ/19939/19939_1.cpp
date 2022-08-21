/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.21
* by Alub
*/
#include <algorithm>
#include <iostream>

using namespace std;

int N, K;

void solve() {
    N -= K*(K+1)/2;
    cout << (N < 0 ? -1 : N % K == 0 ? K-1 : K);
}

void input() {
    cin >> N >> K;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);
    input(), solve();
}