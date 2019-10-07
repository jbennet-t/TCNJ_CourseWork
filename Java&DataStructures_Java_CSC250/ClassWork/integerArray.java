import java.util.Scanner;
public class integerArray
{
	public static void main(String[] args)
	{
		int userInput[];
		userInput = new int[10];
		
		
		Scanner sc = new Scanner(System.in);
		
		for(int i = 0; i <= 9; i++)
		{
			System.out.println("Enter a number:");
			userInput[i] = sc.nextInt();
		
		}
		
		int min = Integer.MAX_VALUE;
		int max = Integer.MIN_VALUE;
		for (int i = 0; i < userInput.length; i++)
		{
			if(userInput[i] > max)
			{
				max = userInput[i];
			}
			
			if(userInput[i] < min)
			{
				min = userInput[i];
			}
		}
		
		
		System.out.println("Highest value of that array:" + max + " Lowest value of that array:" + min);
	}
}
