#include <bits/stdc++.h>

#define FOR(i, l, r) for (int i = l; i < r; i++)
using namespace std;

int n, a[50], ans;

int main() {
//    freopen("input.txt", "r", stdin);

    cin >> n;
    FOR(i, 0, n) cin >> a[i];
    sort(a, a+n);

    ans = n == 1 ? 1 : 2;
    FOR(i, 0, n) FOR(j, i+1, n) {
        FOR(k, j+1, n) {
            if (a[i] + a[j] <= a[k]) break;
            ans = max(ans, k - j + 2);
        }
    }

    cout << ans;
}
// 1 2 3 3 4 4 5
// 3 3 4 4 5