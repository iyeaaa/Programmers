
#include <iostream>
#include <algorithm>
using namespace std;
typedef long long ll;

ll gcd(ll x, ll y) {
    return y==0?x:gcd(y,x%y);
}

ll lcm(ll x, ll y) {
    return gcd(x,y)*x*y;
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    ll A, B, C, D; cin>>A>>B>>C>>D;
    ll RA, RB;
    ll l = lcm(B,D), g;

    A*=(l/B), C*=(l/D);
    RA = A + C;
    RB = l;
    g = gcd(RA, RB);

    RA /= g, RB /= g;
    cout << RA << ' ' << RB;
}