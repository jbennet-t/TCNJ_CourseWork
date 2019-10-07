public class zeroesArray
{
	public static void main(String[] args)
	{
		int nums[][];
		nums = new int[10][10];
		
		
		for(int i = 0; i <= 9; i++)
		{
			for(int j = 0; j <= 9; j++)
			{
			 nums[i][j] = 0;
			 System.out.print(nums[i][j] + " ");
			}
			System.out.println(" ");
		}
		
	
	}
}
