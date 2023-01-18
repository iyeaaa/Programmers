
#include <iostream>
#include <algorithm>
#define FIO ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
using namespace std;

int N, ans=1;

int main() {
    FIO
    cin >> N;
    if (N%2 == 0 || N%5 == 0) { cout << -1; return 0; }
    for (int x=1;; ans++, x=(x*10+1)%N)
        if (x%N == 0)
            break;
    cout << ans;
}