import java.util.*;

class Solution {
    ArrayList<int[]> save = new ArrayList<>();
    
    public int[][] solution(int n) {
        hanoi(n, 1, 3, 2);
        
        int[][] ans = new int[save.size()][2];
        for(int i = 0 ; i < save.size() ; ++i){
            ans[i][0] = save.get(i)[0];
            ans[i][1] = save.get(i)[1];  
        }
        
        return ans;
    }
    
    void hanoi(int n, int lo, int hi, int mid){  
        int[] move = {lo, hi};
        
        if(n == 1) {
            save.add(move);
            return;
        }
        hanoi(n - 1, lo, mid, hi);
        save.add(move);
        hanoi(n - 1, mid, hi, lo);
    }
}