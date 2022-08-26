/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.26
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    string strn; cin >> strn;

    int cur = 65, sum = 0;
    for (int i = 0; i < strn.size(); i++) {
        int len = abs(cur - strn[i]);
        sum += min(len, 26-len);
        cur = strn[i];
    }

    cout << sum;
}

