
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int N, S;
vector<int> A;

int gcd(int x, int y) {
    return y==0 ? x : gcd(y, x%y);
}

int gcd(vector<int>& x) {
    int rtn = x[0];
    for (int v: x)
        rtn = gcd(rtn, v);
    return rtn;
}

int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> N >> S;
    for (int i=0; i<N; i++) {
        int x; cin >> x;
        A.push_back(abs(S-x));
    }

    cout << gcd(A);
}