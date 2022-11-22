
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

int n, order[10001], path[10001], dp[10001], l[10001], x, mxi;
vector<int> stack;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> n;
    fill(path, path+n+1, -1);
    fill(dp+1, dp+n+1, 1);
    for (int i = 1; i <= n; i++) cin >> l[i];
    for (int i = 1; i <= n; i++)
        cin >> x, order[x] = i;

    for (int i = 1; i <= n; i++) {
        for (int j = 1; j < i; j++)
            if (order[l[j]] < order[l[i]] && dp[j] + 1 > dp[i])
                dp[i] = dp[j] + 1, path[i] = j;
        if (dp[i] > dp[mxi]) mxi = i;
    }

    cout << dp[mxi] << '\n';
    while (mxi != -1)
        stack.push_back(l[mxi]),
        mxi = path[mxi];
    sort(stack.begin(), stack.end());

    for (int v: stack)
        cout << v << ' ';
}