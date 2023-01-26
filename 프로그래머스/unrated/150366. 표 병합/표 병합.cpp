#include <string>
#include <vector>
#include <sstream>
#include <iostream>
#define f first
#define s second
using namespace std;
typedef pair<int, int> pii;

struct Disjoint_set {
    public:
    pii parent[51][51];

    Disjoint_set() {
        for (int i=1; i<=50; i++)
            for (int j=1; j<=50; j++)
                parent[i][j] = {i, j};
    }
    
    pii root(pii x) {
        if (parent[x.f][x.s] == x) return x;
        return parent[x.f][x.s] = root(parent[x.f][x.s]);
    }
    
    void uni(pii tx, pii ty) {
        pii x = root(tx), y = root(ty);
        if (x == y) return;
        parent[y.f][y.s] = x;
    }
    
    bool isUni(pii x, pii y) {
        return root(x) == root(y);
    }
};

string table[51][51];
vector<string> ans;
Disjoint_set uf = Disjoint_set();

vector<string> split(string s, char c) {
    vector<string> rtn;
    stringstream ss(s);
    string buffer;
    
    while (getline(ss, buffer, c))
        rtn.push_back(buffer);
    
    return rtn;
}

vector<string> solution(vector<string> commands) { 
    for (auto s: commands) {
        vector<string> v = split(s, ' ');
        if (v[0] == "UPDATE" && v.size() == 4) {
            string value = v[3];
            auto [r, c] = uf.root({stoi(v[1]), stoi(v[2])});
            table[r][c] = value;
        } else if (v[0] == "UPDATE" && v.size() == 3) {
            string value1 = v[1], value2 = v[2];
            for (int i=1; i<=50; i++) {
                for (int j=1; j<=50; j++) {
                    auto [r, c] = uf.root({i, j});
                    if (table[r][c] == value1)
                        table[r][c] = value2;
                }
            }
        } else if (v[0] == "MERGE") {
            int r1 = stoi(v[1]), c1 = stoi(v[2]), r2 = stoi(v[3]), c2 = stoi(v[4]);
            uf.uni({r1, c1}, {r2, c2});
        } else if (v[0] == "UNMERGE") {
            int v1 = stoi(v[1]), v2 = stoi(v[2]);
            auto [r, c] = uf.root({v1, v2});
            string temp = table[r][c];
            vector<pii> merged;
            
            for (int i=1; i<=50; i++)
                for (int j=1; j<=50; j++) 
                    if (uf.isUni({r, c}, {i, j}))
                        merged.push_back({i, j});

            for (auto [f, s]: merged) {
                table[f][s] = "";
                uf.parent[f][s] = {f, s};
            }

            table[v1][v2] = temp;
        } else {
            auto [r, c] = uf.root({stoi(v[1]), stoi(v[2])});
            ans.push_back(table[r][c].empty() ? "EMPTY" : table[r][c]);
        }
    }
    
    return ans;
}