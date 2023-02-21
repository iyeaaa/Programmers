#include <string>
#include <vector>
using namespace std;

int n, m;
int dy[] = {-1, 0, 1, 0};
int dx[] = {0, -1, 0, 1};
vector<vector<int>> board;

bool OOB(int y, int x) {
    return y<0 || y>=n || x<0 || x>=m;
}

int f(int cury, int curx, int oppy, int oppx) {
    if (!board[cury][curx]) 
        return 0;
    
    int rtn = 0;
    board[cury][curx] = 0;
    
    for (int i=0; i<4; i++) {
        int ny = cury + dy[i];
        int nx = curx + dx[i];
        
        if (OOB(ny, nx) || !board[ny][nx]) continue;
        
        int val = f(oppy, oppx, ny, nx) + 1;
        
        if (rtn%2==0 && val%2==1) rtn = val;
        else if (rtn%2==0 && val%2==0) rtn = max(rtn, val);
        else if (rtn%2==1 && val%2==1) rtn = min(rtn, val);
    }
    
    board[cury][curx] = 1;
    return rtn;
}

int solution(vector<vector<int>> b, vector<int> aloc, vector<int> bloc) {
    board = b;
    n = board.size();
    m = board.front().size();
    
    return f(aloc[0], aloc[1], bloc[0], bloc[1]);
}