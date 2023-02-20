#include <string>
#include <vector>
#include <algorithm>
using namespace std;
typedef long long ll;

bool isPrime(ll x) {
    if (x <= 1) return false;
    for (ll i=2; i*i<=x; i++)
        if (x%i == 0)
            return false;
    return true;
}

string toK(int n, int k) {
    string rtn;
    while (n > 0)
        rtn += n%k + '0', n /= k;
    reverse(rtn.begin(), rtn.end());
    return rtn;
}

int cntPrime(string& s) {
    ll x = 0;
    int cnt = 0;
    for (char c: s)
        if (c == '0') {
            cnt += isPrime(x);
            x = 0;
        } else {
            x = x*10 + (c-'0');
        }
    return cnt + isPrime(x);
}

int solution(int n, int k) {
    string sn = toK(n, k);
    return cntPrime(sn);
}
