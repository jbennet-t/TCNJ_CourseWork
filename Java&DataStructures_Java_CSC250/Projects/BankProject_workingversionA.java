import javax.swing.*;
import java.awt.*;
import java.awt.event.*;


public class BankProject_workingversionA extends JPanel
{
	int z = 0;
	int y = 0;
	int accountCounter = 0;
	int enteredAccountNum;
	String[][] customerInfo = new String[50][12];
		
	public BankProject_workingversionA()
	{
		
//-------------------------------------------------------------------------------------------------------------
//jframe for username/password entry

		JFrame frame1;
		JLabel directions1;
		JLabel directions2;
		JTextField username;
		JTextField password;
		JButton b1;
		JLabel passwordLabel;
		JLabel usernameLabel;
		
		frame1 = new JFrame("Username and Password Entry");
		
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
		password = new JPasswordField();
		password.setBounds(100,110,150,20);
		passwordLabel = new JLabel("Password:");		
		passwordLabel.setBounds(30,110,150,20); 
		
		//enter button
		b1 = new JButton("Enter");
		b1.setBounds(120,150,75,25);
		
		//creating frame1
		frame1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame1.add(directions1);
		frame1.add(directions2);
		frame1.add(username);
		frame1.add(password);
		frame1.add(usernameLabel);
		frame1.add(passwordLabel);
		frame1.add(b1);
		frame1.setSize(300,300);
		frame1.setLayout(null);
		frame1.setVisible(true); 
		
		
//--------------------------------------------------------------------------------------------------------------------------------
//jframe choosing whether to add customer details, exit, viewinfo, delete(manager only) or edit(manager only)
		JFrame frame2;
		JLabel directions3;
		JButton b2;
		JButton b3;
		JButton delete;
		JButton exit;
		JButton viewInfo;
		
		frame2 = new JFrame();
		
		//directions label
		directions3 = new JLabel("Select an action:");
		directions3.setBounds(100,25,300,20); 
		
		//Enter button 
		b2 = new JButton("Enter");
		b2.setBounds(50,75,90,30);
		
		//Change button
		b3 = new JButton("Change");
		b3.setBounds(150,75,90,30);
		
		//Delete specific account data button
		delete = new JButton("Delete");
		delete.setBounds(50,125,90,30);
		
		//Exit Program Button
		exit = new JButton("Exit");
		exit.setBounds(105,175,80,30);
		
		//View Information Button
		viewInfo = new JButton("View Info");
		viewInfo.setBounds(150,125,90,30);
		
		//creating frame2
		frame2.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame2.add(directions3);
		frame2.add(b2);
		frame2.add(b3);
		frame2.add(exit);
		frame2.add(viewInfo);
		frame2.add(delete);
		frame2.setSize(300,300);
		frame2.setLayout(null);
		frame2.setVisible(false); 
		
		
	
//--------------------------------------------------------------------------------------------------------------------------------
//jframe for adding customer details(manager or employee)

		JFrame frame3;
		JLabel directions4;
		JLabel firstname, lastname, phonenum, email, aptnum, streetaddress, city, state, zipcode, accntnum, branch, loanamnt;
		JTextField fnField, lnField, pnField, emField, anField, saField, ciField, stField, zcField, antField, bField, laField;
		JButton b4;
				
		
		frame3 = new JFrame("Enter Customer Details");
		
		//directions for entering details
		directions4 = new JLabel("Enter the customer's details in the boxes below:");
		directions4.setBounds(50,50,300,20);
		
		//creating labels and boxes for information input
		
		firstname = new JLabel("First Name:");
		firstname.setBounds(50,100,100,20);
		fnField = new JTextField();
		fnField.setBounds(150,100,150,20);
		
		lastname = new JLabel("Last Name:");
		lastname.setBounds(50,125,100,20);
		lnField = new JTextField();
		lnField.setBounds(150,125,150,20);
		
		phonenum = new JLabel("Phone #:");
		phonenum.setBounds(50,150,100,20);
		pnField = new JTextField();
		pnField.setBounds(150,150,150,20);
		
		email = new JLabel("Email:");
		email.setBounds(50,175,100,20);
		emField = new JTextField();
		emField.setBounds(150,175,150,20);
		
		aptnum = new JLabel("Apartment #:");
		aptnum.setBounds(50,200,100,20);
		anField = new JTextField();
		anField.setBounds(150,200,150,20);
		
		streetaddress = new JLabel("Street Address:");
		streetaddress.setBounds(50,225,100,20);
		saField = new JTextField();
		saField.setBounds(150,225,150,20);
		
		city = new JLabel("City:");
		city.setBounds(50,250,100,20);
		ciField = new JTextField();
		ciField.setBounds(150,250,150,20);
		
		state = new JLabel("State:");
		state.setBounds(50,275,100,20);
		stField = new JTextField();
		stField.setBounds(150,275,150,20);
		
		zipcode = new JLabel("Zipcode:");
		zipcode.setBounds(50,300,100,20);
		zcField = new JTextField();
		zcField.setBounds(150,300,150,20);
		
		accntnum = new JLabel("Account #:");
		accntnum.setBounds(50,325,100,20);
		antField = new JTextField();
		antField.setBounds(150,325,150,20);
		
		branch = new JLabel("Branch:");
		branch.setBounds(50,350,100,20);
		bField = new JTextField();
		bField.setBounds(150,350,150,20);
		
		loanamnt = new JLabel("Loan Amount:");
		loanamnt.setBounds(50,375,100,20);
		laField = new JTextField();
		laField.setBounds(150,375,150,20);
		
		//enter button
		b4 = new JButton("Input Info");
		b4.setBounds(175,475,100,25);
		
		//creating frame3
		frame3.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame3.add(directions4);
		frame3.add(firstname);
		frame3.add(fnField);
		frame3.add(lastname);
		frame3.add(lnField);
		frame3.add(phonenum);
		frame3.add(pnField);
		frame3.add(email);
		frame3.add(emField);
		frame3.add(aptnum);
		frame3.add(anField);
		frame3.add(streetaddress);
		frame3.add(saField);
		frame3.add(city);
		frame3.add(ciField);
		frame3.add(state);
		frame3.add(stField);
		frame3.add(zipcode);
		frame3.add(zcField);
		frame3.add(accntnum);
		frame3.add(antField);
		frame3.add(branch);
		frame3.add(bField);
		frame3.add(loanamnt);
		frame3.add(laField);
		frame3.add(b4);
		
		
		frame3.setSize(400,650);
		frame3.setLayout(null);
		frame3.setVisible(false); 
		
		
		
//--------------------------------------------------------------------------------------------------------------------------------
//jframe for entering account number before editting
		JFrame frame4;
		JLabel directions5;
		JButton b5;
		JTextField accountNumberA;
				
		frame4 = new JFrame();
		
		//directions label
		directions5 = new JLabel("Enter Account Number to Edit Details");
		directions5.setBounds(40,25,300,25); 
		
		accountNumberA = new JTextField();
		accountNumberA.setBounds(90,75,100,25);
		
		//Enter button 
		b5 = new JButton("Enter");
		b5.setBounds(100,125,80,30);
		
			
		//creating frame4
		frame4.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame4.add(directions5);
		frame4.add(b5);
		frame4.add(accountNumberA);
		frame4.setSize(300,300);
		frame4.setLayout(null);
		frame4.setVisible(false); 

//--------------------------------------------------------------------------------------------------------------------------------
//jframe for entering account number before deleting customer
		JFrame deleteFrame;
		JLabel deletedirections;
		JButton deleteb;
		JTextField deleteaccountNumber;
				
		deleteFrame = new JFrame();
		
		//directions label
		deletedirections = new JLabel("Enter Account Number to Delete Details");
		deletedirections.setBounds(40,25,300,25); 
		
		deleteaccountNumber = new JTextField();
		deleteaccountNumber.setBounds(90,75,100,25);
		
		//Enter button 
		deleteb = new JButton("Enter");
		deleteb.setBounds(100,125,80,30);
		
			
		//creating deleteFrame
		deleteFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		deleteFrame.add(deletedirections);
		deleteFrame.add(deleteb);
		deleteFrame.add(deleteaccountNumber);
		deleteFrame.setSize(300,300);
		deleteFrame.setLayout(null);
		deleteFrame.setVisible(false); 	
		
//--------------------------------------------------------------------------------------------------------------------------------
//jframe for entering account number before creating new customer
		JFrame interimFrame;
		JLabel interimdirections;
		JButton interimb;
		JTextField interimaccountNumber;
				
		interimFrame = new JFrame();
		
		//directions label
		interimdirections = new JLabel("Enter Account Number to Create New Customers");
		interimdirections.setBounds(5,25,300,25); 
		
		interimaccountNumber = new JTextField();
		interimaccountNumber.setBounds(90,75,100,25);
		
		//Enter button 
		interimb = new JButton("Enter");
		interimb.setBounds(100,125,80,30);
		
			
		//creating interimFrame
		interimFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		interimFrame.add(interimdirections);
		interimFrame.add(interimb);
		interimFrame.add(interimaccountNumber);
		interimFrame.setSize(300,300);
		interimFrame.setLayout(null);
		interimFrame.setVisible(false); 
		
//--------------------------------------------------------------------------------------------------------------------------------
//jframe for entering account number before viewing customer info
		JFrame previewFrame;
		JLabel previewdirections;
		JButton previewb;
		JTextField previewaccountNumber;
				
		previewFrame = new JFrame();
		
		//directions label
		previewdirections = new JLabel("Enter Account Number to View Details");
		previewdirections.setBounds(40,25,300,25); 
		
		previewaccountNumber = new JTextField();
		previewaccountNumber.setBounds(90,75,100,25);
		
		//Enter button 
		previewb = new JButton("Enter");
		previewb.setBounds(100,125,80,30);
		
			
		//creating previewFrame
		previewFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		previewFrame.add(previewdirections);
		previewFrame.add(previewb);
		previewFrame.add(previewaccountNumber);
		previewFrame.setSize(300,300);
		previewFrame.setLayout(null);
		previewFrame.setVisible(false); 
//--------------------------------------------------------------------------------------------------------------------------------
//jframe for editing customer details (manager only)

		JFrame frame5;
		JLabel directions6;
		JButton b6;
		JTextField fnField2, lnField2, pnField2, emField2, anField2, saField2, ciField2, stField2, zcField2, antField2, bField2, laField2;	
		JLabel firstname2, lastname2, phonenum2, email2, aptnum2, streetaddress2, city2, state2, zipcode2, accntnum2, branch2, loanamnt2;
		
		y = enteredAccountNum;
		
		frame5 = new JFrame("Edit Customer Details");
		
		//creating label with directions for editing information
		directions4 = new JLabel("Edit the customer's details in the boxes below:");
		directions4.setBounds(50,50,300,20);
		
		//creating labels and boxes for information editing
		
		firstname2 = new JLabel("First Name:");
		firstname2.setBounds(50,100,100,20);
		fnField2 = new JTextField(customerInfo[y][0]);
		fnField2.setBounds(150,100,150,20);
		
		lastname2 = new JLabel("Last Name:");
		lastname2.setBounds(50,125,100,20);
		lnField2 = new JTextField(customerInfo[y][1]);
		lnField2.setBounds(150,125,150,20);
		
		phonenum2 = new JLabel("Phone #:");
		phonenum2.setBounds(50,150,100,20);		
		pnField2 = new JTextField(customerInfo[y][2]);
		pnField2.setBounds(150,150,150,20);
		
		email2 = new JLabel("Email:");
		email2.setBounds(50,175,100,20);		
		emField2 = new JTextField(customerInfo[y][3]);
		emField2.setBounds(150,175,150,20);
		
		aptnum2 = new JLabel("Apartment #:");
		aptnum2.setBounds(50,200,100,20);
		anField2 = new JTextField(customerInfo[y][4]);
		anField2.setBounds(150,200,150,20);
		
		streetaddress2 = new JLabel("Street Address:");
		streetaddress2.setBounds(50,225,100,20);
		saField2 = new JTextField(customerInfo[y][5]);
		saField2.setBounds(150,225,150,20);
		
		city2 = new JLabel("City:");
		city2.setBounds(50,250,100,20);
		ciField2 = new JTextField(customerInfo[y][6]);
		ciField2.setBounds(150,250,150,20);
		
		state2 = new JLabel("State:");
		state2.setBounds(50,275,100,20);
		stField2 = new JTextField(customerInfo[y][7]);
		stField2.setBounds(150,275,150,20);
		
		zipcode2 = new JLabel("Zipcode:");
		zipcode2.setBounds(50,300,100,20);		
		zcField2 = new JTextField(customerInfo[y][8]);
		zcField2.setBounds(150,300,150,20);
		
		accntnum2 = new JLabel("Account #:");
		accntnum2.setBounds(50,325,100,20);
		antField2 = new JTextField(customerInfo[y][9]);
		antField2.setBounds(150,325,150,20);
		
		branch2 = new JLabel("Branch:");
		branch2.setBounds(50,350,100,20);		
		bField2 = new JTextField(customerInfo[y][10]);
		bField2.setBounds(150,350,150,20);
		
		loanamnt2 = new JLabel("Loan Amount:");
		loanamnt2.setBounds(50,375,100,20);
		laField2 = new JTextField(customerInfo[y][11]);
		laField2.setBounds(150,375,150,20);
		
		//enter button
		b6 = new JButton("Input Info");
		b6.setBounds(175,475,100,25);
		
		//creating frame5
		frame5.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame5.add(directions4);
		frame5.add(firstname2);
		frame5.add(fnField2);
		frame5.add(lastname2);
		frame5.add(lnField2);
		frame5.add(phonenum2);
		frame5.add(pnField2);
		frame5.add(email2);
		frame5.add(emField2);
		frame5.add(aptnum2);
		frame5.add(anField2);
		frame5.add(streetaddress2);
		frame5.add(saField2);
		frame5.add(city2);
		frame5.add(ciField2);
		frame5.add(state2);
		frame5.add(stField2);
		frame5.add(zipcode2);
		frame5.add(zcField2);
		frame5.add(accntnum2);
		frame5.add(antField2);
		frame5.add(branch2);
		frame5.add(bField2);
		frame5.add(loanamnt2);
		frame5.add(laField2);
		frame5.add(b6);
		
		
		frame5.setSize(400,650);
		frame5.setLayout(null);
		frame5.setVisible(false); 


//--------------------------------------------------------------------------------------------------------------------------------
//jframe for viewing customer details

		JFrame frame6;
		JLabel directions7;
		JButton b7;
		JTextField fnField3, lnField3, pnField3, emField3, anField3, saField3, ciField3, stField3, zcField3, antField3, bField3, laField3;	
		JLabel firstname3, lastname3, phonenum3, email3, aptnum3, streetaddress3, city3, state3, zipcode3, accntnum3, branch3, loanamnt3;
		
		y = enteredAccountNum;
		
		frame6 = new JFrame("View Customer Details");
		
		//creating label with directions for view
		directions7 = new JLabel("Below are the customer details for this customer:");
		directions7.setBounds(50,50,300,20);
		
		//creating labels and boxes for view
		
		firstname3 = new JLabel("First Name:");
		firstname3.setBounds(50,100,100,20);
		fnField3 = new JTextField(customerInfo[y][0]);
		fnField3.setBounds(150,100,150,20);
		
		lastname3 = new JLabel("Last Name:");
		lastname3.setBounds(50,125,100,20);
		lnField3 = new JTextField(customerInfo[y][1]);
		lnField3.setBounds(150,125,150,20);
		
		phonenum3 = new JLabel("Phone #:");
		phonenum3.setBounds(50,150,100,20);		
		pnField3 = new JTextField(customerInfo[y][2]);
		pnField3.setBounds(150,150,150,20);
		
		email3 = new JLabel("Email:");
		email3.setBounds(50,175,100,20);		
		emField3 = new JTextField(customerInfo[y][3]);
		emField3.setBounds(150,175,150,20);
		
		aptnum3 = new JLabel("Apartment #:");
		aptnum3.setBounds(50,200,100,20);
		anField3 = new JTextField(customerInfo[y][4]);
		anField3.setBounds(150,200,150,20);
		
		streetaddress3 = new JLabel("Street Address:");
		streetaddress3.setBounds(50,225,100,20);
		saField3 = new JTextField(customerInfo[y][5]);
		saField3.setBounds(150,225,150,20);
		
		city3 = new JLabel("City:");
		city3.setBounds(50,250,100,20);
		ciField3 = new JTextField(customerInfo[y][6]);
		ciField3.setBounds(150,250,150,20);
		
		state3 = new JLabel("State:");
		state3.setBounds(50,275,100,20);
		stField3 = new JTextField(customerInfo[y][7]);
		stField3.setBounds(150,275,150,20);
		
		zipcode3 = new JLabel("Zipcode:");
		zipcode3.setBounds(50,300,100,20);		
		zcField3 = new JTextField(customerInfo[y][8]);
		zcField3.setBounds(150,300,150,20);
		
		accntnum3 = new JLabel("Account #:");
		accntnum3.setBounds(50,325,100,20);
		antField3 = new JTextField(customerInfo[y][9]);
		antField3.setBounds(150,325,150,20);
		
		branch3 = new JLabel("Branch:");
		branch3.setBounds(50,350,100,20);		
		bField3 = new JTextField(customerInfo[y][10]);
		bField3.setBounds(150,350,150,20);
		
		loanamnt3 = new JLabel("Loan Amount:");
		loanamnt3.setBounds(50,375,100,20);
		laField3 = new JTextField(customerInfo[y][11]);
		laField3.setBounds(150,375,150,20);
		
		//enter button
		b7 = new JButton("Return");
		b7.setBounds(175,475,100,25);
		
		//creating frame6
		frame6.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame6.add(directions7);
		frame6.add(firstname3);
		frame6.add(fnField3);
		frame6.add(lastname3);
		frame6.add(lnField3);
		frame6.add(phonenum3);
		frame6.add(pnField3);
		frame6.add(email3);
		frame6.add(emField3);
		frame6.add(aptnum3);
		frame6.add(anField3);
		frame6.add(streetaddress3);
		frame6.add(saField3);
		frame6.add(city3);
		frame6.add(ciField3);
		frame6.add(state3);
		frame6.add(stField3);
		frame6.add(zipcode3);
		frame6.add(zcField3);
		frame6.add(accntnum3);
		frame6.add(antField3);
		frame6.add(branch3);
		frame6.add(bField3);
		frame6.add(loanamnt3);
		frame6.add(laField3);
		frame6.add(b7);
		
		
		frame6.setSize(400,650);
		frame6.setLayout(null);
		frame6.setVisible(false); 


				
//------------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------Listener------------------------------------------------------------------------------------------------------------
//----------------------------------Section-------------------------------------------------------------------------------------------------------------	
//------------------------------------------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------------------------------------------
//Listener for frame1		

		//action listener to run username/password check
		b1.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				String enteredUsername = username.getText();  
				String enteredPassword = password.getText();  
        
				if(enteredUsername.equals("admin") && enteredPassword.equals("admin123"))
				{
					//admin entry
					z = 1;					
					frame1.setVisible(false);  
					frame2.setVisible(true);
									}
				else if(enteredUsername.equals("employee") && enteredPassword.equals("employee123"))
				{
					//employee entry
					z = 2;
					frame1.setVisible(false);
					frame2.setVisible(true);
									}
				else
				{
					//in case of wrong username/password
					z = 0;
					JOptionPane.showMessageDialog(null, "Incorrect username/password");
				}
			}	 
		}
							);
							
