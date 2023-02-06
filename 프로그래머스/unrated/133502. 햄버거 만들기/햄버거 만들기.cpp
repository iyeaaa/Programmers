#include <string>
#include <vector>
using namespace std;

string s;
int result;

int solution(vector<int> ingredient) {
    for (auto v: ingredient) {
        s += v + '0';
        if (s.size() < 4) continue;
        if (s.substr(s.size()-4) == "1231") {
            result++;
            for (int j=0; j<4; j++)
                s.pop_back();
        }
    }
    return result;
}