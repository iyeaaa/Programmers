#include <string>
#include <vector>
using namespace std;
typedef pair<int, int> pi;

vector<pi> dp(100'001, {99999999, -99999999});

vector<int> solution(int target) {
    dp[0] = {0, 0};
    for (int i=1; i<=target; i++) {
        if (i-50 >= 0) dp[i] = min(dp[i], {dp[i-50].first+1, dp[i-50].second-1});
        for (int j=1; j<=20; j++) {
            if (i-j >= 0) dp[i] = min(dp[i], {dp[i-j].first+1, dp[i-j].second-1});
            if (i-2*j >= 0) dp[i] = min(dp[i], {dp[i-2*j].first+1, dp[i-2*j].second});
            if (i-3*j >= 0) dp[i] = min(dp[i], {dp[i-3*j].first+1, dp[i-3*j].second});
        }
    }
    return {dp[target].first, -dp[target].second};
}