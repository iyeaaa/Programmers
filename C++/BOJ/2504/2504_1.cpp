/**
* 메모리: 2024 KB, 시간: 0 ms
* 2022.08.03
* by Alub
*/
#include <iostream>
#include <vector>

using namespace std;

int main() {
    string bracket;
    int sum = 0, count = 1;
    vector<int> stack;

    cin >> bracket;

    for(int i = 0; i < bracket.size(); i++) {
        switch (bracket[i]) {
            case '(':
                count *= 2;
                stack.push_back('(');
                break;
            case '[':
                count *= 3;
                stack.push_back('[');
                break;
            case ')':
                if(stack.empty() || stack.back() != '(') {
                    sum = 0; goto outer;
                }
                if(bracket[i-1] == '(') {
                    sum += count;
                }
                stack.pop_back();
                count /= 2;
                break;
            case ']':
                if(stack.empty() || stack.back() != '[') {
                    sum = 0; goto outer;
                }
                if(bracket[i-1] == '[') {
                    sum += count;
                }
                stack.pop_back();
                count /= 3;
                break;
            default:
                break;
        }
    }

    outer:
    cout << (stack.empty() ? sum : 0);
}