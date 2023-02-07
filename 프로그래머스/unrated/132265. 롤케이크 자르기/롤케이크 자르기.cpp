#include <string>
#include <vector>
#include <unordered_set>
using namespace std;

int cnt[10001];
unordered_set<int> chulsoo;
int brother;
int result;

int solution(vector<int> topping) {
    for (auto& v: topping)
        if (cnt[v]++ == 0)
            brother++;
    
    for (auto& v: topping) {
        chulsoo.insert(v);
        if (--cnt[v] == 0)
            brother--;
        
        if (brother == chulsoo.size())
            result++;
    }
    
    return result;
}