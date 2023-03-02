#include <bits/stdc++.h>
using namespace std;
typedef pair<int, int> pii;

int m, n, ans;
vector<string> g;

void fall() {
    for (int i=m-2; i>=0; i--) for (int j=n-1; j>=0; j--) {
        if (isalpha(g[i][j]) && g[i+1][j] == '.') {
            int ni = i;
            while (ni+1 < m && g[ni+1][j] == '.')
                ni++;
            g[ni][j] = g[i][j];
            g[i][j] = '.';
        }
    }
}

int rmvSquare(const vector<pii>& squares) {
    int cnt = 0;
    for (auto [y, x]: squares) {
        if (isalpha(g[y][x])) g[y][x] = '.', cnt++;
        if (isalpha(g[y+1][x])) g[y+1][x] = '.', cnt++;
        if (isalpha(g[y][x+1])) g[y][x+1] = '.',cnt++;
        if (isalpha(g[y+1][x+1])) g[y+1][x+1] = '.', cnt++;
    }
    return cnt;
}

vector<pii> findSquare() {
    vector<pii> rtn;
    
    for (int i=0; i<m-1; i++) for (int j=0; j<n-1; j++) if (isalpha(g[i][j])) {
        unordered_set<int> s;
        s.insert(g[i][j]);
        s.insert(g[i][j+1]);
        s.insert(g[i+1][j]);
        s.insert(g[i+1][j+1]);
        
        if (s.size() == 1)
            rtn.push_back({i, j});
    }
    
    return rtn;
}

int solution(int tm, int tn, vector<string> board) {
    m = tm, n = tn;
    g = board;
    
    while (true) {
        vector<pii> squares = findSquare();
        if (squares.empty()) break;
        ans += rmvSquare(squares);
        fall();
    }
    
    return ans;
}