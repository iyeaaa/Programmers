#include <string>
#include <vector>
#include <bitset>
using namespace std;

const int INF = 99999999;
int n, m;
vector<vector<int>> target, beginning;

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
int f(const bitset<100>& flip) {
    int cnt = flip.count();
    vector<vector<int>> g = beginning;

    for (int column=0; column<m; column++)
        if (flip[column])
            for (int i=0; i<n; i++)
                g[i][column] = 1 - g[i][column];

    for (int i=0; i<n; i++) {
        int makeResult = make(g[i], target[i]);
        if (makeResult == -1)
            return INF;
        cnt += makeResult;
    }

    return cnt;
}

// O(2^m * n * m)
int solution(vector<vector<int>> tbeginning, vector<vector<int>> ttarget) {
    beginning = tbeginning;
    n = beginning.size();
    m = beginning.front().size();
    target = ttarget;

    int result = INF;
    for (int i=0; i<(1<<m); i++) {
        bitset<100> flip(i);
        result = min(result, f(flip));
    }

    return result == INF ? -1 : result;
}
