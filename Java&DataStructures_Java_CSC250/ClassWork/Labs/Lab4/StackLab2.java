import java.util.Stack;

public class StackLab2
{
	public static void main(String[] args)
	{
		Stack<String> stackOfBooks = new Stack<>();
		
		stackOfBooks.push("The Bible");
		stackOfBooks.push("To Kill A Mockingbird");
		stackOfBooks.push("Hitchhiker's Guide To The Galaxy");
		System.out.println(stackOfBooks);
		
		System.out.println("The first element of the stack is: " + stackOfBooks.peek());
		stackOfBooks.pop();
		
		
		System.out.println(stackOfBooks);
	}
}
		