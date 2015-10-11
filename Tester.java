/**
* Used to test different parts of the project
*/
import java.util.Random;

public class Tester {
	public static boolean TestCorrectOutput(int[] a){
		for(int i = 0; i < a.length; i++)
			if (i > 0 && a[i] < a[i-1]){
				System.out.println("a[" + i + "] " + a[i] + " is supposed to be larger than a[" + (i-1) + "] " + a[i-1]);
				return false;
			}
		return true;
	}

	public static int[] RandomIntArray(int size, Random r){
		int[] a = new int[size];

		for (int i = 0; i < size; i++){
			a[i] = r.nextInt();
		}

		return a;
	}

	public static void smallTest(Random rnd){
		int[] a = RandomIntArray(10, rnd);
        int[] b = RandomIntArray(10, rnd);

        QuickOnInts.sort(a);
        HeapOnInts.sort(b);

        QuickOnInts.show(a);
        QuickOnInts.show(b);

        TestCorrectOutput(a);
        TestCorrectOutput(b);
	}

	public static void part1(Random rnd){
		System.out.println("Part1 running:");
		

		System.out.println("QUICKSORT ON INTS:");
		int lasti = 0;
		int i = 1000;
		while(lasti < 500000000) {
			int[] a = RandomIntArray(i, rnd);

			long before = System.currentTimeMillis();
			QuickOnInts.sort(a);
			long after = System.currentTimeMillis();

			System.out.printf("%f sec on size %d\n", (after-before)/1000.0f, i);
			TestCorrectOutput(a);
			lasti = i;
			i *= 1.7;
		}

		System.out.println("HEAPSORT ON INTS:");
		lasti = 0;
		i = 1000;
		while(lasti < 500000000) {
			int[] a = RandomIntArray(i, rnd);

			long before = System.currentTimeMillis();
			HeapOnInts.sort(a);
			long after = System.currentTimeMillis();

			System.out.printf("%f sec on size %d\n", (after-before)/1000.0f, i);
			TestCorrectOutput(a);
			lasti = i;
			i *= 1.7;
		}
	}

    public static void main(String[] args) {
        //create random generator
        Random rnd = new Random();
 		rnd.setSeed(1337);

		//part1
 		part1(rnd);

    }

}