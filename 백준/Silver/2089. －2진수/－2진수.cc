
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
typedef long long int ll;

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
    vector<int> l;
    int n; cin>>n;
    if (n == 0) {
        cout << '0'; return 0;
    }
    while (n != 0) {
        if (n%-2 == 0) l.push_back(0), n /= -2;
        else l.push_back(1), n = (n-1) / -2;
    }
    reverse(begin(l),end(l));
    for (int v: l) cout << v;
}