
#include <iostream>
#include <algorithm>
using namespace std;

int n, m, g;
string ip;

int gcd(int x, int y) {
    return y==0 ? x : gcd(y, x%y);
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> ip;
    int mid = ip.find(':');
    n = stoi(ip.substr(0, mid));
    m = stoi(ip.substr(mid+1));
    g = gcd(n, m);

    cout << n/g << ':' << m/g;
}