//------------------------------------------------------------------------------------------------------------------------------------------------------
//Listener for frame2	

		//action listener to watch b2(Enter) for press
		b2.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				frame2.setVisible(false);
				interimFrame.setVisible(true);
			}
		}
							);
		
		//action listener to watch b3(Change) for press
		b3.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				if(z == 1)//checks if user is manager or employee
				{
					//if manager
					frame2.setVisible(false);
					frame4.setVisible(true);
				}
				else
				{
					//otherwise
					JOptionPane.showMessageDialog(null, "Only Bank Managers are allowed to edit customer details");
				}
			}	 
		}
							);
		
		//action listener to delete customer info		
		delete.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				if(z == 1)//checks if user is manager or employee
				{
					//if manager
					frame2.setVisible(false);
					deleteFrame.setVisible(true);
				}
				else
				{
					//otherwise
					JOptionPane.showMessageDialog(null, "Only Bank Managers are allowed to delete customer details");
				}
			}	
		}
							);	
							
		//action listener to exit program		
		exit.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				System.exit(0);
			}	 
		}
							);
		
		//action listener to viewing info		
		viewInfo.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				frame2.setVisible(false);
				previewFrame.setVisible(true);
			}	 
		}
							);	

							
//------------------------------------------------------------------------------------------------------------------------------------------------------
//Listener for interimFrame
	//action listener to watch b for press
		interimb.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				//needed to specify where in array account is created, to prevent overlaps of data
				enteredAccountNum = Integer.parseInt(interimaccountNumber.getText()); 
				interimaccountNumber.setText(null);
				interimFrame.setVisible(false);
				frame3.setVisible(true);
				
			}	 
		}
							);	
							
