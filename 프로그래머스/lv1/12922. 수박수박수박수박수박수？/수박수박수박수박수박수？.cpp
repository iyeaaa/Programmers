#include <string>
#include <vector>

using namespace std;

string solution(int n) {
    string ans = "";
    for (int i=0; i<n; i++)
        ans += i&1 ? "박" : "수";
    return ans;
}