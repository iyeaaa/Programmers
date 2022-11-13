
#include <iostream>
#include <queue>
using namespace std;

int t, a, b;

int R(int x) {
    return x/10 + (x%10) * 1000;
}

int L(int x) {
    return (x%1000) * 10 + (x/1000);
}

int S(int x) {
    return x-1 < 0 ? 9999 : x - 1;
}

int D(int x) {
    return (x*2)%10000;
}

void solve() {
    vector<int> v(10001);
    queue<pair<int, string>> q;
    v[a] = true;
    q.push({a, ""});

    while (!q.empty()) {
        auto [cur, str] = q.front(); q.pop();

        if (cur == b) {
            cout << str << '\n';
            return;
        }

        int next = D(cur);
        if (!v[next]) {
            q.push({next, str + "D"});
            v[next] = true;
        }
        next = S(cur);
        if (!v[next]) {
            q.push({next, str + "S"});
            v[next] = true;
        }
        next = L(cur);
        if (!v[next]) {
            q.push({next, str + "L"});
            v[next] = true;
        }
        next = R(cur);
        if (!v[next]) {
            q.push({next, str + "R"});
            v[next] = true;
        }
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> t;
    while (t--) {
        cin >> a >> b;
        solve();
    }
}