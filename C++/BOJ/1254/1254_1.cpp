/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.09.15
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N;
string S;

bool isPalin(int idx) {
    int half = (N-idx)/2;
    for (int i = 0; i < half; i++)
        if (S[idx+i] != S[N-1-i])
            return false;
    return true;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> S; N = S.size();

    for (int i = 0; i < N; i++)
        if (isPalin(i)) {
            cout << N+i;
            return 0;
        }
}