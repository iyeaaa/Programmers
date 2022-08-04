/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.04
* by Alub
*/
#include <iostream>
#include <vector>

using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    string strn; cin >> strn;
    vector<char> stack;
    string result = "";

    for(auto s: strn) {
        switch (s) {
            case '(':
                stack.push_back(s);
                break;
            case ')':
                while(stack.back() != '(') {
                    result += stack.back();
                    stack.pop_back();
                }
                stack.pop_back();
                break;
            case '*':
            case '/':
                while(!stack.empty() && (stack.back() == '*' || stack.back() == '/')) {
                    result += stack.back();
                    stack.pop_back();
                }
                stack.push_back(s);
                break;
            case '+':
            case '-':
                while(!stack.empty() && stack.back() != '(') {
                    result += stack.back();
                    stack.pop_back();
                }
                stack.push_back(s);
                break;
            default:
                result += s;
                break;
        }
    }
    while(!stack.empty()) {
        result += stack.back();
        stack.pop_back();
    }
    cout << result;
}