#include <string>
#include <vector>
#include <unordered_map>
#include <map>
using namespace std;

unordered_map<int, int> cnt;
map<int, int, greater<int>> m;
string ans;

string solution(string X, string Y) {
    for (int v: X)
        cnt[v-'0']++;
    for (int v: Y) 
        if (cnt[v-'0'])
            cnt[v-'0']--, m[v-'0']++;
    for (auto [k, v]: m) {
        if (k == 0 && ans.empty()) {
            ans = '0';
            break;
        }
        for (int i=0; i<v; i++)
            ans += k + '0';
    }
    return ans.empty() ? "-1" : ans;
}