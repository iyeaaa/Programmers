/**
* 메모리: 2036 KB, 시간: 4 ms
* 2022.09.01
* by Alub
*/
// 시간복잡도는?
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
typedef pair<int, int> pii;
typedef vector<pii> vpii;

int N, M, city[51][51], answer = 999999999;
vpii H, C;

void dfs(int idx, int cnt, vpii chkn) {
    if (cnt == M) {
        int sum = 0;
        for (auto [hy, hx]: H) {
            int minDis = 9999999;
            for (auto [cy, cx]: chkn) {
                minDis = min(minDis, abs(cy-hy)+abs(cx-hx));
            }
            sum += minDis;
        }
        answer = min(answer, sum);
        return;
    }
    for (int i = idx; i < C.size(); i++) {
        chkn.push_back(C[i]);
        dfs(i+1, cnt+1, chkn);
        chkn.pop_back();
    }
}

void solve() {
    vpii chkn;
    dfs(0, 0, chkn);
    cout << answer;
}

void input() {
    cin >> N >> M;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++) {
            cin >> city[i][j];
            if (city[i][j] == 1)
                H.push_back({i, j});
            else if (city[i][j] == 2)
                C.push_back({i, j});
        }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
