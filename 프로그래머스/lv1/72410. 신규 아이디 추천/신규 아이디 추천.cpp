#include <string>
#include <vector>
using namespace std;


string solution(string new_id) {
    for (char& c: new_id)
        if (c >= 'A' && c <= 'Z')
            c += 'a'-'A';
    
    for (int i=new_id.size()-1; i>=0; i--) {
        char c = new_id[i];
        if (c >= 'a' && c <= 'z') continue;
        if (c >= '0' && c <= '9') continue;
        if (c == '-' || c == '_' || c == '.') continue;
        new_id.erase(new_id.begin() + i);
    }
    
    for (int i=new_id.size()-2; i>=0; i--)
        if (new_id.substr(i, 2) == "..")
            new_id.replace(i, 2, ".");
    
    while (!new_id.empty() && new_id.front() == '.')
        new_id.erase(new_id.begin());
    
    while (!new_id.empty() && new_id.back() == '.')
        new_id.pop_back();
    
    if (new_id.empty())
        new_id = "a";
    
    while (new_id.size() >= 16)
        new_id.pop_back();
    
    while (!new_id.empty() && new_id.back() == '.')
        new_id.pop_back();
    
    while (new_id.size() <= 2)
        new_id += new_id.back();
    
    return new_id;
}