/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.09.21
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    string S; cin >> S;
    int W = 0, B = 0;

    for (int i = 0; i < S.size(); i++)
        if (S[i] != S[i-1]) {
            if (S[i] == '1') W++;
            else B++;
        }

    cout << min(W, B);
}