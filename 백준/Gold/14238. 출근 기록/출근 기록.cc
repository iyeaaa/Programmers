
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef tuple<int, int, int, int> tii;
typedef tuple<ll, ll, ll> tll;
typedef vector<int> vi;

char ans[51];
string s;
int cnt[3], dp[51][51][51][4][4];

int f(int a, int b, int c, int l1, int l2) {
    if (a == cnt[0] && b == cnt[1] && c == cnt[2]) return true;
    if (dp[a][b][c][l1][l2]) return false;
    dp[a][b][c][l1][l2] = true;

    if (a+1 <= cnt[0]) {
        ans[a+b+c] = 'A';
        if (f(a+1, b, c, l2, 0)) return true;
    }

    if (b+1 <= cnt[1]) {
        ans[a+b+c] = 'B';
        if (l2 != 1 && f(a, b+1, c, l2, 1)) return true;
    }

    if (c+1 <= cnt[2]) {
        ans[a+b+c] = 'C';
        if (l1 != 2 && l2 != 2 && f(a, b, c+1, l2, 2)) return true;
    }
    return false;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> s;
    for (char v: s) cnt[v-'A']++;

    if (f(0, 0, 0, 3, 3)) {
        for (int i = 0; i < s.size(); i++)
            cout << ans[i];
    } else cout << -1;
}