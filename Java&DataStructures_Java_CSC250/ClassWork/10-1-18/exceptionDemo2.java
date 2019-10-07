public class exceptionDemo2
{
	public static void main(String args[])
	{
		//"try" code that could cause a problem
		try
		{
			int a = 0;
			int b = 5;
			int d[] = new int[a-2];
		}
		
		//"catches" the issue
			
		catch(NegativeArraySizeException y)
		{
			System.out.println("Negative array size.");
		}
		
		//finally block runs regardless of whether error occurs
		finally
		{
			System.out.println("This always prints out");
		}
	}
}