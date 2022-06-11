#include <bits/stdc++.h>
using namespace std;

int N, M;

void TwoPointer(vector<int> &A, vector<int> &B)
{
    sort(A.begin(), A.end());
    sort(B.begin(), B.end());

    int ptrA = 0;
    int ptrB = 0;

    vector<int> answer(N + M);
    int idx = 0;
    while (ptrA < N && ptrB < M)
    {
        if (A[ptrA] < B[ptrB])
        {
            answer[idx++] = A[ptrA];
            ptrA++;
        }
        else
        {
            answer[idx++] = B[ptrB];
            ptrB++;
        }
    }

    while (ptrA < N)
        answer[idx++] = A[ptrA++];
    while (ptrB < M)
        answer[idx++] = B[ptrB++];

    for (int i : answer)
        cout << i << ' ';
}

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    cin >> N >> M;

    vector<int> A(N);
    for (int i = 0; i < N; i++)
        cin >> A[i];

    vector<int> B(M);
    for (int i = 0; i < M; i++)
        cin >> B[i];

    TwoPointer(A, B);
}