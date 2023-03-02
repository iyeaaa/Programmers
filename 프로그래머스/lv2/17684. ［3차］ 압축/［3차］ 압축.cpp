#include <bits/stdc++.h>
using namespace std;

int nxt = 27;
unordered_map<string, int> number;
vector<int> ans;

vector<int> solution(string msg) {
    string alpha;
    for (int i='A'; i<='Z'; i++)
        number[string(1, i)] = i&31;
       
    string word;
    for (int i=0; i<msg.size(); i++) {
        word += msg[i];
        if (number.find(word) == number.end()) {
            number[word] = nxt++;
            word.pop_back();
            ans.push_back(number[word]);
            word.clear();
            i--;
        }
    }
    
    if (!word.empty()) ans.push_back(number[word]);
    
    return ans;
}