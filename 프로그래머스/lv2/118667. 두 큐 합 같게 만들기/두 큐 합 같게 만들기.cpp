#include <string>
#include <vector>
#include <algorithm>
#include <numeric>
#include <queue>
using namespace std;
typedef vector<int> vi;
typedef long long ll;

queue<int> q1, q2;
int n;

int f(ll lo, ll hi, int cnt) {
    if (cnt > 600001) return -1;
    if (lo == hi) return cnt;
    if (lo < hi) {
        lo += q2.front();
        hi -= q2.front();
        q1.push(q2.front());
        q2.pop();
    } else {
        lo -= q1.front();
        hi += q1.front();
        q2.push(q1.front());
        q1.pop();
    }
    return f(lo, hi, cnt+1);
}

int solution(vi queue1, vi queue2) {
    n = queue1.size() + queue2.size();
    ll sum1 = 0, sum2 = 0;
    
    for (int v: queue1) q1.push(v), sum1 += v;
    for (int v: queue2) q2.push(v), sum2 += v;
    
    return f(sum1, sum2, 0);
}