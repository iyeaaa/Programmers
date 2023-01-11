
#include <iostream>
#include <algorithm>
using namespace std;

int G, L, T, A, B;

int gcd(int a, int b) {return b==0?a:gcd(b, a%b);}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> G >> L; T = L/G;
    for (int a=1,b=T/a; a*a<=T; a++,b=T/a)
        if (T%a==0 && gcd(b, a)==1)
            A = a*G, B = b*G;
    cout << A << ' ' << B;
}