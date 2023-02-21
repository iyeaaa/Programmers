#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int points[1005][1005];
int m, n;
int result;

int solution(vector<vector<int>> board, vector<vector<int>> skill) {
    n = board.size();
    m = board.front().size();

    for (const vector<int>& v: skill) {
        int type = v[0], r1 = v[1], c1 = v[2],
            r2 = v[3], c2 = v[4], degree = type==1 ? -v[5] : v[5];
        
        points[r1][c1] += degree;
        points[r1][c2+1] -= degree;
        points[r2+1][c1] -= degree;
        points[r2+1][c2+1] += degree;
    }
    
    for (int i=0; i<n; i++)
        for (int j=1; j<m; j++)
            points[i][j] += points[i][j-1];
    
    for (int i=1; i<n; i++)
        for (int j=0; j<m; j++)
            points[i][j] += points[i-1][j];
    
    for (int i=0; i<n; i++)
        for (int j=0; j<m; j++)
            if (points[i][j] + board[i][j] >= 1)
                result++;
            
    return result;
}
