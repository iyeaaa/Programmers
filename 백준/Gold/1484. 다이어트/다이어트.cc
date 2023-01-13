
#include <iostream>
#include <algorithm>
using namespace std;
typedef long long ll;

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    ll G; cin >> G;
    bool nothing = true;
    for (ll i=1; i*i-(i-1)*(i-1)<=G; i++) {
        ll lo=0, hi=i;
        while (lo+1 < hi) {
            ll mid = (lo+hi)>>1;
            if (i*i-mid*mid >= G) lo = mid;
            else hi = mid;
        }
        if (lo!=0 && i*i-lo*lo == G)
            cout << i << '\n', nothing = false;
    }

    if (nothing) cout << -1;
}