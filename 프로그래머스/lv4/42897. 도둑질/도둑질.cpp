#include <vector>
#include <algorithm>
using namespace std;

const int MAX = 1000005;
int dp1[MAX], dp2[MAX];
int n;

int solution(vector<int> money) {
    n = money.size();
    
    dp1[0] = money[0];
    dp1[2] = money[0] + money[2];
    
    dp2[1] = money[1];
    dp2[2] = money[2];
    
    for (int i=3; i<n-1; i++)
        dp1[i] = max(dp1[i-3], dp1[i-2]) + money[i];
    
    for (int i=3; i<n; i++)
        dp2[i] = max(dp2[i-3], dp2[i-2]) + money[i];
    
    return max(*max_element(dp1,dp1+MAX), *max_element(dp2,dp2+MAX));
}