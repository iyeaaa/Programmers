#include <string>
#include <vector>
using namespace std;

int n, m;
int g[105][105];
int temp[105][105];
vector<int> ans;

int f(int x1, int y1, int x2, int y2) {
    int ans = 99999999;
    
    for (int i=y1+1; i<=y2; i++)
        temp[x1][i] = g[x1][i-1];
    
    for (int i=x1+1; i<=x2; i++)
        temp[i][y2] = g[i-1][y2];
    
    for (int i=y2-1; i>=y1; i--)
        temp[x2][i] = g[x2][i+1];
    
    for (int i=x2-1; i>=x1; i--)
        temp[i][y1] = g[i+1][y1];
    
    for (int i=y1; i<=y2; i++)
        g[x1][i] = temp[x1][i], ans = min(ans, g[x1][i]),
        g[x2][i] = temp[x2][i], ans = min(ans, g[x2][i]);
    
    for (int i=x1; i<=x2; i++)
        g[i][y2] = temp[i][y2], ans = min(ans, g[i][y2]),
        g[i][y1] = temp[i][y1], ans = min(ans, g[i][y1]);
    
    return ans;
}

vector<int> solution(int rows, int columns, vector<vector<int>> queries) {
    n = rows, m = columns;
    int number = 1;
    
    for (int i=1; i<=rows; i++)
        for (int j=1; j<=columns; j++)
            g[i][j] = number++;
    
    for (const vector<int>& v: queries)
        ans.push_back(f(v[0], v[1], v[2], v[3]));
    
    return ans;
}