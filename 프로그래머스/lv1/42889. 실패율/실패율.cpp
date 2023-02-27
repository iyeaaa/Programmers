#include <string>
#include <vector>
#include <algorithm>
#include <iostream>
#define All(x) (x).begin(), (x).end()
using namespace std;

vector<pair<double, int>> info;
vector<int> ans;

vector<int> solution(int N, vector<int> stages) {
    sort(All(stages));
    
    for (int i=1; i<=N; i++) {
        double total = stages.size() - (lower_bound(All(stages), i) - stages.begin());
        double same = upper_bound(All(stages), i) - lower_bound(All(stages), i);
        
        cout << total << ' ' << same << '\n';
        info.push_back({same/total, -i});
    }

    sort(All(info), greater<pair<double, int>>());

    for (auto [ratio, stage]: info)
        ans.push_back(-stage);

    return ans;
}