//------------------------------------------------------------------------------------------------------------------------------------------------------
//Listener for previewFrame
	//action listener to watch b for press
		previewb.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				//needed to specify where in array account is located to view
				enteredAccountNum = Integer.parseInt(previewaccountNumber.getText()); 
				previewaccountNumber.setText(null);
				
				y = enteredAccountNum;
				
				//setting textfields to the information that exists at location "y" in array
				fnField3.setText(customerInfo[y][0]);
				lnField3.setText(customerInfo[y][1]);
				pnField3.setText(customerInfo[y][2]);
				emField3.setText(customerInfo[y][3]);
				anField3.setText(customerInfo[y][4]);
				saField3.setText(customerInfo[y][5]);
				ciField3.setText(customerInfo[y][6]);
				stField3.setText(customerInfo[y][7]);
				zcField3.setText(customerInfo[y][8]);
				antField3.setText(customerInfo[y][9]);
				bField3.setText(customerInfo[y][10]);
				laField3.setText(customerInfo[y][11]);
				
				previewFrame.setVisible(false);
				frame6.setVisible(true);
				
			}	 
		}
							);								
//------------------------------------------------------------------------------------------------------------------------------------------------------
//Listener for deleteFrame
	//action listener to watch b for press
		deleteb.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				//needed to specify which account is being deleted
				enteredAccountNum = Integer.parseInt(deleteaccountNumber.getText()); 
				y = enteredAccountNum;
				
				customerInfo[y][0] = null;
				customerInfo[y][1] = null;
				customerInfo[y][2] = null;
				customerInfo[y][3] = null;
				customerInfo[y][4] = null;
				customerInfo[y][5] = null;
				customerInfo[y][6] = null;
				customerInfo[y][7] = null;
				customerInfo[y][8] = null;
				customerInfo[y][9] = null;
				customerInfo[y][10] = null;
				customerInfo[y][11] = null;
				
				deleteaccountNumber.setText(null);
				deleteFrame.setVisible(false);
				frame2.setVisible(true);
				
			}	 
		}
							);		
														
