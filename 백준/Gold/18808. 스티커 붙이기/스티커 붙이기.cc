#include <bits/stdc++.h>

using namespace std;
typedef vector<int> vi;

int n, m, k, ans;
bool note[41][41];

void rotate(vector<vi> &v) {
    vector<vi> temp(v.front().size(), vi(v.size()));
    int r = v.size(), c = v.front().size();
    for (int i = 0; i < r; i++)
        for (int j = 0; j < c; j++)
            temp[j][r - i - 1] = v[i][j];
    v = temp;
}

bool isFit(const vector<vi> &mo, int y, int x) {
    int r = mo.size(), c = mo.front().size();
    for (int i = y; i < y + r; i++)
        for (int j = x; j < x + c; j++)
            if (mo[i - y][j - x] && note[i][j])
                return false;
    return true;
}

void attach(const vector<vi> &mo, int y, int x) {
    int r = mo.size(), c = mo.front().size();
    for (int i = y; i < y + r; i++)
        for (int j = x; j < x + c; j++)
            if (mo[i - y][j - x])
                note[i][j] = true;
}

//O(k * (n-r) * (m-c) * r * c)
int main() {
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);

    cin >> n >> m >> k;
    for (int q = 0; q < k; q++) {
        int r, c;
        cin >> r >> c;
        vector<vi> stk(r, vi(c));

        for (int i = 0; i < r; i++)
            for (int j = 0; j < c; j++)
                cin >> stk[i][j];

        for (int ro = 0; ro < 4; ro++) {
            for (int i = 0; i < n - r + 1; i++)
                for (int j = 0; j < m - c + 1; j++)
                    if (isFit(stk, i, j)) {
                        attach(stk, i, j);
                        goto success;
                    }
            rotate(stk);
            swap(r, c);
        }

        success:
        continue;
    }

    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++)
            if (note[i][j])
                ans++;

    cout << ans;
}