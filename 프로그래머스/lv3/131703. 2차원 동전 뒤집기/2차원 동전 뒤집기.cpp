#include <string>
#include <vector>
using namespace std;

const int INF = 99999999;
int n, m;
vector<int> flip;
vector<vector<int>> target, beginning;
int result = INF;

// O(m)
int make(const vector<int>& a, const vector<int>& b) {
    // 뒤집지 않아도 되는 경우
    if (a == b)
        return 0;
    
    // 뒤집어서 만들 수 없는경우
    for (int i=0; i<m; i++)
        if (a[i] != 1 - b[i])
            return -1;
    
    // 뒤집으면 만들 수 있는경우
    return 1;
}

// 뒤집어야 하는 횟수 반환
// O(n*m)
int f() {
    int rtn = flip.size();
    vector<vector<int>> g = beginning;
    
    for (int column: flip)
        for (int i=0; i<n; i++)
            g[i][column] = 1 - g[i][column];
    
    for (int i=0; i<n; i++) {
        int cnt = make(g[i], target[i]);
        if (cnt == -1)
            return INF;
        rtn += cnt;
    }
    
    return rtn;
}

// O(2^n * n * m)
void C(int idx) {
    result = min(result, f());
    
    for (int i=idx; i<m; i++) {
        flip.push_back(i);
        C(i+1);
        flip.pop_back();
    }
}

// O(2^n * n * m)
int solution(vector<vector<int>> tbeginning, vector<vector<int>> ttarget) {
    beginning = tbeginning;
    n = beginning.size();
    m = beginning.front().size();
    target = ttarget;

    C(0);
    return result == INF ? -1 : result;
}