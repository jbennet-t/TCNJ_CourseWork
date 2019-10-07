public class exceptionDemo
{
	public static void main(String args[])
	{
		//"try" code that could cause a problem
		try
		{
			int a = 0;
			int b = 5;
			int c= b/a;
			int d[] = new int[a-2];
		}
		
		//"catches" the issue
		catch(ArithmeticException e)
		{
			System.out.println("Divide by 0 error");
		}
		
		
		
		
		//finally block runs regardless of whether error occurs
		finally
		{
			System.out.println("This always prints out");
		}
	}
}