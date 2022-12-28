
#include <iostream>
#include <queue>
using namespace std;
typedef long long int lli;

lli T, N, x, MOD = 1e9+7;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> T;
    while (T--) {
        lli ans = 1;
        priority_queue<lli, vector<lli>, greater<lli>> pq;
        cin >> N;
        for (int i=0;i<N;i++) cin >> x, pq.push(x);

        while (pq.size() > 1) {
            lli f = pq.top(); pq.pop();
            lli s = pq.top(); pq.pop();
            pq.push(f*s);
            ans = (ans * ((f*s) % MOD)) % MOD;
        }

        cout << ans << '\n';
    }
}
