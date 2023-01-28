#include <string>
#include <vector>
using namespace std;
typedef long long ll;

int n;
int o[2][5] = {{0, 0, 0, 0, 0}, {1, 1, 0, 1, 1}};

int ans;
ll l, r;
ll five[21];

void f(int i, int one, ll lo) {
    if (i == n) {
        ans += one && lo >= l && lo <= r;
        return;
    }
    
    ll s = five[n-i]*(lo-1) + 1;
    ll e = s + five[n-i] - 1;
    if (!(r < s || e < l))
        for (int j=1; j<=5; j++)
            f(i+1, o[one][j-1], 5*(lo-1)+j);
}

int solution(int tn, ll tl, ll tr) {
    n = tn, l = tl, r = tr;
    
    for (ll i=0,j=1; i<=20; i++,j*=5)
        five[i] = j;
    
    f(0, 1, 1);
    return ans;
}