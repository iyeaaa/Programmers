#include <string>
#include <vector>
using namespace std;

bool isContain[26];

void to(char& c, int idx) {
    while (idx) {
        if (c+1 > 'z') c = 'a';
        else c++;

        if (!isContain[c-'a'])
            idx--;
    }
}

string solution(string s, string skip, int index) {
    for (char c: skip)
        isContain[c-'a'] = true;

    for (char& i : s)
        to(i, index);

    return s;
}