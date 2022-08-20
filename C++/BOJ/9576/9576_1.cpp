/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.20
* by Alub
*/
#include <algorithm>
#include <iostream>
#include <cstring>

using namespace std;
typedef pair<int, int> pii;

bool stuSort(const pii& a, const pii& b) {
    return a.second != b.second ? a.second < b.second : a.first < b.first;
}

void solve() {
    int N, M; cin >> N >> M;
    bool isBrwed[N + 1]; pii student[M + 1];
    for(int i = 1; i <= M; i++) {
        int a, b; cin >> a >> b;
        student[i] = {a, b};
    }

    sort(student+1, student+M+1, stuSort);
    memset(isBrwed, false, sizeof(isBrwed));

    int count = 0;
    for (int i = 1; i <= M; i++) {
        auto [a, b] = student[i];
        for (int j = a; j <= b; j++) if (!isBrwed[j]) {
            isBrwed[j] = true;
            count++;
            break;
        }
    }

    cout << count << endl;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    int T; cin >> T;
    for(int i=0;i<T;i++) solve();
}