#include <string>
#include <vector>
#include <algorithm>
#define all(x) (x).begin(), (x).end()
using namespace std;
typedef vector<int> vi;

int ans = 99999999;
int n, m, k;
vi dist, weaks;

int f() {
    int rtn = 99999999;
    
    for (int i=0; i<k; i++) {
        int start = weaks[i];
        int idx = 0;
        int last = -1;
    
        for (int j=i; j<i+k; j++) {
            int weak = (weaks[j%k] + n - start) % n;
            
            if (weak <= last)
                continue;
            
            if (idx == m) {
                idx = 99999999;
                break;
            }
            
            last = weak + dist[idx++];
        }
    
        rtn = min(rtn, idx);
    }
    
    return rtn;
}

int solution(int tn, vi w, vi d) {
    n = tn;
    dist = d;
    weaks = w;
    m = dist.size();
    k = weaks.size();
    
    sort(all(dist));
    
    do {
        ans = min(ans, f());
    } while (next_permutation(all(dist)));
    
    return ans == 99999999 ? -1 : ans;
}