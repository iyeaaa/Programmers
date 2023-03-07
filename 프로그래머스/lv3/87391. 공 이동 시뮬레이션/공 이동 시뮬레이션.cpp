#include <bits/stdc++.h>
using namespace std;

int n, m, x, y;
vector<vector<int>> queries;

bool f(int mid, bool isY, bool upper) {
    for (const vector<int>& q: queries) {
        if (isY && q[0] == 0) {
            mid = mid - q[1] < 0 ? 0 : mid - q[1];
        }
        else if (isY && q[0] == 1) {
            mid = mid + q[1] >= m ? m-1 : mid + q[1];
        }
        else if (!isY && q[0] == 2) {
            mid = mid - q[1] < 0 ? 0 : mid - q[1];
        }
        else if (!isY && q[0] == 3)
            mid = mid + q[1] >= n ? n-1 : mid + q[1];
    }
    return upper ? (isY ? mid > y : mid > x) : (isY ? mid >= y : mid >= x);
}

int upper(int i) {
    int lo = -1, hi = i ? m : n;
    while (lo + 1 < hi) {
        int mid = (lo + hi) >> 1;
        if (f(mid, i, true)) hi = mid;
        else lo = mid;
    }
    return hi;
}

int lower(int i) {
    int lo = -1, hi = i ? m : n;
    while (lo + 1 < hi) {
        int mid = (lo + hi) >> 1;
        if (f(mid, i, false)) hi = mid;
        else lo = mid;
    }
    return hi;
}

long long solution(int tn, int tm, int tx, int ty, vector<vector<int>> tqueries) {
    n = tn, m = tm, x = tx, y = ty, queries = tqueries;

    int xrange = upper(false) - lower(false);
    int yrange = upper(true) - lower(true);

    return 1ll * xrange * yrange;
}

int main() {
    cout << solution(	2, 5, 0, 1, {{3, 1}, {2, 2}, {1, 1}, {2, 3}, {0, 1}, {2, 1}});
}