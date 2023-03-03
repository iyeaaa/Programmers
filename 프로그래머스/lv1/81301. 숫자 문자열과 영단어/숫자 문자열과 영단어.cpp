#include <string>
#include <vector>
using namespace std;

int ans;
vector<string> info = {"zero", "one", "two", "three", "four",
                 "five", "six", "seven", "eight", "nine"};

int solution(string s) {
    for (int i=0; i<s.size(); i++) {
        if (isdigit(s[i])) { 
            ans = ans*10 + (s[i]&15);
            continue;
        }
        for (int j=0; j<10; j++) {
            if (s.substr(i, info[j].size()) == info[j]) {
                ans = ans*10 + (j&15);
                i += info[j].size() - 1;
                break;
            }
        }
    }
    return ans;
}