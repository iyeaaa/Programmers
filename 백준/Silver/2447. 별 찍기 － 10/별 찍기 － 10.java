import java.io.*;

public class Main {
    static char [][] arr;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        final int N = Integer.parseInt(br.readLine());
        arr = new char [N][N];

        starPrint(0, 0, N, false);

        for(int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++)
                sb.append(arr[i][j]);
            sb.append('\n');
        }

        System.out.println(sb);
    } // main

    static void starPrint(int x, int y, final int N, boolean blank) {
        // Base Case 1, 공백 구간
        if(blank) {
            for (int i = x; i < x+N; i++)
                for (int j = y; j < y+N; j++)
                    arr[i][j] = ' ';
            return;
        }

        // Base Case 2, 별 구간
        if(N == 1) {
            arr[x][y] = '*';
            return;
        }

        // Recusion Case
        int size = N / 3;
        int count = 0;
        for(int i = x; i < x+N; i+=size)
            for(int j = y; j < y+N; j+=size)
                starPrint(i, j, size, (++count) == 5);
    }
}