//------------------------------------------------------------------------------------------------------------------------------------------------------
//Listener for frame3
	//action listener to watch b for press
		b4.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{
				y = enteredAccountNum;
				
				//retriving text from textfields after employee/manager has entered info
				customerInfo[y][0] = fnField.getText();
				customerInfo[y][1] = lnField.getText();
				customerInfo[y][2] = pnField.getText();
				customerInfo[y][3] = emField.getText();
				customerInfo[y][4] = anField.getText();
				customerInfo[y][5] = saField.getText();
				customerInfo[y][6] = ciField.getText();
				customerInfo[y][7] = stField.getText();
				customerInfo[y][8] = zcField.getText();
				customerInfo[y][9] = antField.getText();
				customerInfo[y][10] = bField.getText();
				customerInfo[y][11] = laField.getText();
				
				//clearing text fields afterwards
				fnField.setText(null);
				lnField.setText(null);
				pnField.setText(null);
				emField.setText(null);
				anField.setText(null);
				saField.setText(null);
				ciField.setText(null);
				stField.setText(null);
				zcField.setText(null);
				antField.setText(null);
				bField.setText(null);
				laField.setText(null);
				
				frame3.setVisible(false);
				frame2.setVisible(true);
				
			}	 
		}
							);
							
//------------------------------------------------------------------------------------------------------------------------------------------------------
//Listener for frame4
	//action listener to watch b for press
		b5.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
				enteredAccountNum = Integer.parseInt(accountNumberA.getText());
				
				y = enteredAccountNum;
				
				//setting textfields to the information that exists at location "y" in array
				fnField2.setText(customerInfo[y][0]);
				lnField2.setText(customerInfo[y][1]);
				pnField2.setText(customerInfo[y][2]);
				emField2.setText(customerInfo[y][3]);
				anField2.setText(customerInfo[y][4]);
				saField2.setText(customerInfo[y][5]);
				ciField2.setText(customerInfo[y][6]);
				stField2.setText(customerInfo[y][7]);
				zcField2.setText(customerInfo[y][8]);
				antField2.setText(customerInfo[y][9]);
				bField2.setText(customerInfo[y][10]);
				laField2.setText(customerInfo[y][11]);
				
				frame4.setVisible(false);
				frame5.setVisible(true);
				
			}	 
		}
							);

