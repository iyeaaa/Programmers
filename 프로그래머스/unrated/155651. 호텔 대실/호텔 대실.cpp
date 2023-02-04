#include <string>
#include <vector>
#include <tuple>
#include <algorithm>
using namespace std;
typedef tuple<int, int, int> ti;

int ans = 0, room = 0;

int solution(vector<vector<string>> book_time) {
    vector<ti> t;
    for (vector v: book_time) {
        t.push_back({stoi(v[0].substr(0, 2)), stoi(v[0].substr(3, 2)), 1});
        
        int h = stoi(v[1].substr(0, 2)), m = stoi(v[1].substr(3, 2))+10;
        t.push_back({h+m/60, m%60, -1});
    }
    
    sort(t.begin(), t.end());
    
    for (auto [h, m, cnt]: t)
        room += cnt, ans = max(ans, room);
    
    return ans;
}