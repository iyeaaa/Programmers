/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.19
* by Alub
*/
#include <algorithm>
#include <iostream>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    int N, M; cin >> N >> M;
    int L[N]; for(int i=0;i<N;i++) cin >> L[i];
    sort(L, L+N);

    int curLen = M;
    for (int i = 0; i < N; i++) {
        if (curLen >= L[i]) {
            curLen++;
        } else break;
    }

    cout << curLen;
}