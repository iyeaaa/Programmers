
#include <iostream>
#include <algorithm>
#include <vector>
#include <string>
#define FIO ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
using namespace std;
typedef long long ll;

int a, b;
vector<int> l;

bool isPrime(ll x) {
    if (x == 0 || x == 1) return false;
    for (int i=2; i*i<=x; i++)
        if (x%i == 0)
            return false;
    return true;
}

void f(string s) {
    ll x = stol(s);
    if (s.size()>9 || x > b) return;
    if (s[0]!='0' && a <= x && isPrime(x)) l.push_back(x);
    for (int i=0; i<=9; i++)
        f(to_string(i)+s+to_string(i));
}

int main() {
    FIO
    cin >> a >> b;
    if (a <= 11 && 11 <= b) l.push_back(11);
    for (int i=0; i<=9; i++) f(to_string(i));
    sort(begin(l), end(l));
    for (int v: l) cout << v << '\n';
    cout << -1;
}