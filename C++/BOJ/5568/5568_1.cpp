/**
* 메모리: 2292 KB, 시간: 0 ms
* 2022.09.15
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <unordered_set>
#include <string>
using namespace std;

int n, k, C[11], V[11];
unordered_set<string> S;

void permutation(string cur, int cnt) {
    if (cnt == k) {
        S.insert(cur);
        return;
    }
    for (int i = 0; i < n; i++) if (!V[i]) {
        V[i] = true;
        permutation(cur+to_string(C[i]), cnt+1);
        V[i] = false;
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> n >> k;
    for (int i = 0; i < n; i++)
        cin >> C[i];

    permutation("", 0);

    cout << S.size();
}