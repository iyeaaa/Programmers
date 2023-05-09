#include <bits/stdc++.h>
#define F(i, l, r) for (int i = l; i < r; i++)
using namespace std;
typedef vector<int> vi;

bool cmp(const vi& a, const vi& b) {
    return a[1] < b[1];
}

int solution(vector<vector<int>> targets) {
    sort(targets.begin(), targets.end(), cmp);
    int last = -1, cnt = 0;
    for (auto target: targets) {
        int s = target[0], e = target[1];
        if (last <= s) cnt++, last = e;
    }
    return cnt;
}