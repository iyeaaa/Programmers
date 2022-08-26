/**
* 메모리: 9856 KB, 시간: 148 ms
* 2022.08.26
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;
typedef long long int lli;

int n, m, list[1001][1001], not_rmv[1001][1001];
int rowMax[1001], colMax[1001];

void solve() {
    for (int i = 0; i < m; i++)
        for (int j = 1; j < n; j++)
            if (list[rowMax[i]][i] < list[j][i])
                rowMax[i] = j;

    for (int i = 0; i < n; i++)
        for (int j = 1; j < m; j++)
            if (list[i][colMax[i]] < list[i][j])
                colMax[i] = j;

    for (int i = 0; i < m; i++)
        not_rmv[rowMax[i]][i] = true;

    for (int i = 0; i < n; i++)
        not_rmv[i][colMax[i]] = true;

    lli sum = 0;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++)
            if (!not_rmv[i][j])
                sum += list[i][j];

    cout << sum;
}

void input() {
    cin >> n >> m;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++)
            cin >> list[i][j];
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}

