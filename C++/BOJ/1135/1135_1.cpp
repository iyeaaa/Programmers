/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.25
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
typedef vector<vector<int> > vvi;

int N, x, dp[51];
vvi C(51);

int time(int n) {
    if (C[n].size() == 0 || dp[n] != 0)
        return dp[n];

    vector<int> v;
    for (int i = 0; i < C[n].size(); i++)
        v.push_back(time(C[n][i]));
    sort(v.begin(), v.end(), greater<int>());

    for (int i = 0; i < C[n].size(); i++)
        dp[n] = max(dp[n], v[i]+i+1);

    return dp[n];
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> N;
    cin >> x;
    for (int i = 1; i < N; i++) {
        cin >> x;
        C[x].push_back(i);
    }
    fill(dp, dp+51, 0);

    cout << time(0);
}
