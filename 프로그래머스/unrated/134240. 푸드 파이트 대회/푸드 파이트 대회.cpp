#include <string>
#include <vector>
#include <algorithm>
using namespace std;

string s1, s2;

string solution(vector<int> food) {
    for (int i=1; i<food.size(); i++) {
        int cnt = food[i]/2;
        for (int j=0; j<cnt; j++)
            s1 += i + '0';
    }
    s2 = s1;
    reverse(s2.begin(), s2.end());
    return s1 + '0' + s2;
}