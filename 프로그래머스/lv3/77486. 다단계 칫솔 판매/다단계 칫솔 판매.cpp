#include <string>
#include <vector>
#include <unordered_map>
using namespace std;

// f(cur) = sum(f(prev)/10)

unordered_map<string, vector<string>> tree;
unordered_map<string, vector<int>> amount;
unordered_map<string, vector<int>> last;
vector<int> result;

void f(const string& cur) {
    for (int v: amount[cur])
        last[cur].push_back(v);
    
    if (tree[cur].empty())
        return;
    
    for (const string& nxt: tree[cur]) {
        f(nxt);
        for (int v: last[nxt])
            if (v/10 > 0)
                last[cur].push_back(v/10);
    }
}

vector<int> solution(vector<string> enroll, vector<string> referral, vector<string> seller, vector<int> a) {
    
    for (int i=0; i<enroll.size(); i++)
        tree[referral[i]].push_back(enroll[i]);
    
    for (int i=0; i<seller.size(); i++)
        amount[seller[i]].push_back(a[i]*100);
    
    f("-");
    
    for (const string& s: enroll) {
        int benefit = 0;
        for (int v: last[s])
            benefit += v - v/10;
        result.push_back(benefit);
    }
    
    return result;
}


