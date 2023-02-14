#include <string>
#include <vector>
using namespace std;

vector<int> solution(int num, int total) {
    for (int i=-100; i<=total; i++) {
        int sum = 0;
        vector<int> list;
        for (int j=i; j<num+i; j++)
            sum += j, list.push_back(j);
        if (sum == total)
            return list;
    }
}