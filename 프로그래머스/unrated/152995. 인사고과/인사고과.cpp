#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int n;
vector<pair<int, int>> ranks;

bool cmp(const vector<int> a, const vector<int> b) {
    return a[0] != b[0] ? a[0] > b[0] : a[1] < b[1];
}

int solution(vector<vector<int>> scores) {
    n = scores.size();
    
    scores[0].push_back(1);
    for (int i=1; i<n; i++)
        scores[i].push_back(0);
    sort(begin(scores), end(scores), cmp);
    
    int mx = -99999999;
    for (auto v: scores) {
        if (v[1] < mx) {
            if (v[2] == 1) return -1;
        } else {
            ranks.push_back({v[0]+v[1], v[2]});
            mx = v[1];
        }
    }
    
    sort(begin(ranks), end(ranks), greater<>());
    
    for (int i=1;; i++)
        if (ranks[i-1].second)
            return i;
}