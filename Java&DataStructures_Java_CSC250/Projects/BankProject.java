import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class BankProject extends JPanel
{
	Cardlayout bodycard1;
	Container c;
	JPanel card1;
	JLabel directions1;
	JLabel directions2;
	JTextField username;
	JTextField password;
	JButton b1;
	JLabel passwordLabel;
	JLabel usernameLabel;
	int z = 0;
	
	public BankProject()
	{
		c = getContentPane();
		bodycard1 = new CardLayout(500,500);
		c.setLayout(bodycard1);
		
		JPanel card1 = new JPanel();
		
		//Directions label
		directions1 = new JLabel("Welcome to Bank Software");
		directions1.setBounds(65,10,300,20); 
		directions2 = new JLabel("Please enter your username and password");
		directions2.setBounds(20,25,300,20); 
		
		//username entry
		//setBounds(x,y,width,height)
		username = new JTextField();
		username.setBounds(100,80,150,20); 
		usernameLabel = new JLabel("Username:");
		usernameLabel.setBounds(30,80,150,20); 
		
		//password entry
		password = new JTextField();
		password.setBounds(100,110,150,20);
		passwordLabel = new JLabel("Password:");		
		passwordLabel.setBounds(30,110,150,20); 
		
		//enter button
		b1 = new JButton("Enter");
		b1.setBounds(120,150,75,25);
		
		//creating cards
		card1.add(directions1);
		card1.add(directions2);
		card1.add(username);
		card1.add(password);
		card1.add(usernameLabel);
		card1.add(passwordLabel);
		card1.add(b1);
		bodycard1.add(card1, "Card 1");
		c.add(bodycard1, "BodyCard 1");
		
		
		cards.setSize(300,300);
		cards.setLayout(null);
		cards.setVisible(true); 
		
		
		//action listener to run username/password check
		b1.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				String enteredUsername = username.getText();  
				String enteredPassword = password.getText();  
        
				if(enteredUsername.equals("admin") && enteredPassword.equals("admin123"))
				{
					z = 1;					
					bodycard1.next(c);
					JOptionPane.showMessageDialog(null, "Entering Admin Account");
				}
				else if(enteredUsername.equals("employee") && enteredPassword.equals("employee123"))
				{
					z = 2;
					cardLayout.next(cards);
					JOptionPane.showMessageDialog(null, "Entering Employee Account");
				}
				else
				{
					z = 0;
					JOptionPane.showMessageDialog(null, "Incorrect username/password");
				}
			}	 
		}
							);
	
	
//--------------------------------------------------------------------------------------------------------------------------------
//jframe choosing whether to add customer details or edit(manager only)
		JFrame frame2;
		JLabel directions3;
		JButton b2;
		JButton b3;
		
		frame2 = new JFrame();
		
		//directions label
		directions3 = new JLabel("Enter or Change Customer Details?");
		directions3.setBounds(65,10,300,20); 
		
		//Enter button 
		b2 = new JButton("Enter");
		b2.setBounds(150,75,75,25);
		
		//Change button
		b3 = new JButton("Change");
		b3.setBounds(150,75,75,25);
		
		//creating frame2
		while(z != 0)
		{
		frame2.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame2.add(directions3);
		frame2.add(b2);
		frame2.add(b3);
		frame2.setSize(300,300);
		frame2.setLayout(null);
		frame2.setVisible(true); 
		}
		
		//action listener to watch b2(Enter) for press
		b2.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				frame2.dispose();
				JOptionPane.showMessageDialog(null, "Entering Add New Customer Mode");
			}	 
		}
							);
		
		//action listener to watch b3(Change) for press
		b3.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				if(z == 1)
				{
					frame2.dispose();
					JOptionPane.showMessageDialog(null, "Entering Edit Customer Details Mode");
				}
				else
				{
					JOptionPane.showMessageDialog(null, "Only Bank Managers are allowed to edit customer details");
				}
			}	 
		}
							);


//--------------------------------------------------------------------------------------------------------------------------------
//jframe for adding customer details(manager or employee)
/*
		JFrame frame3;
		JLabel directions4;
		JTextField username;
		JTextField password;
		JButton b1;
		JLabel passwordLabel;
		JLabel usernameLabel;
		
		frame3 = new JFrame("Enter and Change Customer Details");
		
		//Directions label
		directions4 = new JLabel("Welcome to Bank Software");
		directions4.setBounds(65,10,300,20); 
		
		
		//username entry
		//setBounds(x,y,width,height)
		username = new JTextField();
		username.setBounds(100,80,150,20); 
		usernameLabel = new JLabel("Username:");
		usernameLabel.setBounds(30,80,150,20); 
		
		//password entry
		password = new JTextField();
		password.setBounds(100,110,150,20);
		passwordLabel = new JLabel("Password:");		
		passwordLabel.setBounds(30,110,150,20); 
		
		//enter button
		b1 = new JButton("Enter");
		b1.setBounds(120,150,75,25);
		
		//creating frame1
		frame3.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame3.add(directions1);
		frame3.setSize(1000,1000);
		frame3.setLayout(null);
		frame3.setVisible(true); 
		*/
	}
	
		
	public static void main(String[] args) 
	{  
		new BankProject();  
	} 	
}

