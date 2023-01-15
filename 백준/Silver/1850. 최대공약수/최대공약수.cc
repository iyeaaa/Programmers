
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;
typedef long long ll;

int gcd(ll a, ll b) {
    return b==0?a:gcd(b,a%b);
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    ll a, b; cin >> a >> b;
    int g = gcd(a, b);
    for (int i=0; i<g; i++)
        cout << '1';
}