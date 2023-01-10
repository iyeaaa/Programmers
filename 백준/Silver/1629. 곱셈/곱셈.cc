#include <iostream>
#include <algorithm>

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef tuple<int, int, int> tii;

int A, B, C;

ll f(int x) {
    if (x == 1) return A%C;
    ll temp = f(x/2);
    if (x%2 == 0) return temp*temp%C;
    return ((temp*temp)%C * f(1)) % C;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    cin >> A >> B >> C;
    cout << f(B);
}