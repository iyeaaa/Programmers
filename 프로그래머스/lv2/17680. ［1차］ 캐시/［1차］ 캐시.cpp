#include <bits/stdc++.h>
#define all(x) (x).begin(), (x).end()
using namespace std;

int ans;
vector<string> cache;

int solution(int cacheSize, vector<string> cities) {
    for (int i=0; i<cities.size(); i++) {
        transform(all(cities[i]), cities[i].begin(), ::toupper);
        auto pos = find(all(cache), cities[i]);
        if (cache.empty()) {
            ans += 5;
            if (cacheSize > 0) cache.push_back(cities[i]);
            continue;
        } else if (pos != cache.end()) {
            ans += 1;
            cache.erase(pos);
            cache.push_back(cities[i]);
        } else if (cache.size() < cacheSize) {
            ans += 5;
            cache.push_back(cities[i]);
        } else {
            cache.erase(cache.begin());
            ans += 5;
            cache.push_back(cities[i]);
        }
    }
    
    return ans;
}

// 5 5 5 1  1 1 1 1 1