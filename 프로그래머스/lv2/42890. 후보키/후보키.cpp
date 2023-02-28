#include <string>
#include <vector>
#include <iostream>
#include <unordered_set>
using namespace std;
typedef vector<string> vs;
typedef vector<int> vi;

int n, m, ans; 
vector<vs> relation;
vector<int> bits;

bool isKey(int bit) {
    unordered_set<string> s;
    
    for (const vs& r: relation) {
        string str;
        for (int i=0; i<m; i++)
            if (bit & (1<<i))
                str += r[i];
        s.insert(str);
        // if (bit == )
    }
    
    return s.size() == n;
}

bool isUnique(int info) {
    for (int bit: bits)
        if ((bit & info) == bit)
            return false;
    return true;
}

int solution(vector<vs> r) {
    relation = r;
    n = relation.size();
    m = relation.front().size();
    
    for (int i=1; i<(1<<m); i++)
        if (isUnique(i) && isKey(i))
            bits.push_back(i);
    
    return bits.size();
}