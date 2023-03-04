#include <bits/stdc++.h>
using namespace std;

int last = 0, ans;

int solution(int n, int m, vector<int> section) {
    for (int s: section) {
        if (s > last) {
            ans++;
            last = s + m - 1;
        }
    }
    return ans;
}