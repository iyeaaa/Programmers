#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int ans;

int solution(int k, int m, vector<int> score) {
    sort(score.begin(), score.end(), greater<int>());
    for (int i=m-1; i<score.size(); i+=m)
        ans += m*score[i];
    return ans;
}