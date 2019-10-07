class ReadingMaterial
{
	public String materialTitle;
	public int pageLength;
	
	public ReadingMaterial(String materialTitle, int pageLength)
	{
		this.materialTitle = materialTitle;
		this.pageLength = pageLength;
		
	}
	
	public String toString()
	{
		return("The title of the material is: " + materialTitle + "\n" + "The number of pages is: " + pageLength + "\n");
		
	}
	
}

class Novel extends ReadingMaterial
{
	public String mainCharacterName; 
	
	public Novel(String materialTitle, int pageLength, String mainCharacterName)
	{
		super(materialTitle,pageLength);
		this.mainCharacterName = mainCharacterName;
		
	}
	
	public String toString()
	{
		return super.toString() + "The main characters name is: " + mainCharacterName;
		
	}
}

class Magazine extends ReadingMaterial
{
	public int numberOfArticles; 
	
	public Magazine(String materialTitle, int pageLength, int numberOfArticles)
	{
		super(materialTitle,pageLength);
		this.numberOfArticles = numberOfArticles;
		
	}
	
	public String toString()
	{
		return super.toString() + "The number of articles is: " + numberOfArticles;
		
	}
}


//tester class below
/*
class Test
{
	public static void main(String args[])
	{
		Novel HarryPotter = new Novel("Harry Potter", 420, "Harry");
		System.out.println(HarryPotter.toString());
	}
	
}
*/