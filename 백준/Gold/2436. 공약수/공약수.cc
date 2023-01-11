
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;

int G, L;

int gcd(int a, int b) {return b==0?a:gcd(b, a%b);}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> G >> L;
    int T = L/G;
    for (int a=sqrt(T); a>=1; a--) if (T%a == 0) {
        int b = T/a;
        if (gcd(b, a) == 1) {
            cout << a*G << ' ' << b*G;
            break;
        }
    }
}