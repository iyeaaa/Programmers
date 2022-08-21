/**
* 메모리: 2288 KB, 시간: 16 ms
* 2022.08.21
* by Alub
*/
#include <stdio.h>
#include <algorithm>

using namespace std;

int N, INF = 999999;
int stt1[100001], stt2[100001], nd[100001];

void solve() {
    int cnt1 = 0;
    for (int i = 1; i < N; i++)
        if (stt1[i - 1] != nd[i - 1]) {
            cnt1++;
            stt1[i - 1] = 1 - stt1[i - 1];
            stt1[i] = 1 - stt1[i];
            if (i+1 >= N) continue;
            stt1[i + 1] = 1 - stt1[i + 1];
        }
    if (stt1[N - 1] != nd[N - 1]) cnt1 = INF;

    int cnt2 = 1;
    stt2[0] = 1 - stt2[0];
    stt2[1] = 1 - stt2[1];
    for (int i = 1; i < N; i++)
        if (stt2[i - 1] != nd[i - 1]) {
            cnt2++;
            stt2[i - 1] = 1 - stt2[i - 1];
            stt2[i] = 1 - stt2[i];
            if (i+1 >= N) continue;
            stt2[i + 1] = 1 - stt2[i + 1];
        }
    if (stt2[N - 1] != nd[N - 1]) cnt2 = INF;

    int result = min(cnt1, cnt2);
    printf("%d", result == INF ? -1 : result);
}

void input() {
    scanf("%d", &N);
    for(int i = 0; i < N; i++) {
        scanf("%1d", &stt1[i]);
        stt2[i] = stt1[i];
    }
    for(int i = 0; i < N; i++)
        scanf("%1d", &nd[i]);
}

int main() {
    input(), solve();
}