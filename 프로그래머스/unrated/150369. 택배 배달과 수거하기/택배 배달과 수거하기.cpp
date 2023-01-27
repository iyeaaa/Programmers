#include <string>
#include <vector>
#include <algorithm>
using namespace std;
typedef long long ll;

// tp: 이미 수거한 상자 수
// td: 이미 배달한 상자 수
ll tp, td;
ll ans;

ll solution(int cap, int N, vector<int> pick, vector<int> dlv) {
    for (int i=N-1; i>=0; i--) {
        
        int cnt = 0;                   // 걸음 수
        int& p = pick[i]; p -= tp;     // 수거해야하는 상자 수
        int& d = dlv[i];  d -= td; // 배달해야하는 상자 수
        
        tp = td = 0;
        
        // 배송, 수거 시작
        while (p > 0 || d > 0) {
            p -= cap;
            d -= cap;
            cnt += (i+1)*2;
        }
        
        // 배달, 수거한 다른 집 저장
        tp -= p, td -= d;
        
        // 걸음걸이 더해주기
        ans += cnt;
    }
    
    return ans;
}