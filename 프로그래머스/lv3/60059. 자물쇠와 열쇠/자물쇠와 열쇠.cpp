#include <string>
#include <vector>
using namespace std;
typedef vector<int> vi;

int n, m;
int g[101][101];

vector<vi> rotate(const vector<vi> v) {
    vector<vi> rtn(m, vi(m, 0));
    
    for (int i=0; i<m; i++)
        for (int j=0; j<m; j++)
            rtn[j][m-i-1] = v[i][j];
    
    return rtn;
}

bool f(const vector<vi>& cur) {
    for (int i=0; i<m+n-1; i++) {
        for (int j=0; j<m+n-1; j++) {
            
            for (int k=i; k<i+m; k++)
                for (int l=j; l<j+m; l++)
                    g[k][l] += cur[k-i][l-j];
            
            bool isSuccess = true;
            for (int k=m-1; k<m+n-1; k++)
                for (int l=m-1; l<m+n-1; l++)
                    if (g[k][l] != 1)
                        isSuccess = false;
            
            if (isSuccess)
                return true;
            
            for (int k=i; k<i+m; k++)
                for (int l=j; l<j+m; l++)
                    g[k][l] -= cur[k-i][l-j];
            
        }
    }
    
    return false;
}

bool solution(vector<vi> key, vector<vi> lock) {
    n = lock.size();
    m = key.size();
    
    for (int i=m-1; i<m-1+n; i++)
        for (int j=m-1; j<m-1+n; j++)
            g[i][j] = lock[i-m+1][j-m+1];
    
    for (int i=0; i<4; i++) {
        if (f(key)) return true;
        key = rotate(key);
    }
    
    return false;
}