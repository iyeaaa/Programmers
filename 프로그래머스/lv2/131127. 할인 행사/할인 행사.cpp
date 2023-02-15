#include <string>
#include <vector>
#include <unordered_map>
using namespace std;

unordered_map<string, int> c;

bool isPossible() {
    for (auto& [k, v]: c)
        if (v > 0)
            return false;
    return true;
}

int solution(vector<string> want, vector<int> number, vector<string> discount) {
    int n = want.size();
    int result = 0;
    
    for (int i=0; i<n; i++)
        c[want[i]] = number[i];
    
    for (int i=0; i<10; i++)
        c[discount[i]]--;
    
    result += isPossible();
    
    for (int i=10; i<discount.size(); i++) {
        c[discount[i]]--;
        c[discount[i-10]]++;
        result += isPossible();
    }
    
    return result;
}