#include <string>
#include <vector>
using namespace std;

string strarr[] = {"aya", "ye", "woo", "ma"};
int result;

int solution(vector<string> babbling) {
    for (string& s: strarr) {
        for (string& b: babbling) {
            int idx = b.find(s);
            if (idx != string::npos)
                b.replace(idx, s.size(), "-");
        }
    }
    for (string& b: babbling) {
        int cnt = true;
        for (char c: b) {
            if (c != '-') {
                cnt = false;
                break;
            }
        }
        if (cnt)
            result++;
    }
    return result;
}