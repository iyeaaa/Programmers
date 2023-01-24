#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int n;
vector<pair<int, int>> ranks;

int solution(vector<vector<int>> scores) {
    n = scores.size();
    
    scores[0].push_back(1);
    for (int i=1; i<n; i++)
        scores[i].push_back(0);
    sort(begin(scores), end(scores), greater<>());
    
    int mx = -99999999, tempmx = -99999999;
    for (int i=0; i<n; i++) {
        if (scores[i][1] < mx) {
            if (scores[i][2]) return -1;
        } else {
            ranks.push_back({scores[i][0]+scores[i][1], scores[i][2]});
        }
        if (i<n-1 && scores[i][0] > scores[i+1][0])
            mx = max(mx, max(tempmx, scores[i][1]));
        else
            tempmx = max(tempmx, scores[i][1]);
    }
    
    sort(begin(ranks), end(ranks), greater<>());
    
    for (int i=1;; i++)
        if (ranks[i-1].second)
            return i;
}