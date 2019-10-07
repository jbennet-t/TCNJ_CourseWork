
//program to calculate internet and phone usage bill
//Bill_1 uses static values to calculate
public class internetBill_1
{
	public static void main(String[] args)
	{
		double totalBill;
		double perMbAndMinCost = 1;
		double totalusage;
		double mbWeekDay = 500;
		double mbWeekendDay = 1000;
		double phoneMinWeekDay = 100;
		double phoneMinWeekendDay = 200;
		double numberWeeks = 4;
		
		totalBill = numberWeeks*(((mbWeekDay*5)+(mbWeekendDay*2))+((phoneMinWeekDay*5)+(phoneMinWeekendDay*2)));
		System.out.println("The total cost is: $"+totalBill);
	}
}
		