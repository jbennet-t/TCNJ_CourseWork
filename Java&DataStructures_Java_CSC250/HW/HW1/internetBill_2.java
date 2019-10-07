//program to calculate internet and phone usage bill
//Bill_2 uses function or method
import java.util.Scanner;
public class internetBill_2
{
	public static void main(String[] args)
	{
		double totalBill;
		double totalusage;
		double perMbAndMinCost = 1;
		
		
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter your data usage in mb on a weekday: ");
		double mbWeekDay = sc.nextDouble();
		System.out.println("Enter your data usage in mb on a weekend day: ");
		double mbWeekendDay = sc.nextDouble();
		System.out.println("Enter your minute usage in minutes on a weekday: ");
		double phoneMinWeekDay = sc.nextDouble();
		System.out.println("Enter your minute usage in minutes on a weekend day:");
		double phoneMinWeekendDay = sc.nextDouble();
		System.out.println("Enter number of weeks in pay period:");
		double numberWeeks = sc.nextDouble();
		
		totalBill = numberWeeks*(((mbWeekDay*5)+(mbWeekendDay*2))+((phoneMinWeekDay*5)+(phoneMinWeekendDay*2)));
		System.out.println("The total cost is: $"+totalBill);
	}
}
