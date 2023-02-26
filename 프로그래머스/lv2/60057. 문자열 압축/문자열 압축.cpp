#include <string>
#include <vector>
using namespace std;

int n;
int ans;

int solution(string s) {
    n = s.size();
    ans = n;

    for (int i=1; i<=n; i++) {
        int cnt = 0;
        vector<pair<string, int>> vs;
        vs.push_back({s.substr(0, i), 1});

        for (int j=i; j<n; j+=i) {
            string cur = s.substr(j, i);
            if (vs.back().first == cur)
                vs[vs.size()-1].second++;
            else
                vs.push_back({cur, 1});
        }

        for (const auto& [str, val]: vs)
            cnt += (val == 1 ? str.size() : str.size()+to_string(val).size());

        ans = min(ans, cnt);
    }

    return ans;
}