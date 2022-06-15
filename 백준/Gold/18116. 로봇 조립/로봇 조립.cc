#include <bits/stdc++.h>
#define ll long long
using namespace std;
ll N, arr[1000005], cnt[1000005];
ll Find(ll x){
    if (x==arr[x])
        return x;
    return arr[x]=Find(arr[x]);
}
void Union(ll x, ll y){
    if (Find(x)!=Find(y)){
        cnt[Find(y)]+=cnt[Find(x)];
        cnt[Find(x)]=0;
        arr[Find(x)]=Find(y);
    }
}
int main(){
    ios::sync_with_stdio(0);
    cin.tie(0);
    cin >> N;
    for (int i=0;i<1000005;i++){
        arr[i]=i;
        cnt[i]=1;
    }
    while (N--){
        char C;
        ll a, b;
        cin >> C;
        if (C=='I'){
            cin >> a >> b;
            Union(a,b);
        }
        else{
            cin >> a;
            cout << cnt[Find(a)] << "\n";
        }
    }
    return 0;
}