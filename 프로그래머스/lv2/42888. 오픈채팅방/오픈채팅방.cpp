#include <string>
#include <vector>
#include <iostream>
#include <unordered_map>
#include <sstream>
using namespace std;

unordered_map<string, string> info;
vector<string> ans;

vector<string> solution(vector<string> record) {
    for (const string& r: record) {
        istringstream iss(r);
        string command, id, nickname;
        
        iss >> command >> id >> nickname;
        
        if (command == "Enter") {
            info[id] = nickname;
        }
        else if (command == "Change") {
            info[id] = nickname;
        }
    }
    
    for (const string& r: record) {
        istringstream iss(r);
        string command, id, nickname;
        
        iss >> command >> id >> nickname;
        
        if (command == "Enter")
            ans.push_back(info[id] + "님이 들어왔습니다.");
        else if (command == "Leave")
            ans.push_back(info[id] + "님이 나갔습니다.");
    }
    
    return ans;
}