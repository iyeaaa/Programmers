
#include <iostream>
#include <algorithm>
using namespace std;
typedef long long ll;

int n, open[101];

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    int T; cin >> T;
    while (T--) {
        cin >> n;
        fill(open,open+n+1,1);
        int ans = 0;
        for (int i=2; i<=n; i++)
            for (int j=i; j<=n; j+=i)
                open[j] = !open[j];
        for (int i=1; i<=n; i++)
            if (open[i]) ans++;
        cout << ans << '\n';
    }
}