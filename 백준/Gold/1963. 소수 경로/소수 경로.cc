
#include <iostream>
#include <cstring>
#include <algorithm>
#include <queue>
using namespace std;

int a, b, isPrime[10000];

void solve() {
    cin >> a >> b;

    int v[10000];
    fill(v, v+10000, 9999);
    queue<int> q; q.push(a);
    v[a] = 0;

    while (!q.empty()) {
        int cur = q.front(); q.pop();
        if (cur == b) {
            cout << v[cur] << '\n';
            return;
        }
        for (int i = 0; i < 4; i++) {
            string scur = to_string(cur);
            for (int j = 0; j < 10; j++) {
                scur[i] = j + '0';
                int next = stoi(scur);
                if (scur[0] == '0') continue;
                if (!isPrime[next]) continue;
                if (v[next] != 9999) continue;
                q.push(next);
                v[next] = v[cur] + 1;
            }
        }
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    memset(isPrime, true, sizeof(isPrime));
    isPrime[0] = false, isPrime[1] = false;
    for (int i = 2; i < 10000; i++)
        for (int j = 2; i*j < 10000; j++)
            isPrime[i*j] = false;

    int t; cin >> t;
    while (t--) solve();
}