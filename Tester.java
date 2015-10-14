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

	public static int[] SpecificCycle(int size){
		int[] a = new int[size];

		for (int i = 0; i < size-1; i ++){
			a[i] = i+1;
		}
		a[size-1] = 0;

		return a;
	}

	public static void part3specificCycle(int size, int steps) {
		int[] a = SpecificCycle(size);
		followCylcle(a, steps);
	}

	public static void part3sattoloCycle(int size, int steps){
		int[] a = SpecificCycle(size);
		for (int i = 0; i < a.length; i ++){
			a[i]--;
		}

	}

	public static void followCylcle(int[] a, int steps){
		int index = 0;
		while (true && steps != 0){
			index = a[index];
			if (index == 0)
				break;
			steps--;
		}
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
 		else if (args[0].equals("part3specific")){
 			int size = Integer.parseInt(args[1]);
 			int steps = Integer.parseInt(args[2]);
 			int[] a = SpecificCycle(size);

 			long before = System.currentTimeMillis();
			followCylcle(a,steps);
			long after = System.currentTimeMillis();

			System.out.printf("%d",(after-before));
 		}
 		else if (args[0].equals("part3sattolo")){
			int size = Integer.parseInt(args[1]);
 			int steps = Integer.parseInt(args[2]);
 			int[] a = SpecificCycle(size);
			
			//reset to a[0] = 0
			for (int i = 0; i < a.length-1; i ++){
				a[i]--;
			}
			a[a.length-1] = a.length-1;

			Sattolo.cycle(a, rnd);

 			long before = System.currentTimeMillis();
			followCylcle(a,steps);
			long after = System.currentTimeMillis();

			System.out.printf("%d",(after-before));
 		}
    }

}