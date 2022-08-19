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
    int P[N]; for(int i = 0; i < N; i++) cin >> P[i];
    sort(P, P + N);

    int idx = 0, sum = 0;
    while (idx < N && P[idx] < 0)
        if (idx % M == 0)
            sum += -2*P[idx++];
        else idx++;

    idx = N-1;
    while (idx >= 0 && P[idx] > 0)
        if ((N-1-idx) % M == 0)
            sum += 2*P[idx--];
        else idx--;

    cout << sum - max(-1*P[0], P[N-1]);
}