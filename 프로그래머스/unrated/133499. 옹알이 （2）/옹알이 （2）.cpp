#include <string>
#include <vector>
#include <unordered_set>
using namespace std;

int result;
unordered_set<string> st;

int solution(vector<string> babbling) {
    st.insert("aya");
    st.insert("ye");
    st.insert("woo");
    st.insert("ma");
    
    for (string& s: babbling) {
        string last = "";
        while (s.size() > 1) {
            string t1 = s.substr(0, 2);
            string t2 = s.substr(0, 3);
            
            if (t1 != last && st.find(t1) != st.end()) {
                s.erase(0, 2);
                last = t1;
            } else if (t2 != last && st.find(t2) != st.end()) {
                s.erase(0, 3);
                last = t2;
            } else {
                break;
            }
        }
        if (s.size() == 0)
            result++;
    }
    return result;
}