//------------------------------------------------------------------------------------------------------------------------------------------------------
//Listener for frame5
	//action listener to watch b for press
		b6.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{ 
			
				y = enteredAccountNum;
				
				//retriving text from textfields after manager has editted info
				customerInfo[y][0] = fnField2.getText();
				customerInfo[y][1] = lnField2.getText();
				customerInfo[y][2] = pnField2.getText();
				customerInfo[y][3] = emField2.getText();
				customerInfo[y][4] = anField2.getText();
				customerInfo[y][5] = saField2.getText();
				customerInfo[y][6] = ciField2.getText();
				customerInfo[y][7] = stField2.getText();
				customerInfo[y][8] = zcField2.getText();
				customerInfo[y][9] = antField2.getText();
				customerInfo[y][10] = bField2.getText();
				customerInfo[y][11] = laField2.getText();
				
					
				frame5.setVisible(false);
				frame2.setVisible(true);
				
			}	 
		}
							);

//------------------------------------------------------------------------------------------------------------------------------------------------------
//Listener for frame6
	//action listener to watch b7 for press
		b7.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) 
			{
				
				//clearing text fields afterwards
				fnField3.setText(null);
				lnField3.setText(null);
				pnField3.setText(null);
				emField3.setText(null);
				anField3.setText(null);
				saField3.setText(null);
				ciField3.setText(null);
				stField3.setText(null);
				zcField3.setText(null);
				antField3.setText(null);
				bField3.setText(null);
				laField3.setText(null);
				
				frame6.setVisible(false);
				frame2.setVisible(true);
				
			}	 
		}
							);
							
	}
			
	
	public static void main(String[] args) 
	{  
		//creating BankProject and running the program
		new BankProject_workingversionA();  
	} 	
}

