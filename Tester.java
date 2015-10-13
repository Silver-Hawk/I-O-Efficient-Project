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

	public static Integer[] RandomIntegerArray(int size, Random r){
		Integer[] a = new Integer[size];

		for (int i = 0; i < size; i++){
			a[i] = new Integer(r.nextInt());
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
		long [][] resultHolderQuick = new long[20][5];
		long [][] resultHolderHeap = new long[20][5];
		
		System.out.println("Part1 running:");
		System.out.println("QUICKSORT ON INTS:");
		int i = 1000;
		int lasti = 0;
		int index = 0;
		while(lasti < 500000000) {
			for(int j = 0; j < 5; j++){
				int[] a = RandomIntArray(i, rnd);

				long before = System.currentTimeMillis();
				QuickOnInts.sort(a);
				long after = System.currentTimeMillis();

				System.out.printf("%f sec on size %d\n", (after-before)/1000.0f, i);
				TestCorrectOutput(a);

				resultHolderQuick[index][j] =  after-before; 
			}

			lasti = i;
			i *= 1.7;
			index ++;
		}

		System.out.println("HEAPSORT ON INTS:");
		i = 1000;
		lasti = 0;
		index = 0;
		while(lasti < 500000000) {
			for(int j = 0; j < 5; j++){
				int[] a = RandomIntArray(i, rnd);

				long before = System.currentTimeMillis();
				HeapOnInts.sort(a);
				long after = System.currentTimeMillis();

				System.out.printf("%f sec on size %d\n", (after-before)/1000.0f, i);
				TestCorrectOutput(a);
			
				resultHolderHeap[index][j] =  after-before; 
			}

			lasti = i;
			i *= 1.7;
			index ++;
		}

		System.out.println("R - OUTPUT QUICK");
		System.out.print("a = c(");
		i = 1000;
		lasti = 0;
		index = 0;
		/*while(lasti < 500000000) {

			//HeapOnInts.sort(resultHolderQuick[index]);

			System.out.print("%f,",(resultHolderQuick[1]+resultHolderQuick[2]+resultHolderQuick[3])/3);

			lasti = i;
			i *= 1.7;
			index ++; 
		}*/
		System.out.print(")");
	}

    public static void main(String[] args) {
        if(args.length < 2){
        	System.out.println("Program should be called with java -Xmx4g FUNCTION PROBLEM_SIZE\nFx. java -Xmx4g quicksortints 1000");
        	System.exit(0);
        }
        //create random generator
        Random rnd = new Random();
 		rnd.setSeed(1337);

 		if (args[0].equals("quicksortints")){
			int[] a = RandomIntArray((int) Integer.parseInt(args[1]), rnd);

			long before = System.currentTimeMillis();
			QuickOnInts.sort(a);
			long after = System.currentTimeMillis();

			System.out.printf("%d",(after-before));
 		}
 		else if(args[0].equals("heapsortints")){
 			int[] a = RandomIntArray((int) Integer.parseInt(args[1]), rnd);

			long before = System.currentTimeMillis();
			HeapOnInts.sort(a);
			long after = System.currentTimeMillis();

			System.out.printf("%d",(after-before));
 		}
 		else if (args[0].equals("quicksortintegers")){
			Integer[] a = RandomIntegerArray((int) Integer.parseInt(args[1]), rnd);

			long before = System.currentTimeMillis();
			QuickOnIntegers.sort(a);
			long after = System.currentTimeMillis();

			System.out.printf("%d",(after-before));
 		}
 		else if (args[0].equals("heapsortintegers")){
			Integer[] a = RandomIntegerArray((int) Integer.parseInt(args[1]), rnd);

			long before = System.currentTimeMillis();
			HeapOnIntegers.sort(a);
			long after = System.currentTimeMillis();

			System.out.printf("%d",(after-before));
 		}
    }

}