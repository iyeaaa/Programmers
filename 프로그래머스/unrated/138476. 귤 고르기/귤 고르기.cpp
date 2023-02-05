#include <string>
#include <vector>
#include <algorithm>
#include <unordered_map>
#include <set>
using namespace std;

unordered_map<int, int> cnt;
set<int> ans;

bool cmp(const int& a, const int& b) {
    return cnt[a] != cnt[b] ? cnt[a] > cnt[b] : a < b;
}

int solution(int k, vector<int> tangerine) {
    for (int v: tangerine) cnt[v]++;
    sort(tangerine.begin(), tangerine.end(), cmp);
    
    for (int i=0; i<k; i++) ans.insert(tangerine[i]);
    
    return ans.size();
}