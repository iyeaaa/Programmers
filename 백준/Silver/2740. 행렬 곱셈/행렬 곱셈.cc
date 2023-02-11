#include <iostream>
#define FIO ios::sync_with_stdio(false), cin.tie(0), cout.tie(0);
using namespace std;

int A[101][101], B[101][101], R[101][101];
int N, M, K;

int main() {
    FIO
    
    cin >> N >> M;
    for (int i=0; i<N; i++)
        for (int j=0; j<M; j++)
            cin >> A[i][j];
    
    cin >> M >> K;
    for (int i=0; i<M; i++)
        for (int j=0; j<K; j++)
            cin >> B[i][j];
    
    for (int i=0; i<N; i++)
        for (int j=0; j<K; j++)
            for (int k=0; k<M; k++)
                R[i][j] += A[i][k] * B[k][j];
    
    for (int i=0; i<N; i++) {
        for (int j=0; j<K; j++)
            cout << R[i][j] << ' ';
        cout << '\n';
    }
}