import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
 
public class lab3colorpanel extends JPanel implements ActionListener
{
	JFrame frame;
	JButton buttonArray[];
	JPanel contentPane;
	JButton A = new JButton();
	JButton B = new JButton();
	
	public lab3colorpanel()
	{
		JFrame.setDefaultLookAndFeelDecorated(true);
		
		frame = new JFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setLocationRelativeTo(null);
		
		contentPane = createContentPane();
		frame.setContentPane(contentPane);
		
		frame.setVisible(true);
		frame.setSize(500,500);
	}
	
	public JPanel createContentPane()
	{
		JPanel panel = new JPanel(new GridLayout(1,2));
		
		
		A.setBounds(0,0,250,500);
		B.setBounds(250,0,250,500);
		A.addActionListener(this);
		B.addActionListener(this);
		panel.add(A);
		panel.add(B);
	
		return panel;
	}
	
	public void actionPerformed(ActionEvent e)
	{
		if(e.getSource() == B)
		{
			A.setBackground(Color.green);
			B.setBackground(Color.green);
		}
		if(e.getSource() == A)
		{
			A.setBackground(Color.red);
			B.setBackground(Color.red);
		}
	}
	
	public static void main(String args[])
	{
		new lab3colorpanel();
	}
}