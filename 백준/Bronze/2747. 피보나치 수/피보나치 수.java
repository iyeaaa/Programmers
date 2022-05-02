import java.io.*;



public class Main {


	


	public static void main(String [] args) throws IOException {


		


		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));


		int n = Integer.parseInt(br.readLine());


		int result = 0;


		int a = 0;


		int b = 1;


		


		for(int i = 0; i < n-1; i++) {


			result = a + b;


			a = b;


			b = result;


		}


		


		System.out.println(n == 1 ? 1 : result);


	


	}


	


}