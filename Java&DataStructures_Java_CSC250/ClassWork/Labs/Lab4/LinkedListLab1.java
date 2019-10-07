import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class LinkedListLab1
{
	public static void main(String[] args)
	{
		LinkedList<String> states = new LinkedList<>();
		
		states.add("Maine");
		states.add("New Jersey");
		states.add("Alambama");
		states.add("Virginia");
		System.out.println(states);
	
		states.addFirst("Florida");
		states.addLast("New York");
		System.out.println(states);
		
		states.add(3, "New Hampshire");
		System.out.println(states);
		
		System.out.println("First element:" + states.peek());
		states.removeLast();
		System.out.println(states);
		System.out.println("New York occurs at" + states.indexOf("New York"));
		
		
	}
}
		
		