/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.08.24
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int A, B, N, bookmark[6], cnt=0;

    cin >> A >> B >> N;
    for(int i=0;i<N;i++) cin >> bookmark[i];

    while (A != B) {
        int next = A-1;

        if (abs(B-next) > abs(B-(A+1)))
            next = A+1;

        for (int i = 0; i < N; i++)
            if (abs(B-next) > abs(B-bookmark[i]))
                next = bookmark[i];

        A = next, cnt++;
    }

    cout << cnt;
}