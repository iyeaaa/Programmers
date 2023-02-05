#include <string>
#include <vector>
#include <algorithm>
#include <queue>
using namespace std;

vector<int> result;
priority_queue<pair<int, int>> pq;
const int MAX = 5'000'005;
int d[MAX], mn[MAX];

vector<int> solution(int e, vector<int> starts) {
    fill(d, d+MAX, 1);
    
    for (int i=2; i<=e; i++)
        for (int j=i; j<=e; j+=i)
            d[j]++;
    
    for (int i=e; i>=1; i--) {
        pq.push({d[i], -i});
        mn[i] = -pq.top().second;
    }
        
    for (auto v: starts)
        result.push_back(mn[v]);
    
    return result;
}