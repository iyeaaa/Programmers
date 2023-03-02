#include <bits/stdc++.h>
#define all(x) (x).begin(), (x).end()
using namespace std;

vector<tuple<string, int, int>> files;
vector<string> ans;

vector<string> solution(vector<string> f) {
    for (int i=0; i<f.size(); i++) {
        string file = f[i];
        
        for (char& c: file) if (isalpha(c)) c &= 31;
        
        string head, tail;
        int number;
        
        int pos = 0;
        while (pos < file.size() && !isdigit(file[pos]))
            pos++;
        
        head = file.substr(0, pos);
        
        int nxtpos = pos;
        while (nxtpos < file.size() && isdigit(file[nxtpos]))
            nxtpos++;
        
        number = stoi(file.substr(pos, nxtpos - pos));
        
        int dotpos = file.find('.');
        if (dotpos != string::npos)
            tail = file.substr(dotpos);
        
        files.push_back({head, number, i});
    }
    
    sort(all(files));
    
    
    for (auto [head, num, i]: files)
        ans.push_back(f[i]);
    
    return ans;
}