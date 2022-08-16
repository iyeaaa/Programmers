/**
* 메모리: 2024 KB, 시간: 0 ms
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

    int N;
    int LLCnt = 0;
    string strn; cin >> N >> strn;

    for (int i = 0; i < strn.size(); i++)
        if (strn[i] == 'L')
            LLCnt++;

    if (LLCnt == 0) LLCnt = 2;
    cout << strn.size() - (LLCnt/2-1) << endl;
}
