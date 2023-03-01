#include <string>
#include <vector>
#include <set>
#include <iostream>
using namespace std;
typedef long long ll;

multiset<pair<ll, ll>> times;
int ans = 0;

int solution(vector<string> lines) {
    for (string& line: lines) {
        line.pop_back();
        
        ll t = 0, diff = 0;
        t += stod(line.substr(11, 2)) * 3600000;
        t += stod(line.substr(14, 2)) * 60000;
        t += stod(line.substr(17, 6)) * 1000;
        diff = stod(line.substr(24)) * 1000;
        
        times.insert({t-diff+1, 1});
        times.insert({t, -1});
    }
    
    for (auto it1 = times.begin(); it1 != times.end(); it1++) {
        int cnt = 0;
        for (auto it2 = times.begin(); it2 != times.end(); it2++) {
            if ((it1->first) + 1000 <= it2->first) break;
            if (it1->first <= it2->first) cnt += max(0ll, it2->second);
            else cnt += it2->second;
        }
        ans = max(ans, cnt);
    }
    
    return ans;
}