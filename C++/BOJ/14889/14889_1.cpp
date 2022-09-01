/**
* 메모리: 2024 KB, 시간: 92 ms
* 2022.09.01
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int N, S[21][21], sum, minValue = 999999999;

void C(int n, int cnt, vector<int> isTeam) {
    if (cnt == N / 2) {
        int teamSum = 0, enemySum = 0;
        for (int i = 1; i <= N; i++) {
            if (isTeam[i]) {
                for (int j = i - 1; j >= 1; j--) if (isTeam[j])
                    teamSum += S[i][j] + S[j][i];
            } else {
                for (int j = i - 1; j >= 1; j--) if (!isTeam[j])
                    enemySum += S[i][j] + S[j][i];
            }
        }
        minValue = min(minValue, abs(enemySum-teamSum));
        return;
    }
    for (int i = n; i <= N; i++) {
        isTeam[i] = true;
        C(i + 1, cnt + 1, isTeam);
        isTeam[i] = false;
    }
}

void solve() {
    vector<int> isTeam(N + 1);
    C(1, 0, isTeam);
    cout << minValue;
}

void input() {
    cin >> N;
    for (int i = 1; i <= N; i++)
        for (int j = 1; j <= N; j++)
            cin >> S[i][j], sum += S[i][j];
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
