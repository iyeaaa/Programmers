
#include <iostream>
#include <algorithm>
using namespace std;
typedef long long int ll;

ll gcd(ll x, ll y) {
    return y==0?x:gcd(y,x%y);
}

ll lcm(ll x, ll y) {
    return x*y/gcd(x,y);
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
    ll A, B; cin>>A>>B;
    cout << lcm(A,B);
}