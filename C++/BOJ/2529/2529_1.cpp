/**
* 메모리: 2024 KB, 시간: 4 ms
* 2022.09.05
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int k, V[10];
string S, minans, maxans;

void dfs(int idx, string cur) {
    if (idx == k+1) {
        minans = min(minans, cur);
        maxans = max(maxans, cur);
        return;
    }
    for (int i = 0; i <= 9; i++) {
        if (V[i]) continue;
        if (S[(idx-1)*2] == '<' && cur[idx-1] > i+48)
            continue;
        else if (S[(idx-1)*2] == '>' && cur[idx-1] < i+48)
            continue;
        V[i] = true;
        dfs(idx+1, cur+to_string(i));
        V[i] = false;
    }
}

void solve() {
    for (int i = 0; i <= 9; i++) {
        V[i] = true;
        dfs(1, to_string(i));
        V[i] = false;
    }
    cout << maxans << '\n' << minans;
}

void input() {
    cin >> k;
    getline(cin, S);
    getline(cin, S);
    for (int i = 0; i <= k; i++)
        minans += '9', maxans += '0';
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}