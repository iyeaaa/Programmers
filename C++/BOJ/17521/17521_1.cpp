/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.25
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;
typedef long long int lli;

lli n, W, x;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> n >> W;

    lli minValue = 51;
    for (int i = 0; i < n; i++) {
        cin >> x;
        if (minValue < x)
            W += W/minValue*(x - minValue);
        minValue = x;
    }
    cout << W;
}
