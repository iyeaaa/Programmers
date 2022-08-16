/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.16
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N; cin >> N;
    while (N--) {
        int x; cin >> x;
        cout << x/25 << ' ' << (x%25)/10 << ' '
        << (x%25%10)/5 << ' ' << (x%25%10%5)/1 << '\n';
    }

    return 0;
}