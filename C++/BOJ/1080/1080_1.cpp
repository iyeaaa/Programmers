/**
* 메모리: 2044 KB, 시간: 0 ms
* 2022.08.15
* by Alub
*/
#include <iostream>
#include <vector>

using namespace std;

int N, M;
int A[51][51];
int B[51][51];

bool isEquals() {
    for(int i = 0; i < N; i++)
        for(int j = 0; j < M; j++)
            if(A[i][j] != B[i][j])
                return false;
    return true;
}

void change(int y, int x) {
    for(int i = y; i < y+3; i++)
        for(int j = x; j < x+3; j++)
            A[i][j] = 1 - A[i][j];
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);

    cin >> N >> M;

    for(int i = 0; i < N; i++) {
        string x; cin >> x;
        for(int j = 0; j < M; j++)
            A[i][j] = x[j]-'0';
    }

    for(int i = 0; i < N; i++) {
        string x; cin >> x;
        for(int j = 0; j < M; j++)
            B[i][j] = x[j]-'0';
    }

    int count = 0;

    if (isEquals()) {
        cout << count;
        return 0;
    }

    for(int i = 0; i <= N-3; i++)
        for(int j = 0; j <= M-3; j++)
            if(A[i][j] != B[i][j]) {
                change(i, j);
                count++;
                if (isEquals()) {
                    cout << count;
                    return 0;
                }
            }

    cout << -1;
    return 0;
}