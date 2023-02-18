#include <string>
#include <vector>
using namespace std;

vector<string> cards1;
vector<string> cards2;
vector<string> goal;

bool f(int lo, int hi, int idx) {
    if (idx == goal.size())
        return true;
    
    if (lo < cards1.size() && goal[idx] == cards1[lo])
        if (f(lo+1, hi, idx+1))
            return true;
    
    if (hi < cards2.size() && goal[idx] == cards2[hi])
        if (f(lo, hi+1, idx+1))
            return true;
    
    return false;
}

string solution(vector<string> c1, vector<string> c2, vector<string> g) {
    cards1 = c1, cards2 = c2, goal = g;
    return (f(0, 0, 0) ? "Yes" : "No");
}