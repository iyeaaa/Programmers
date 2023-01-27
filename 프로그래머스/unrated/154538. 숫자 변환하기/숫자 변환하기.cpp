#include <string>
#include <vector>
#include <algorithm>
using namespace std;

const int MAX = 1000005;
int dp[MAX];
int x, y, n;

int f(int cur) {
    if (cur == x) return 0;
    if (dp[cur] != -1) return dp[cur];
    int temp = MAX;
    if (cur-n >= x) temp = min(temp, f(cur - n)+1);
    if (cur%2 == 0 && cur/2 >= x) temp = min(temp, f(cur/2)+1);
    if (cur%3 == 0 && cur/3 >= x) temp = min(temp, f(cur/3)+1);
    return dp[cur] = temp;
}

int solution(int tx, int ty, int tn) {
    x = tx, y = ty, n = tn;
    fill(dp, dp+MAX, -1);
    return f(y) == MAX ? -1 : f(y);
}