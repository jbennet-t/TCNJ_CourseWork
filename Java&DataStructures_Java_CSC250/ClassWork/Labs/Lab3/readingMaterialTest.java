//tester class below

public class readingMaterialTest
{
	public static void main(String args[])
	{
		Novel HarryPotter = new Novel("Harry Potter", 420, "Harry");
		System.out.println(HarryPotter.toString() + "\n");
		
		Magazine PopMech = new Magazine("Popular Mechanics", 80, 19);
		System.out.println(PopMech.toString());
	}
	
}