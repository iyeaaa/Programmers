#include <string>
#include <vector>
#include <algorithm>
#include <map>
using namespace std;

vector<int> course;
vector<pair<string, int>> food[11];
vector<string> ans;
map<string, int> cnt;
string cur;

bool cmp(const pair<string, int>& a, pair<string, int>& b) {
    return a.second > b.second;
}

void f(const string& str, int idx) {
    if (find(course.begin(), course.end(), cur.size()) != course.end())
        cnt[cur]++;

    if (idx >= str.size())
        return;

    for (int i=idx; i<str.size(); i++) {
        cur.push_back(str[i]);
        f(str, i+1);
        cur.pop_back();
    }
}

vector<string> solution(vector<string> orders, vector<int> c) {
    course = c;

    for (string& order: orders) {
        sort(order.begin(), order.end());
        f(order, 0);
    }

    for (const auto& [k, v]: cnt)
        if (v >= 2)
            food[k.size()].push_back({k, v});

    for (int i=1; i<=10; i++) {
        if (food[i].empty()) continue;
        sort(food[i].begin(), food[i].end(), cmp);
        int frontCnt = food[i].front().second;
        for (int j=0; j<food[i].size() && food[i][j].second == frontCnt; j++)
            ans.push_back(food[i][j].first);
    }

    sort(ans.begin(), ans.end());

    return ans;
}