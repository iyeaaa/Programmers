/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.15
* by Alub
*/
#include <iostream>
#include <vector>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    int N, L; cin >> N >> L;
    vector<bool> isLeak(1001);

    for(int i = 0; i < N; i++) {
        int x; cin >> x;
        isLeak[x] = true;
    }

    int cnt = 0;
    for(int i = 1; i <= 1000; i++) {
        if(!isLeak[i]) continue;
        cnt++;
        for(int j = 0; j < L; j++) {
            isLeak[i+j] = false;
        }
    }

    cout << cnt;
}