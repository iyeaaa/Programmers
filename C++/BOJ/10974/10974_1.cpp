/**
* 메모리: 2020 KB, 시간: 28 ms
* 2022.09.03
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int N;
vector<int> V(9);

void dfs(int cnt, vector<int> L) {
    if (cnt == N) {
        for (auto e: L)
            cout << e << ' ';
        cout << '\n';
        return;
    }

    for (int i = 1; i <= N; i++) {
        if (V[i]) continue;
        V[i] = true;
        L.push_back(i);
        dfs(cnt+1, L);
        V[i] = false;
        L.pop_back();
    }
}

void solve() { 
    dfs(0, vector<int>());
}

void input() {
    cin >> N;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
