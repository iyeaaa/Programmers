/**
* 메모리: 3680 KB, 시간: 8 ms
* 2022.08.23
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <string>
using namespace std;

string strn;

void solve() {
    int pCnt = 0;
    for (int i = 0; i < strn.size(); i++) {
        if (strn[i] == 'P') pCnt++;
        else if (pCnt < 2) { pCnt = 0; break; }
        else if (strn[i+1] == 'P') pCnt--, i++;
    }
    cout << (pCnt == 1 ? "PPAP" : "NP");
}

void input() {
    cin >> strn;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
