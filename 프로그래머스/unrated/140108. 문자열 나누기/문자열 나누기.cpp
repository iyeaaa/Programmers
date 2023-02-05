#include <string>
#include <vector>
using namespace std;

int ans = 0;

int solution(string s) {
    int first = s[0], same = 1, diff = 0;
    bool sepa = true;
    
    for (int i=0; i<s.size(); i++) {
        if (sepa) {
            first = s[i], same = 1; diff = 0;
            sepa = false;
            continue;
        }
        
        if (first == s[i]) same++;
        else diff++;
        
        if (same == diff)
            ans++, sepa = true;
    } 
    
    if (same != diff) ans++;
    
    return ans;
}