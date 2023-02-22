#include <string>
#include <vector>
using namespace std;

vector<int> solution(vector<int> lottos, vector<int> win_nums) {
    int common = 0;
    int zeroCnt = 0;
    
    for (int i=0; i<6; i++)
        for (int j=0; j<6; j++)
            common += lottos[i] == win_nums[j];
    
    for (int v: lottos)
        zeroCnt += v == 0;
    
    int mx = common+zeroCnt < 2 ? 6 : 7-common-zeroCnt;
    int mn = common < 2 ? 6 : 7-common;
    
    return {mx, mn};
}