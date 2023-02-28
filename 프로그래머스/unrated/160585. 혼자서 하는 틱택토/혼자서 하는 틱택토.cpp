#include <string>
#include <vector>
#include <algorithm>
#include <tuple>
using namespace std;

vector<tuple<int, int, int>> p;
int g[3][3];

bool isThree() {
    for (int i=0; i<3; i++) {
        if (g[i][0] == g[i][1] && g[i][1] == g[i][2] && g[i][2] != '.')
            return true;
        if (g[0][i] == g[1][i] && g[1][i] == g[2][i] && g[2][i] != '.')
            return true;
    }
    
    if (g[1][1] == g[0][0] && g[0][0] == g[2][2] && g[2][2] != '.')
        return true;
    if (g[0][2] == g[1][1] && g[1][1] == g[2][0] && g[2][0] != '.')
        return true;
    
    return false;
}

bool isPossible() {
    for (int i=0;i<9;i++) g[i/3][i%3] = '.';
    
    int prev = 'X';
    for (auto [y, x, c]: p) {
        if (prev == c) return false;
        if (isThree()) return false;
        g[y][x] = c;
        prev = c;
    }
    return true;
}

int solution(vector<string> board) {
    for (int i=0; i<3; i++) for (int j=0; j<3; j++)
        if (board[i][j] != '.')
            p.push_back({i, j, board[i][j]});
    
    sort(p.begin(), p.end());
    
    do {
        if (isPossible())
            return true;
    } while (next_permutation(p.begin(), p.end()));
    
    return false;
}