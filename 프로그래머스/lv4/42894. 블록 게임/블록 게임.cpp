#include <string>
#include <vector>
#include <iostream>
#include <set>
using namespace std;

int n, ans;
vector<vector<int>> g;

int findBlock() {
    int cnt = 0;
    
    for (int i=0; i<n-1; i++) for (int j=0; j<n-2; j++) {
        int minus = 0, another = -1, notminus = 0;
        bool success = true;
        
        for (int k=0; k<2; k++) {
            for (int l=0; l<3; l++) {
                if (g[i+k][j+l] == 0) success = false;
                else if (g[i+k][j+l] == -1) minus++;
                else if (another == -1) another = g[i+k][j+l], notminus++;
                else if (another != g[i+k][j+l]) success = false;
                else notminus++;
            }
        }
        
        if (!success || minus != 2 || notminus != 4) continue;
        
        cnt++;
        for (int k=0; k<3; k++)
            g[i][j+k] = g[i+1][j+k] = 0;
    }
    
    for (int i=0; i<n-2; i++) for (int j=0; j<n-1; j++) {
        int minus = 0, notminus = 0, another = -1;
        bool success = true;
        
        for (int k=0; k<3; k++) {
            for (int l=0; l<2; l++) {
                if (g[i+k][j+l] == 0) success = false;
                else if (g[i+k][j+l] == -1) minus++;
                else if (another == -1) another = g[i+k][j+l], notminus++;
                else if (another != g[i+k][j+l]) success = false;
                else notminus++;
            }
        }
        
        if (!success || minus != 2 || notminus != 4) continue;
        
        cnt++;
        for (int k=0; k<3; k++)
            g[i+k][j] = g[i+k][j+1] = 0;
    }
    
    return cnt;
}

void fall() {
    for (int i=0; i<n; i++) if (g[0][i] <= 0) {
        int h = 0;
        while (h+1 < n && g[h+1][i] <= 0)
            h++;
        g[max(0, h-1)][i] = g[h][i] = -1;
    }
}

int solution(vector<vector<int>> b) {
    g = b;
    n = g.size();
    
    while (true) {
        fall();
        int cnt = findBlock();
        if (cnt == 0) break;
        ans += cnt;
    } 
    
    for (int i=0; i<n; i++) {
        for (int j=0; j<n; j++)
            cout << g[i][j] << ' ';
        cout << '\n';
    }
    
    return ans;
}