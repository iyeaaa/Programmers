/**
* 메모리: 2036 KB, 시간: 0 ms
* 2022.09.07
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N, M, G[51][51], ans = 1;
string x;

bool isPsb(int l) {
    for (int i = 0; i < N-l+1; i++)
        for (int j = 0; j < M-l+1; j++)
            if (G[i][j] == G[i+l-1][j] && G[i][j] == G[i][j+l-1] && G[i][j] == G[i+l-1][j+l-1])
                return true;
    return false;
}

void solve() {
    for (int l = 2; l <= 50; l++) {
        if (l > N || l > M) break;
        if (isPsb(l)) ans = l*l;
    }
    cout << ans;
}

void input() {
    cin >> N >> M;
    for (int i = 0; i < N; i++) {
        cin >> x;
        for (int j = 0; j < M; j++)
            G[i][j] = x[j]-'0';
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}