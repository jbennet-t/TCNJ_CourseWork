class Rectangle
{
	private double length;
	private double width;
	private double area;
	
	public void setWidth(double w)
	{
		width = w;
	}
	
	public void getWidth()
	{
		return width;
	}
	
	public void setlength(double l)
	{
		length = l;
	}
	
	public void getlength()
	{
		return length;
	}
	
	public double calcArea()
	{
		area = length*width;
		return area;
	}
	
}

public class areaCalculator
{
	public static void main(String[] args)
	{
		Rectangle r1 = new Rectangle();
		r1.setLength(5);
		r1.setWidth(5);
		
		System.out.println("The area of a " + r1.getlength + " (length) by" + r1.getWidth + " (width) rectangle is: " + calcArea);
		
	}
	
}