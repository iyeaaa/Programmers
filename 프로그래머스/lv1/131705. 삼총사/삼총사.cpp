#include <string>
#include <vector>
using namespace std;

vector<int> s;
int result;

bool isZero() {
    return s[0] + s[1] + s[2] == 0;
}

void C(int cnt, int idx, const vector<int>& number) {
    if (cnt == 3) {
        if (isZero())
            result++;
        return;
    }
    
    for (int i=idx; i<number.size(); i++) {
        s.push_back(number[i]);
        C(cnt+1, i+1, number);
        s.pop_back();
    }
}

int solution(vector<int> number) {
    C(0, 0, number);
    return result;
}