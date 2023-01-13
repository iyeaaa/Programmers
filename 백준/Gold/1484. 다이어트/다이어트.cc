
#include <iostream>
#include <algorithm>
using namespace std;

int lo = 1, hi = 1, nothing = true;

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    int G; cin >> G;
    while (hi*hi - (hi-1)*(hi-1) <= G) {
        if (hi*hi - lo*lo > G) {
            lo++;
        } else if (hi*hi - lo*lo < G) {
            hi++;
        } else {
            cout << hi << '\n';
            nothing = false;
            hi++;
        }
    }

    if (nothing) cout << -1;
}