#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
vector<int> adj[10001];
bool cmp(const pair<int,int> a, const pair<int,int> b){
    if(a.first == b.first)
        return a.second < b.second;
    
    return a.first > b.first;
}
void dfs(vector<int>& visit,int& cnt, int st){
    visit[st] = 1;
    cnt++;
    for(auto n : adj[st]){
        if(visit[n]==1) continue;
        dfs(visit,cnt,n);
    }
}
int main(){
    int N, M;
    cin >> N >> M;
    
    // N 10000, M  100000
    for(int i=0; i<M; i++){
        int a, b;
        cin >> a >> b;
        adj[b].push_back(a);
    }
    
    vector<pair<int,int>> answer;
    
    for(int i=1; i<=N; i++){
        int cnt = 0;
        vector<int> visit(N+1,0);
        dfs(visit,cnt, i);
        
        // {해킹할 수 있는 컴퓨터 수, 컴퓨터 번호}
        answer.push_back({cnt,i});
    }
    
    sort(answer.begin(),answer.end(),cmp);
    
    //가장 많이 해킹할 수 있는 컴퓨터 수
    int mh = (*answer.begin()).first;
    auto it = answer.begin();
    while(it!=answer.end() && (*it).first == mh)
        cout << (*it++).second << ' ';
    
    
    return 0;
}