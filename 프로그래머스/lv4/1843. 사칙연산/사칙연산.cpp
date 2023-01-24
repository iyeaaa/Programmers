#include <vector>
#include <string>
using namespace std;

int n, mndp[202][202], mxdp[202][202];

int solution(vector<string> arr) {
    n = arr.size();
    fill(&mndp[0][0], &mndp[201][202], 99999999);
    fill(&mxdp[0][0], &mxdp[201][202], -99999999);
    
    for (int i=0; i<n; i+=2)
        mndp[i][i] = mxdp[i][i] = stoi(arr[i]);
    
    for (int len=3; len<=n; len+=2) {
        for (int hi=len-1; hi<n; hi+=2) {
            int lo = hi-len+1;
            for (int mid=lo+1; mid<hi; mid+=2) {
                if (arr[mid] == "+") {
                    mxdp[lo][hi] = max(mxdp[lo][hi], mxdp[lo][mid-1] + mxdp[mid+1][hi]);
                    mndp[lo][hi] = min(mndp[lo][hi], mndp[lo][mid-1] + mndp[mid+1][hi]);
                } else {
                    mxdp[lo][hi] = max(mxdp[lo][hi], mxdp[lo][mid-1] - mndp[mid+1][hi]);
                    mndp[lo][hi] = min(mndp[lo][hi], mndp[lo][mid-1] - mxdp[mid+1][hi]);
                }
            }
        }
    }
    
    return mxdp[0][n-1];
}