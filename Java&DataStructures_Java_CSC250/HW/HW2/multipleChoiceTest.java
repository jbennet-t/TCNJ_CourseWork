import javax.swing.JOptionPane;

public class multipleChoiceTest
{
	
	public static boolean answerChecker(String a)
	{
		a = a.toLowerCase();
		if(a.equals("a") || a.equals("b") || a.equals("c") || a.equals("d"))
		{
			return true;
		} 
		else
		{
			JOptionPane.showMessageDialog(null, "Please pick A, B, C, or D");
			return false;
		}
	}
	
	public static String askQuestion(String[] o) 
	{
		String fmtQuestion = ""; 
		String answer = "";

		
		for(int i = 0; i < o.length; i++)
			fmtQuestion += o[i] + "\n";
			
		do 
		{
			answer = JOptionPane.showInputDialog(fmtQuestion);
			if(answer == null)
			{
				int quit = JOptionPane.showConfirmDialog(null, "Would you like to quit?", "Quit", JOptionPane.YES_NO_OPTION);
				if(quit == 0)
					return "QUIT";
				else
					continue;
			}
		} while (answer == null || !(answerChecker(answer)));
		
		return answer;
	}
	
	public static boolean correctCheck(String a, String r) 
	{
		r = r.toUpperCase();
		if(a.equals(r)) 
		{
			JOptionPane.showMessageDialog(null, "Correct!");
			return true;
		}
		else
		{
			JOptionPane.showMessageDialog(null, "The correct answer is: \n" + a);
			return false;
		}
	}
	
	public static void main(String[] args)
	{
		int i = 0; 
		int correct = 0;
		int incorrect = 0; 
		String response = ""; 
		
		String[] userAnswer = new String[5];
				
		String[][] options = new String[5][5]; 
		
		String[] rightAnswer = new String[5]; 
		
		options[0][0] = "When entering a highway from an entrance ramp, you must yield the right of way to:";
		options[0][1] = "A) no one";
		options[0][2] = "B) heavy trucks on the entrance ramp";
		options[0][3] = "C) vehicles already traveling on the highway";
		options[0][4] = "D) other vehicles on the entrance ramp";
		rightAnswer[0] = "C";
		
		options[1][0] = "During your MVC road test, your examiner will ask you to turn your vehicle around by making a:";
		options[1][1] = "A) 4 point turn";
		options[1][2] = "B) U turn";
		options[1][3] = "C) 2 point turn";
		options[1][4] = "D) 3 point turn";
		rightAnswer[1] = "D";
		
		options[2][0] = "A Do Not Enter sign is:";
		options[2][1] = "A) a red octagon";
		options[2][2] = "B) a red circle inside a white square";
		options[2][3] = "C) a yellow diamond";
		options[2][4] = "D) a yellow triangle";
		rightAnswer[2] = "B";
		
		options[3][0] = "In NJ, it is illegal drive with a blood alcohol concentration (BAC) of ______ or above:";
		options[3][1] = "A) 0.01%";
		options[3][2] = "B) 0.05%";
		options[3][3] = "C) 0.08%";
		options[3][4] = "D) 0.02%";
		rightAnswer[3] = "C";
		
		options[4][0] = "On an expressway, you can avoid highway hypnosis by:";
		options[4][1] = "A) shifting your eyes frequently";
		options[4][2] = "B) frequently talking on your phone";
		options[4][3] = "C) changing lanes frequently";
		options[4][4] = "D) taking stimulants";
		rightAnswer[4] = "A";
		
		do 
		{
			response = askQuestion(options[i]);
			
			if(correctCheck(rightAnswer[i], response))
			{
				correct += 1;
				userAnswer[i] = response;
			}
			else
			{
				incorrect += 1;
				userAnswer[i] = response;
			}
			i++;
		} while(i < options.length);
		
		
		int numberQuestions = correct + incorrect;
		String finalOutputString = "";
		int pointsPerQuestion = 100 / numberQuestions;
		int grade = correct * pointsPerQuestion;
		
		
		finalOutputString += "Your answers were: \n";
			for(int z = 0; z <= 4; z++)
			{
				finalOutputString += userAnswer[z] + "\n";
			}
		finalOutputString += "The correct answers were: \n";	
			for(int z = 0; z <= 4; z++)
			{
				finalOutputString += rightAnswer[z] + "\n";
			}
			
		finalOutputString += "\nYour grade is: " + grade + "%";
		
		JOptionPane.showMessageDialog(null, finalOutputString);
	
		
	}
}
