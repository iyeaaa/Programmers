
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
typedef long long ll;

ll N, K, V[21], ans=1;
vector<ll> L;

ll factorial(int x) {
    return x <= 1 ? 1 : x*factorial(x-1);
}

void solve2() {
    for (int i=1; i<=N; i++) {
        int x; cin >> x;
        L.push_back(x);
    }
    for (int i=0; i<N; i++) {
        for (int j=1; j<L[i]; j++)
            if (!V[j]) ans += factorial(N-i-1);
        V[L[i]] = true;
    }
    cout << ans;
}

void solve1() {
    cin >> K;
    for (int i=N; i>=1; i--) {
        ll cnt = factorial(i-1);
        for (int j=1; j<=N; j++) if (!V[j]) {
            if (K <= cnt) {
                L.push_back(j);
                V[j] = true;
                break;
            }
            K -= cnt;
        }
    }
    for (ll v: L) cout << v << ' ';
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> N >> K;
    if (K == 1) solve1();
    else solve2();
}