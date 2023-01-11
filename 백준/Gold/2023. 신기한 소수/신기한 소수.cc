
#include <iostream>
#include <algorithm>
#include <cmath>
using namespace std;

int N;

bool isPrime(int x) {
    if (x <= 1) return 0;
    for (int i=2; i<=sqrt(x); i++)
        if (x%i == 0) return 0;
    return 1;
}

void C(int x, int len) {
    if (!isPrime(x)) return;
    if (len == N) { cout << x << '\n'; return; }
    for (int i=0; i<=9; i++) C(x*10+i, len+1);
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
    cin >> N;
    for (int i=1; i<=9; i++) C(i, 1);
}
