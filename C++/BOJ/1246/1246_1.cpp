/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.23
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N, M, P[1001];

void solve() {
    int maxIndex = 0;
    for (int i = 1; i < N; i++) if (P[maxIndex]*(maxIndex+1) <= P[i]*(i+1))
        maxIndex = i;
    cout << P[maxIndex] << ' ' << P[maxIndex]*(maxIndex+1);
}

void input() {
    cin >> N >> M;
    for(int i=0;i<M;i++) cin >> P[i];
    sort(P, P+M, greater<int>());
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
