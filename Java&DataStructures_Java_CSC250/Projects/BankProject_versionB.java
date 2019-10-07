import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class BankProject_versionB extends JFrame
{
	CardLayout carddeck;
	Container c;
	JLabel directions1;
	JLabel directions2;
	JTextField username;
	JTextField password;
	JButton b1;
	JLabel passwordLabel;
	JLabel usernameLabel;
	
	public BankProject_versionB()
	{
		c = getContentPane();
		carddeck = new CardLayout(300,300);
		c.setLayout(carddeck);
		
		//Directions label
		directions1 = new JLabel("Welcome to Bank Software");
		//directions1.setBounds(65,10,300,20); 
		directions2 = new JLabel("Please enter your username and password");
		//directions2.setBounds(20,25,300,20); 
		
		//username entry
		//setBounds(x,y,width,height)
		username = new JTextField();
		//username.setBounds(100,80,150,20); 
		usernameLabel = new JLabel("Username:");
		//usernameLabel.setBounds(30,80,150,20); 
		
		//password entry
		password = new JTextField();
		//password.setBounds(100,110,150,20);
		passwordLabel = new JLabel("Password:");		
		//passwordLabel.setBounds(30,110,150,20); 
		
		//enter button
		b1 = new JButton("Enter");
		//b1.setBounds(120,150,75,25);
		
		c.add("a",directions1);
		c.add("a",directions2);
		c.add("a",username);
		c.add("a",password);
		c.add("a",usernameLabel);
		c.add("a",passwordLabel);
		c.add("a",b1);
		
		
		
	}

	public static void main(String[] args) 
	{  
        BankProject_versionB cl = new BankProject_versionB();  
        cl.setSize(300,300);  
        cl.setVisible(true);  
        cl.setDefaultCloseOperation(EXIT_ON_CLOSE);  
    }  
	
}