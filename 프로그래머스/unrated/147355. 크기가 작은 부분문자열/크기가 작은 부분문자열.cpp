#include <string>
#include <vector>
using namespace std;
int ans;

int solution(string t, string p) {
    for (int i=0; i<=t.size()-p.size(); i++)
        if (t.substr(i, p.size()) <= p)
            ans++;
    return ans;
}