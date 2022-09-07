/**
* 메모리: 2156 KB, 시간: 0 ms
* 2022.09.07
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int N, V[10];
vector<long> L;

void dfs(int depth, int digit, int idx, long cur) {
    if (depth == digit)
        return;

    L.push_back(cur);
    for (int i = idx; i >= 0; i--) if (!V[i]) {
        V[i] = true;
        dfs(depth, digit+1, i-1, cur*10+i);
        V[i] = false;
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    cin >> N;

    dfs(11, 0, 9, 0);
    sort(L.begin(), L.end());
    if (N+1 >= L.size()) cout << -1;
    else cout << L[N+1];
}