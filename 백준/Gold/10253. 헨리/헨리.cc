
#include <iostream>
#include <algorithm>
#define FIO ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
using namespace std;
typedef long long ll;

ll a, b;

ll gcd(ll x, ll y) {
    return y==0 ? x : gcd(y, x%y);
}

ll lcm(ll x, ll y) {
    return x*y/gcd(x,y);
}

int main() {
    FIO
    int T; cin >> T;
    ll x;
    while (T--) {
        cin >> a >> b;
        while (a) {
            x = b%a ? b/a+1 : b/a;
            ll l = lcm(x, b);
            a = l/b*a - l/x;
            b = l;
        }
        cout << x << '\n';
    }
}