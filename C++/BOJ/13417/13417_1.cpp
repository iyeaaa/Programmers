/**
* 메모리: 2020 KB, 시간: 56 ms
* 2022.08.23
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

void solve() {
    int N; char A[1001];
    string answer;

    cin >> N;
    for(int i=0;i<N;i++) cin >> A[i];

    answer += A[0];
    for (int i = 1; i < N; i++)
        answer = min(A[i]+answer, answer+A[i]);

    cout << answer << endl;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int T; cin >> T;
    for(int i=0;i<T;i++) solve();
}
