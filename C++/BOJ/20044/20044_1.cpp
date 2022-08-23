/**
* 메모리: 2060 KB, 시간: 0 ms
* 2022.08.23
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int n, w[10001];

void solve() {
    int minValue = w[0]+w[2*n-1];
    for (int i = 1; i < n; i++)
        minValue = min(minValue, w[i]+w[2*n-1-i]);
    cout << minValue;
}

void input() {
    cin >> n;
    for(int i=0;i<2*n;i++)
        cin >> w[i];
    sort(w, w+2*n);
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
