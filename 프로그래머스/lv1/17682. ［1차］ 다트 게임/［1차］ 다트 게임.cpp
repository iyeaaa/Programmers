#include <bits/stdc++.h>
using namespace std;

vector<int> v;
int ans;

int solution(string dartResult) {
    int score = 0;
    for (int i=0; i<dartResult.size(); i++) {
        char c = dartResult[i];
        if (isdigit(c)) {
            v.push_back(score);
            score = c & 15;
            if (isdigit(dartResult[i+1]))
                score = 10, i++;
        }
        else if (isalpha(c)) {
            if (c == 'D') score *= score;
            else if (c == 'T') score = score * score * score;
        } else {
            if (c == '*') v.back() *= 2, score *= 2;
            else score *= -1;
        }
    }
    for (int v:v) ans+=v;
    ans += score;
    return ans;
}

int main() {
    
}