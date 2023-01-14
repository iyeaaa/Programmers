
#include <iostream>
#include <algorithm>
using namespace std;
typedef long long ll;

int n, m, five, two;

int f(int x, int k) {
    int rtn = 0;
    for (ll i=k; i<=x; i*=k)
        rtn += x/i;
    return rtn;
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> n >> m;
    five += f(n,5) - f(n-m,5) - f(m,5);
    two += f(n,2) - f(n-m,2) - f(m,2);

    cout << min(five, two);
}