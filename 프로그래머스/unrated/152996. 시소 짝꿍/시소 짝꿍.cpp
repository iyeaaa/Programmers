#include <string>
#include <vector>
#include <map>
using namespace std;
typedef long long ll;

ll n, ans;
map<ll, ll> l;

ll solution(vector<int> w) {
    n = w.size();

    for (auto v: w)
        l[v]++;
    
    for (auto [k, v]: l) {
        ans += v*(v-1)/2;
        
        if (k%2 == 0)
            ans += v*l[k/2*3];

        ans += v*l[k*2];

        if (k%3 == 0)
            ans += v*l[k/3*4];
    }

    return ans;
}