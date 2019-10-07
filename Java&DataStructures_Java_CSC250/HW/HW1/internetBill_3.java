//program to calculate internet and phone usage bill
//Bill_3 uses for loop to calculate
public class internetBill_3
{
	public static void main(String[] args)
	{
		double totalBill = 0;
		double perMbAndMinCost = 1;
		double totalusage;
		double mbWeekDay = 500;
		double mbWeekendDay = 1000;
		double phoneMinWeekDay = 100;
		double phoneMinWeekendDay = 200;
		double numberWeeks = 4;
		
		
		for(int i=1;i<=28;i++)
		{
			if(i <= 20)
			{
				totalBill = totalBill + mbWeekDay + phoneMinWeekDay;
			}
			
			else
			{
				totalBill = totalBill + mbWeekendDay + phoneMinWeekendDay;
			}
		}
		
		System.out.println("The total cost is: $" + totalBill);
	}
}