import javax.swing.*;
class OddEvenCheckerGUI
{
	public static void main(String[] args)
	{
		String input1;
		double num = 0;
		double remainder = 0;
		String cont= "n";
		
		do
		{
			input1 = JOptionPane.showInputDialog(null, "please enter a number:");
			num = Double.parseDouble(input1);
			
			remainder = num % 2;
			
			if(remainder == 0)
			{
				JOptionPane.showMessageDialog(null, num + "is a even number");
			}
			else
			{
				JOptionPane.showMessageDialog(null, num + "is an odd number");
			}
			
			cont = JOptionPane.showInputDialog(null, "Enter another number? Y or N");
		}
		while (cont.matches("Y"));
		JOptionPane.showMessageDialog(null, "Closing the program");
	}
}
