#include <string>
#include <vector>
#include <algorithm>

using namespace std;

vector<int> solution(vector<int> numbers) {
    vector<int> stk, ans;
    reverse(numbers.begin(), numbers.end());
    
    for (auto v: numbers) {
        while (!stk.empty() && stk.back() <= v)
            stk.pop_back();
        ans.push_back(stk.empty() ? -1 : stk.back());
        stk.push_back(v);
    }
    
    reverse(ans.begin(), ans.end());
    
    return ans;
    
}