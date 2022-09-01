/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.09.01
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N, M, L[101], answer = -1;

    cin >> N >> M;
    for (int i = 0; i < N; ++i)
        cin >> L[i];

    for (int i = 0; i < N; i++)
        for (int j = i+1; j < N; j++)
            for (int k = j+1; k < N; k++) {
                int sum = L[i]+L[j]+L[k];
                if (sum > M) continue;
                answer = max(answer, sum);
            }

    cout << answer;
}
