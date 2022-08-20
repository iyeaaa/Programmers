/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.20
* by Alub
*/
#include <algorithm>
#include <iostream>

using namespace std;

int N, M, J, A[22];

void solve() {
    int sum = 0, cur = 1;
    for (int i = 1; i <= J; i++) {
        while (A[i] < cur || cur+(M-1) < A[i]) {
            if (A[i] < cur) cur--;
            else cur++;
            sum++;
        }
    }
    cout << sum;
}

void input() {
    cin >> N >> M >> J;
    for (int i=1;i<=J;i++)
        cin >> A[i];
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);
    input(), solve();
}