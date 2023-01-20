#include <vector>
#include <algorithm>
using namespace std;

const int MAX = 1000005;
int dp1[MAX], dp2[MAX];
int n;

int solution(vector<int> money) {
    n = money.size();

    dp1[0] = money[0];
    dp1[1] = money[0];
    dp2[1] = money[1];

    for (int i=2; i<n-1; i++)
        dp1[i] = max(dp1[i-2] + money[i], dp1[i-1]);

    for (int i=2; i<n; i++)
        dp2[i] = max(dp2[i-2] + money[i], dp2[i-1]);

    return max(dp1[n-2], dp2[n-1]);
}