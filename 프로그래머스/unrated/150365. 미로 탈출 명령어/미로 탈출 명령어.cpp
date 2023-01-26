#include <string>
#include <vector>
using namespace std;

int n, m, r, c, k;

string f(int x, int y, string s) {
    int rmn = k - s.size();
    int shorts = abs(r-x) + abs(c-y);
    
    if (rmn < shorts || rmn%2 != shorts%2)
        return "impossible";
    
    if (s.size() == k)
        return s;
    
    if (rmn == shorts) {
        if (x < r) return f(x+1, y, s + 'd');
        if (y > c) return f(x, y-1, s + 'l');
        if (y < c) return f(x, y+1, s + 'r');
        return f(x-1, y, s + 'u');
    }
        
    if (x < n) return f(x+1, y, s + 'd');
    if (y > 1) return f(x, y-1, s + 'l');
    return f(x, y+1, s + 'r');
}

string solution(int tn, int tm, int x, int y, int tr, int tc, int tk) {
    n = tn, m = tm, r = tr, c = tc, k = tk;
    return f(x, y, "");
}