
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;

int G, L;

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> G >> L;
    int T = L/G;
    for (int a=sqrt(T); a>=1; a--) if (T%a == 0) {
        int b = T/a, disjoint = true;
        for (int k=2; k<=sqrt(min(a, b)); k++) {
            if (a%k == 0 && b%k == 0) {
                disjoint = false;
                break;
            }
        }
        if (disjoint) {
            cout << a*G << ' ' << b*G;
            break;
        }
    }
}