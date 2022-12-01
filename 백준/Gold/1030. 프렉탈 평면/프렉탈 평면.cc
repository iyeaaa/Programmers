#include <iostream>

using namespace std;

int s, n, k, r1, r2, c1, c2;
bool board[50][50];
long long cnt;

void fractal(int sx, int sy, int cur_n) {
	//cur_n이 1이거나 출력 범위에 아예 포함되지 않을 시 리턴
	if (cur_n <= 1 || sx > c2 || sy > r2 || sx + cur_n - 1 < c1 || sy + cur_n - 1 < r1) 
    		return;

	int next_n = cur_n / n;
	int offset = (cur_n - next_n * k) / 2;

	//1로 마킹될 영역
	int kx_min = sx + offset, kx_max = sx + cur_n - offset;
	int ky_min = sy + offset, ky_max = sy + cur_n - offset;

	//1로 마킹될 영역 마킹
	for (int y = ky_min < r1 ? r1 : ky_min; y < ky_max; y++) {
		if (y - r1 > r2 - r1) break;
		for (int x = kx_min < c1 ? c1 : kx_min; x < kx_max; x++) {
			if (x - c1 > c2 - c1) break;
			board[y - r1][x - c1] = 1;
		}
	}

	//영역별 재귀호출
	for (int y = sy; y < sy + cur_n; y += next_n) {
		for (int x = sx; x < sx + cur_n; x += next_n) {
			if (y >= ky_min && y < ky_max && x >= kx_min && x < kx_max)
				continue;
			fractal(x, y, next_n);
		}
	}
}

void solution() {
	int max_n = 1;
	cin >> s >> n >> k >> r1 >> r2 >> c1 >> c2;

	for (int i = 0; i < s; i++) max_n *= n;
	fractal(0, 0, max_n);

	for (int y = 0; y <= r2 - r1; y++) {
		for (int x = 0; x <= c2 - c1; x++) {
			cout << board[y][x];
		}
		cout << '\n';
	}
}

int main() {
	ios::sync_with_stdio(0), cin.tie(0), cout.tie(0);
	solution();

	return 0;
}