/**
* 메모리: 2156 KB, 시간: 0 ms
* 2022.09.12
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <string>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N, M, A['Z'], ans = 0;
    string S[1001], ansStrn = "";

    cin >> N >> M;
    for (int i = 0; i < N; i++)
        cin >> S[i];

    for (int i = 0; i < M; i++) {
        fill(A, A+'Z', 0);
        int maxAlpa = 'A';
        for (int j = 0; j < N; j++) {
            A[S[j][i]]++;
            if (A[S[j][i]] > A[maxAlpa] || (A[S[j][i]] == A[maxAlpa] && S[j][i] < maxAlpa))
                maxAlpa = S[j][i];
        }
        ansStrn += maxAlpa;
    }

    for (int i = 0; i < N; i++)
        for (int j = 0; j < M; j++)
            if (S[i][j] != ansStrn[j])
                ans++;

    cout << ansStrn << '\n' << ans;
}