/**
* 메모리: 2328 KB, 시간: 8 ms
* 2022.08.29
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int T;
    string from, to;

    cin >> T;
    while (T--) {
        cin >> from >> to;

        int fCnt = 0, tCnt = 0, differCCnt = 0;
        for (int i = 0; i < from.size(); i++) {
            if (from[i] == '0') fCnt++;
            if (to[i] == '0') tCnt++;
        }

        for (int i = 0; i < from.size(); i++)
            if (from[i] != to[i]) differCCnt++;

        cout << (differCCnt-abs(fCnt-tCnt))/2 + abs(fCnt - tCnt) << '\n';
    }
}

