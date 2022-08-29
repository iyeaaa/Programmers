/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.29
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N, P[11], M;

int findMinIdx(int start) {
    int retIdx = start;
    for (int i = start+1; i < N; i++)
        if (P[retIdx] > P[i])
            retIdx = i;
    return retIdx;
}

void solve() {
    int ans[100], cost = 0, idx = 0, minIdx = findMinIdx(0);

    if (N == 1) {
        cout << 0;
        return;
    }

    if (minIdx == 0) {
        minIdx = findMinIdx(1);
        if (P[minIdx] <= M) {
            ans[idx++] = minIdx;
            cost += P[minIdx];
            minIdx = 0;
        } else {
            cout << 0;
            return;
        }
    }

    while (cost + P[minIdx] <= M) {
        ans[idx++] = minIdx;
        cost += P[minIdx];
    }

    for (int i = 0; i < idx; i++)
        for (int j = N-1; j >= 0; j--)
            if (cost - P[ans[i]] + P[j] <= M) {
                cost = cost - P[ans[i]] + P[j];
                ans[i] = j;
                break;
            }

    for (int i = 0; i < idx; i++)
        cout << ans[i];
}

void input() {
    cin >> N;
    for (int i = 0; i < N; i++)
        cin >> P[i];
    cin >> M;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}