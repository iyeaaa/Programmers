#include <bits/stdc++.h>
#define all(x) (x).begin(), (x).end()
using namespace std;

vector<tuple<int, int, string>> candidate;

string solution(string m, vector<string> musicinfos) {
    for (int i=m.size()-1; i>=0; i--)
        if (m[i] == '#') {
            m[i-1] += 'a' - 'A';
            m.erase(i+m.begin());
        }
    
    for (int i=0; i<musicinfos.size(); i++) {
        string music = musicinfos[i];
        int time = 0;
        int n = 0;
        string title, melody;
        vector<string> vm;
        
        time -= stoi(music.substr(0,2)) * 60 + stoi(music.substr(3,2));
        time += stoi(music.substr(6,2)) * 60 + stoi(music.substr(9,2));;
        
        int comma = music.find(',', 13);
        title = music.substr(12, comma-12);
        melody = music.substr(comma+1);
        
        for (int i=melody.size()-1; i>=0; i--)
            if (melody[i] == '#') {
                melody[i-1] += 'a' - 'A';
                melody.erase(i+melody.begin());
            }
        
        if (time < melody.size()) melody = melody.substr(0, time);
        while (melody.size() < time) melody += melody;
        
        if (melody.find(m) != string::npos)
            candidate.push_back({-time, i, title});
        
        cout << melody << '\n';
    }
    
    return candidate.empty() ? "(None)" : get<2>(*min_element(all(candidate)));
}