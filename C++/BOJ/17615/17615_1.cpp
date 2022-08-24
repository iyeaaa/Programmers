/**
* 메모리: 2912 KB, 시간: 4 ms
* 2022.08.24
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N, RCnt=0, BCnt=0, first=1, last=1;
    string strn;

    cin >> N >> strn;

    for (int i = 0; i < N; i++) {
        if (strn[i] == 'R')
            RCnt++;
        else
            BCnt++;
    }

    for (int i = 1; i < N; i++){
        if (strn[i-1]==strn[i]) {
            first++;
        } else break;
    }

    for (int i = N-2; i >= 0; i--){
        if (strn[i+1]==strn[i]) {
            last++;
        } else break;
    }

    if (strn.front() == strn.back()) {
        if (strn.front() == 'R')
            cout << min(RCnt-max(first, last), BCnt);
        else
            cout << min(BCnt-max(first, last), RCnt);
    } else {
        if (strn.front() == 'R')
            cout << min(RCnt-first, BCnt-last);
        else
            cout << min(BCnt-first, RCnt-last);
    }
}
