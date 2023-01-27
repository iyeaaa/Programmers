#include <string>
#include <vector>
using namespace std;

int today;
int term[26];
vector<int> ans;

vector<int> solution(string todays, vector<string> terms, vector<string> privacies) {

    // change to Day
    today = stoi(todays.substr(0, 4))*12*28 + stoi(todays.substr(5,2))*28 + stoi(todays.substr(8));

    // make Term
    for (string s: terms)
        term[s.front()-'A'] = stoi(s.substr(2))*28;

    // change to day and add term
    for (int i=1; i<= privacies.size(); i++) {
        string s = privacies[i-1];

        int day = 0;
        day += term[s.back()-'A'];
        day += stoi(s.substr(0, 4)) * 12 * 28;
        day += stoi(s.substr(5, 2)) * 28;
        day += stoi(s.substr(8, 2));

        if (day <= today)
            ans.push_back(i);
    }

    return ans;
}

