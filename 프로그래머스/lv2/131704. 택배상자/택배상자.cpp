#include <string>
#include <vector>
using namespace std;

int n;
int box = 1;
int result;
vector<int> assist;

int solution(vector<int> order) {
    n = order.size();
    
    for (int v: order) {
        while (box < v)
            assist.push_back(box++);
    
        if (box > v) {
            if (assist.empty() || assist.back() != v)
                break;
            result++;
            assist.pop_back();
        } else {
            result++;
            box++;
        }
    }
    
    return result;
}