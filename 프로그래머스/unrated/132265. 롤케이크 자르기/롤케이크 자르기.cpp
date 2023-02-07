#include <string>
#include <vector>
#include <unordered_map>
using namespace std;

int result;
unordered_map<int,int> m1, m2;

int solution(vector<int> topping) {
    for (int v: topping)
        m2[v]++;
    
    for (int v: topping) {
        m1[v]++;
        if (--m2[v] == 0)
            m2.erase(v);
        
        if (m1.size() == m2.size())
            result++;
    }
    
    return result;
}