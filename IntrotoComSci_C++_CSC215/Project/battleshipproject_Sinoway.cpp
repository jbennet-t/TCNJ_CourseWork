/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date: 11/28/2017

 Course: CSC-215
 File:  bproject.cpp
 Rev #: 1.1
 Description: This program is a version of the classic boardgame:
 Battleship. The user is able to choose where to position
 ships on a game board that is represented by a 2D array. The user can
 choose "coordinates" to fire at on the game board such as 2A or 7F, and
 the program will check if a ship is placed at that point, and return a
 message saying if it was hit or a miss. The hit/miss will be reflected
 by a change of symbols on the gameboard. The game is played until all
 of the players ships are destroyed, or the computers ships are destroyed.
 ============================================================*/

#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>

using namespace std;

string userInput = "";
string shipLocationX = ""; //x coordinate for placing ships
string shipLocationY = ""; //y coordinate for placing ships
string shipOrientation = ""; //direction for placing ships

int x = 0; //starting x coordinate for placing ships
int y = 0; //starting y coordinate for placing ships
int w = 0; //random orientation for computer ships
bool checkerA = false; //checker to escape from the loop for placing ships
bool collision = true; //checker to check for overlapping when placing ships

string fireX = ""; //x coordinate for firing
string fireY = ""; //y coordinate for firing
string fireReturn = ""; //return for a hit/miss
int playerHitCounter = 0; //count for number of times hits have occured, needed to end the game
int computerHitCounter = 0; //count for number of times hits have occured, needed to end the game
bool hitMarker= false; //check to see if the computer hit

string playerAttack(string fireX, string fireY) //function to convert input into coordinates
{
	if(fireX == "1")
	{
			x = 1;
	}
	else if(fireX == "2")
	{
			x = 2;
	}
	else if(fireX == "3")
	{
			x = 3;
	}
	else if(fireX == "4")
	{
			x = 4;
	}
	else if(fireX == "5")
	{
			x = 5;
	}
	else if(fireX == "6")
	{
			x = 6;
	}
	else if(fireX == "7")
	{
			x = 7;
	}
	else if(fireX == "8")
	{
			x = 8;
	}
	else if(fireX == "9")
	{
			x = 9;
	}
	else if(fireX == "X")
	{
			x = 10;
	}
	else
	{
			fireReturn = "Incorrect input. Try again.";
			return fireReturn;
	}

	if(fireY == "A")
		{
				y = 1;
		}
		else if(fireY == "B")
		{
				y = 2;
		}
		else if(fireY == "C")
		{
				y = 3;
		}
		else if(fireY == "D")
		{
				y = 4;
		}
		else if(fireY == "E")
		{
				y = 5;
		}
		else if(fireY == "F")
		{
				y = 6;
		}
		else if(fireY == "G")
		{
				y = 7;
		}
		else if(fireY == "H")
		{
				y = 8;
		}
		else if(fireY == "I")
		{
				y = 9;
		}
		else if(fireY == "J")
		{
				y = 10;
		}
		else
		{
				fireReturn = "Incorrect input. Try again.";
				return fireReturn;
		}

		return fireReturn;
}

int main()
{
	srand(time(NULL)); //creates random numbers for all computer controlled moves
	char board[11][11] =
	{
		{' ','1','2','3','4','5','6','7','8','9','X'},
		{'A','~','~','~','~','~','~','~','~','~','~'},
		{'B','~','~','~','~','~','~','~','~','~','~'},
		{'C','~','~','~','~','~','~','~','~','~','~'},
		{'D','~','~','~','~','~','~','~','~','~','~'},
		{'E','~','~','~','~','~','~','~','~','~','~'},
		{'F','~','~','~','~','~','~','~','~','~','~'}, //creation of user's board
		{'G','~','~','~','~','~','~','~','~','~','~'},
		{'H','~','~','~','~','~','~','~','~','~','~'},
		{'I','~','~','~','~','~','~','~','~','~','~'},
		{'J','~','~','~','~','~','~','~','~','~','~'}
	};

	cout << endl << "----------------------------------" << endl;
	cout << "|     Welcome to Battleship      |" << endl;
	cout << "----------------------------------" << endl << endl;

	for(int i = 0; i <= 10; i++)//prints board
	{
		for(int j = 0; j <= 10; j++)
		{
			cout << board[i][j] << "  ";
		}
		cout << endl;
	}
	cout << endl;



//Ship Placement
/*-----------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Carrier--Placement--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/


while(x == 0)
{
cout << "Enter a set of coordinates (Ex. 1A, 2B, 5H) to place your ships, and an orientation (horizontal or vertical)." << endl;
	cout << "At which X-coordinate would you like to place your aircraft carrier? (Length of 5): ";
	cin >> shipLocationX;//user input for x coordinate
	if(shipLocationX == "1")//conversion of user input to coordinates
	{
			x = 1;
	}
	else if(shipLocationX == "2")
	{
			x = 2;
	}
	else if(shipLocationX == "3")
	{
			x = 3;
	}
	else if(shipLocationX == "4")
	{
			x = 4;
	}
	else if(shipLocationX == "5")
	{
			x = 5;
	}
	else if(shipLocationX == "6")
	{
			x = 6;
	}
	else if(shipLocationX == "7")
	{
			x = 7;
	}
	else if(shipLocationX == "8")
	{
			x = 8;
	}
	else if(shipLocationX == "9")
	{
			x = 9;
	}
	else if(shipLocationX == "X")
	{
			x = 10;
	}
	else
	{
		cout << "Please enter a valid X-coordinate." << endl;
			x = 0;
	}
}

while(y == 0)
{
	cout << "At which Y-coordinate would you like to place your aircraft carrier? (Length of 5): ";
	cin >> shipLocationY;//user input for y coordinate
	if(shipLocationY == "A")//conversion of user input to coordinates
	{
			y = 1;
	}
	else if(shipLocationY == "B")
	{
			y = 2;
	}
	else if(shipLocationY == "C")
	{
			y = 3;
	}
	else if(shipLocationY == "D")
	{
			y = 4;
	}
	else if(shipLocationY == "E")
	{
			y = 5;
	}
	else if(shipLocationY == "F")
	{
			y = 6;
	}
	else if(shipLocationY == "G")
	{
			y = 7;
	}
	else if(shipLocationY == "H")
	{
			y = 8;
	}
	else if(shipLocationY == "I")
	{
			y = 9;
	}
	else if(shipLocationY == "J")
	{
			y = 10;
	}
	else
	{
		cout << "Please enter a valid Y-coordinate." << endl;
			y = 0;
	}
}

while(checkerA == false)
{
	cout << "Enter an orientation for your ship (horizontal or vertical): ";
	cin >> shipOrientation;//input for orientation of ship
	cout << endl;

	if((shipOrientation == "horizontal") && ((x+4)<=11))//if the ship doesn't intersect it gets placed
	{
		for(int i = 0; i <= 4; i++)
		{
			board[y][x+i] = 'C';
		}
		checkerA = true;
	}

	else if((shipOrientation == "horizontal") && ((x+4)>11))//condition for the case of intersection
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;

	}

	else if((shipOrientation == "vertical") && ((y+4)<=11))//if the ship doesn't intersect it gets placed
	{
		for(int i = 0; i <= 4; i++)
		{
			board[y+i][x] = 'C';
		}
		checkerA = true;
	}
	else if((shipOrientation == "vertical") && ((y+4)>11))//condition for case of intersection
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;
	}
	else//case for incorrect input
	{
		cout << "Enter a correct orientation." << endl;
	}
}
cout << "The aircraft carrier was successfully placed." << endl << endl;
for(int i = 0; i <= 10; i++)//prints board
	{
		for(int j = 0; j <= 10; j++)
		{
			cout << board[i][j] << "  ";
		}
		cout << endl;
	}
	cout << endl;


/*-----------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Battleship--Placement--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/

collision = true;
while(collision == true)
{
x = 0;
y = 0;
checkerA = false;

while(x == 0)
{
cout << "Enter a set of coordinates (Ex. 1A, 2B, 5H) to place your ships, and an orientation (horizontal or vertical)." << endl;
	cout << "At which X-coordinate would you like to place your battleship? (Length of 4): ";
	cin >> shipLocationX;
	if(shipLocationX == "1")
	{
			x = 1;
	}
	else if(shipLocationX == "2")
	{
			x = 2;
	}
	else if(shipLocationX == "3")
	{
			x = 3;
	}
	else if(shipLocationX == "4")
	{
			x = 4;
	}
	else if(shipLocationX == "5")
	{
			x = 5;
	}
	else if(shipLocationX == "6")
	{
			x = 6;
	}
	else if(shipLocationX == "7")
	{
			x = 7;
	}
	else if(shipLocationX == "8")
	{
			x = 8;
	}
	else if(shipLocationX == "9")
	{
			x = 9;
	}
	else if(shipLocationX == "X")
	{
			x = 10;
	}
	else
	{
		cout << "Please enter a valid X-coordinate." << endl;
			x = 0;
	}
}

while(y == 0)
{
	cout << "At which Y-coordinate would you like to place your battleship? (Length of 4): ";
	cin >> shipLocationY;
	if(shipLocationY == "A")
	{
			y = 1;
	}
	else if(shipLocationY == "B")
	{
			y = 2;
	}
	else if(shipLocationY == "C")
	{
			y = 3;
	}
	else if(shipLocationY == "D")
	{
			y = 4;
	}
	else if(shipLocationY == "E")
	{
			y = 5;
	}
	else if(shipLocationY == "F")
	{
			y = 6;
	}
	else if(shipLocationY == "G")
	{
			y = 7;
	}
	else if(shipLocationY == "H")
	{
			y = 8;
	}
	else if(shipLocationY == "I")
	{
			y = 9;
	}
	else if(shipLocationY == "J")
	{
			y = 10;
	}
	else
	{
		cout << "Please enter a valid Y-coordinate." << endl;
			y = 0;
	}
}

while(checkerA == false)
{
	cout << "Enter an orientation for your ship (horizontal or vertical): ";
	cin >> shipOrientation;
	cout << endl;

	if((shipOrientation == "horizontal") && ((x+3)<=11))
	{
		for(int i = 0; i <= 3; i++)
		{
			if(board[y][x+i] == '~')
			{
				board[y][x+i] = 'B';
				collision = false;
			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}

	else if((shipOrientation == "horizontal") && ((x+3)>11))
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;

	}

	else if((shipOrientation == "vertical") && ((y+3)<=11))
	{
		for(int i = 0; i <= 3; i++)
		{
			if(board[y+i][x] == '~')
			{
				board[y+i][x] = 'B';
				collision = false;

			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}
	else if((shipOrientation == "vertical") && ((y+3)>11))
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;
	}
	else
	{
		cout << "Enter a correct orientation." << endl;
	}
}

	if(collision == false)
	{
		cout << "The battleship was successfully placed." << endl << endl;
		board[2][0] = 'B'; //fixes replacement of B
	}
	else
	{
		cout << "There was a collision. Try a different set of coordinates or orientation." << endl << endl;

				for(int i = 0; i <= 10; i++)
				{
					for(int j = 0; j <= 10; j++)
					{
						if (board[i][j] == 'B')
						{
							board[i][j] = '~';
						}
					}
				}
		board[2][0] = 'B';

	}

for(int i = 0; i <= 10; i++)//prints board
	{
		for(int j = 0; j <= 10; j++)
		{
			cout << board[i][j] << "  ";
		}
		cout << endl;
	}
	cout << endl;

}

/*-----------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Destroyer--Placement--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/

collision = true;
while(collision == true)
{
x = 0;
y = 0;
checkerA = false;

while(x == 0)
{
cout << "Enter a set of coordinates (Ex. 1A, 2B, 5H) to place your ships, and an orientation (horizontal or vertical)." << endl;
	cout << "At which X-coordinate would you like to place your destroyer? (Length of 3): ";
	cin >> shipLocationX;
	if(shipLocationX == "1")
	{
			x = 1;
	}
	else if(shipLocationX == "2")
	{
			x = 2;
	}
	else if(shipLocationX == "3")
	{
			x = 3;
	}
	else if(shipLocationX == "4")
	{
			x = 4;
	}
	else if(shipLocationX == "5")
	{
			x = 5;
	}
	else if(shipLocationX == "6")
	{
			x = 6;
	}
	else if(shipLocationX == "7")
	{
			x = 7;
	}
	else if(shipLocationX == "8")
	{
			x = 8;
	}
	else if(shipLocationX == "9")
	{
			x = 9;
	}
	else if(shipLocationX == "X")
	{
			x = 10;
	}
	else
	{
		cout << "Please enter a valid X-coordinate." << endl;
			x = 0;
	}
}

while(y == 0)
{
	cout << "At which Y-coordinate would you like to place your destroyer? (Length of 3): ";
	cin >> shipLocationY;
	if(shipLocationY == "A")
	{
			y = 1;
	}
	else if(shipLocationY == "B")
	{
			y = 2;
	}
	else if(shipLocationY == "C")
	{
			y = 3;
	}
	else if(shipLocationY == "D")
	{
			y = 4;
	}
	else if(shipLocationY == "E")
	{
			y = 5;
	}
	else if(shipLocationY == "F")
	{
			y = 6;
	}
	else if(shipLocationY == "G")
	{
			y = 7;
	}
	else if(shipLocationY == "H")
	{
			y = 8;
	}
	else if(shipLocationY == "I")
	{
			y = 9;
	}
	else if(shipLocationY == "J")
	{
			y = 10;
	}
	else
	{
		cout << "Please enter a valid Y-coordinate." << endl;
			y = 0;
	}
}

while(checkerA == false)
{
	cout << "Enter an orientation for your ship (horizontal or vertical): ";
	cin >> shipOrientation;
	cout << endl;

	if((shipOrientation == "horizontal") && ((x+2)<=11))
	{
		for(int i = 0; i <= 2; i++)
		{
			if(board[y][x+i] == '~')
			{
				board[y][x+i] = 'D';
				collision = false;
			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}

	else if((shipOrientation == "horizontal") && ((x+2)>11))
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;

	}

	else if((shipOrientation == "vertical") && ((y+2)<=11))
	{
		for(int i = 0; i <= 2; i++)
		{
			if(board[y+i][x] == '~')
			{
				board[y+i][x] = 'D';
				collision = false;

			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}
	else if((shipOrientation == "vertical") && ((y+2)>11))
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;
	}
	else
	{
		cout << "Enter a correct orientation." << endl;
	}
}

	if(collision == false)
	{
		cout << "The destroyer was successfully placed." << endl << endl;
		board[4][0] = 'D';
	}
	else
	{
		cout << "There was a collision. Try a different set of coordinates or orientation." << endl << endl;

				for(int i = 0; i <= 10; i++)
				{
					for(int j = 0; j <= 10; j++)
					{
						if (board[i][j] == 'D')
						{
							board[i][j] = '~';
						}
					}
				}
		board[4][0] = 'D';

	}

for(int i = 0; i <= 10; i++)//prints board
	{
		for(int j = 0; j <= 10; j++)
		{
			cout << board[i][j] << "  ";
		}
		cout << endl;
	}
	cout << endl;

}

/*-----------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Submarine--Placement--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/

collision = true;
while(collision == true)
{
x = 0;
y = 0;
checkerA = false;

while(x == 0)
{
cout << "Enter a set of coordinates (Ex. 1A, 2B, 5H) to place your ships, and an orientation (horizontal or vertical)." << endl;
	cout << "At which X-coordinate would you like to place your submarine? (Length of 3): ";
	cin >> shipLocationX;
	if(shipLocationX == "1")
	{
			x = 1;
	}
	else if(shipLocationX == "2")
	{
			x = 2;
	}
	else if(shipLocationX == "3")
	{
			x = 3;
	}
	else if(shipLocationX == "4")
	{
			x = 4;
	}
	else if(shipLocationX == "5")
	{
			x = 5;
	}
	else if(shipLocationX == "6")
	{
			x = 6;
	}
	else if(shipLocationX == "7")
	{
			x = 7;
	}
	else if(shipLocationX == "8")
	{
			x = 8;
	}
	else if(shipLocationX == "9")
	{
			x = 9;
	}
	else if(shipLocationX == "X")
	{
			x = 10;
	}
	else
	{
		cout << "Please enter a valid X-coordinate." << endl;
			x = 0;
	}
}

while(y == 0)
{
	cout << "At which Y-coordinate would you like to place your submarine? (Length of 3): ";
	cin >> shipLocationY;
	if(shipLocationY == "A")
	{
			y = 1;
	}
	else if(shipLocationY == "B")
	{
			y = 2;
	}
	else if(shipLocationY == "C")
	{
			y = 3;
	}
	else if(shipLocationY == "D")
	{
			y = 4;
	}
	else if(shipLocationY == "E")
	{
			y = 5;
	}
	else if(shipLocationY == "F")
	{
			y = 6;
	}
	else if(shipLocationY == "G")
	{
			y = 7;
	}
	else if(shipLocationY == "H")
	{
			y = 8;
	}
	else if(shipLocationY == "I")
	{
			y = 9;
	}
	else if(shipLocationY == "J")
	{
			y = 10;
	}
	else
	{
		cout << "Please enter a valid Y-coordinate." << endl;
			y = 0;
	}
}

while(checkerA == false)
{
	cout << "Enter an orientation for your ship (horizontal or vertical): ";
	cin >> shipOrientation;
	cout << endl;

	if((shipOrientation == "horizontal") && ((x+2)<=11))
	{
		for(int i = 0; i <= 2; i++)
		{
			if(board[y][x+i] == '~')
			{
				board[y][x+i] = 'S';
				collision = false;
			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}

	else if((shipOrientation == "horizontal") && ((x+2)>11))
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;

	}

	else if((shipOrientation == "vertical") && ((y+2)<=11))
	{
		for(int i = 0; i <= 2; i++)
		{
			if(board[y+i][x] == '~')
			{
				board[y+i][x] = 'S';
				collision = false;

			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}
	else if((shipOrientation == "vertical") && ((y+2)>11))
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;
	}
	else
	{
		cout << "Enter a correct orientation." << endl;
	}
}

	if(collision == false)
	{
		cout << "The submarine was successfully placed." << endl << endl;

	}
	else
	{
		cout << "There was a collision. Try a different set of coordinates or orientation." << endl << endl;

				for(int i = 0; i <= 10; i++)
				{
					for(int j = 0; j <= 10; j++)
					{
						if (board[i][j] == 'S')
						{
							board[i][j] = '~';
						}
					}
				}
	}

for(int i = 0; i <= 10; i++)//prints board
	{
		for(int j = 0; j <= 10; j++)
		{
			cout << board[i][j] << "  ";
		}
		cout << endl;
	}
	cout << endl;

}

/*-----------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Patrol--Boat--Placement--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/

collision = true;
while(collision == true)
{
x = 0;
y = 0;
checkerA = false;

while(x == 0)
{
cout << "Enter a set of coordinates (Ex. 1A, 2B, 5H) to place your ships, and an orientation (horizontal or vertical)." << endl;
	cout << "At which X-coordinate would you like to place your patrol boat? (Length of 2): ";
	cin >> shipLocationX;
	if(shipLocationX == "1")
	{
			x = 1;
	}
	else if(shipLocationX == "2")
	{
			x = 2;
	}
	else if(shipLocationX == "3")
	{
			x = 3;
	}
	else if(shipLocationX == "4")
	{
			x = 4;
	}
	else if(shipLocationX == "5")
	{
			x = 5;
	}
	else if(shipLocationX == "6")
	{
			x = 6;
	}
	else if(shipLocationX == "7")
	{
			x = 7;
	}
	else if(shipLocationX == "8")
	{
			x = 8;
	}
	else if(shipLocationX == "9")
	{
			x = 9;
	}
	else if(shipLocationX == "X")
	{
			x = 10;
	}
	else
	{
		cout << "Please enter a valid X-coordinate." << endl;
			x = 0;
	}
}

while(y == 0)
{
	cout << "At which Y-coordinate would you like to place your patrol boat? (Length of 2): ";
	cin >> shipLocationY;
	if(shipLocationY == "A")
	{
			y = 1;
	}
	else if(shipLocationY == "B")
	{
			y = 2;
	}
	else if(shipLocationY == "C")
	{
			y = 3;
	}
	else if(shipLocationY == "D")
	{
			y = 4;
	}
	else if(shipLocationY == "E")
	{
			y = 5;
	}
	else if(shipLocationY == "F")
	{
			y = 6;
	}
	else if(shipLocationY == "G")
	{
			y = 7;
	}
	else if(shipLocationY == "H")
	{
			y = 8;
	}
	else if(shipLocationY == "I")
	{
			y = 9;
	}
	else if(shipLocationY == "J")
	{
			y = 10;
	}
	else
	{
		cout << "Please enter a valid Y-coordinate." << endl;
			y = 0;
	}
}

while(checkerA == false)
{
	cout << "Enter an orientation for your ship (horizontal or vertical): ";
	cin >> shipOrientation;
	cout << endl;

	if((shipOrientation == "horizontal") && ((x+1)<=11))
	{
		for(int i = 0; i <= 1; i++)
		{
			if(board[y][x+i] == '~')
			{
				board[y][x+i] = 'P';
				collision = false;
			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}

	else if((shipOrientation == "horizontal") && ((x+1)>11))
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;

	}

	else if((shipOrientation == "vertical") && ((y+1)<=11))
	{
		for(int i = 0; i <= 1; i++)
		{
			if(board[y+i][x] == '~')
			{
				board[y+i][x] = 'P';
				collision = false;

			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}
	else if((shipOrientation == "vertical") && ((y+1)>11))
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;
	}
	else
	{
		cout << "Enter a correct orientation." << endl;
	}
}

	if(collision == false)
	{
		cout << "The patrol boat was successfully placed." << endl << endl;

	}
	else
	{
		cout << "There was a collision. Try a different set of coordinates or orientation." << endl << endl;

				for(int i = 0; i <= 10; i++)
				{
					for(int j = 0; j <= 10; j++)
					{
						if (board[i][j] == 'P')
						{
							board[i][j] = '~';
						}
					}
				}
	}

for(int i = 0; i <= 10; i++)//prints board
	{
		for(int j = 0; j <= 10; j++)
		{
			cout << board[i][j] << "  ";
		}
		cout << endl;
	}
	cout << endl;

}


/*-----------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Computer--Board--Generation--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/

//creation of computer board
char board2[11][11] =
	{
		{' ','1','2','3','4','5','6','7','8','9','X'},
		{'A','~','~','~','~','~','~','~','~','~','~'},
		{'B','~','~','~','~','~','~','~','~','~','~'},
		{'C','~','~','~','~','~','~','~','~','~','~'},
		{'D','~','~','~','~','~','~','~','~','~','~'},
		{'E','~','~','~','~','~','~','~','~','~','~'},
		{'F','~','~','~','~','~','~','~','~','~','~'},
		{'G','~','~','~','~','~','~','~','~','~','~'},
		{'H','~','~','~','~','~','~','~','~','~','~'},
		{'I','~','~','~','~','~','~','~','~','~','~'},
		{'J','~','~','~','~','~','~','~','~','~','~'}
	};



//Ship Placement
/*-----------------------------------------------------------------------------------------------------------------------------
-------------------------------------Computer--Carrier--Placement--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/
cout << "The computer will now generate its board. Please wait." << endl;

checkerA = false;
while(checkerA == false)
{
	x = (rand() % 10) + 1;//random generation for x coordinate
	y = (rand() % 10) + 1;//random generation for y coordinate
	w = (rand() % 2) +1; //random generation for orientation
	if(w == 1)
	{
		shipOrientation = "horizontal";
	}
	else
	{
		shipOrientation = "vertical";
	}

	if((shipOrientation == "horizontal") && ((x+4)<=11))
	{
		for(int i = 0; i <= 4; i++)
		{
			board2[y][x+i] = 'C';
		}
		checkerA = true;
	}

	else if((shipOrientation == "horizontal") && ((x+4)>11))
	{
		cout << "";

	}

	else if((shipOrientation == "vertical") && ((y+4)<=11))
	{
		for(int i = 0; i <= 4; i++)
		{
			board2[y+i][x] = 'C';
		}
		checkerA = true;
	}
	else if((shipOrientation == "vertical") && ((y+4)>11))
	{
		cout << "";
	}
	else
	{
		cout << "";
	}
}

/*-----------------------------------------------------------------------------------------------------------------------------
----------------------------------Computer--Battleship--Placement--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/

collision = true;
while(collision == true)
{

checkerA = false;

while(checkerA == false)
{
	x = (rand() % 10) + 1;
	y = (rand() % 10) + 1;
	w = (rand() % 2) +1;

	if(w == 1)
	{
		shipOrientation = "horizontal";
	}
	else
	{
		shipOrientation = "vertical";
	}

	if((shipOrientation == "horizontal") && ((x+3)<=11))
	{
		for(int i = 0; i <= 3; i++)
		{
			if(board2[y][x+i] == '~')
			{
				board2[y][x+i] = 'B';
				collision = false;
			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}

	else if((shipOrientation == "horizontal") && ((x+3)>11))
	{
		cout << "" ;

	}

	else if((shipOrientation == "vertical") && ((y+3)<=11))
	{
		for(int i = 0; i <= 3; i++)
		{
			if(board2[y+i][x] == '~')
			{
				board2[y+i][x] = 'B';
				collision = false;

			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}
	else if((shipOrientation == "vertical") && ((y+3)>11))
	{
		cout << "" ;
	}
	else
	{
		cout << "";
	}
}

	if(collision == false)
	{
		cout << "";
		board2[2][0] = 'B';
	}
	else
	{
		cout << "";

				for(int i = 0; i <= 10; i++)
				{
					for(int j = 0; j <= 10; j++)
					{
						if (board2[i][j] == 'B')
						{
							board2[i][j] = '~';
						}
					}
				}
		board2[2][0] = 'B';

	}
}

/*-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------Computer--Destroyer--Placement--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/

collision = true;
while(collision == true)
{

checkerA = false;

while(checkerA == false)
{
	x = (rand() % 10) + 1;
	y = (rand() % 10) + 1;
	w = (rand() % 2) +1;

	if(w == 1)
	{
		shipOrientation = "horizontal";
	}
	else
	{
		shipOrientation = "vertical";
	}

	if((shipOrientation == "horizontal") && ((x+2)<=11))
	{
		for(int i = 0; i <= 2; i++)
		{
			if(board2[y][x+i] == '~')
			{
				board2[y][x+i] = 'D';
				collision = false;
			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}

	else if((shipOrientation == "horizontal") && ((x+2)>11))
	{
		cout << "";

	}

	else if((shipOrientation == "vertical") && ((y+2)<=11))
	{
		for(int i = 0; i <= 2; i++)
		{
			if(board2[y+i][x] == '~')
			{
				board2[y+i][x] = 'D';
				collision = false;

			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}
	else if((shipOrientation == "vertical") && ((y+2)>11))
	{
		cout << "";
	}
	else
	{
		cout << "";
	}
}

	if(collision == false)
	{
		board2[4][0] = 'D';
	}
	else
	{
		cout << "";

				for(int i = 0; i <= 10; i++)
				{
					for(int j = 0; j <= 10; j++)
					{
						if (board2[i][j] == 'D')
						{
							board2[i][j] = '~';
						}
					}
				}
		board2[4][0] = 'D';

	}
}

/*-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------Computer--Submarine--Placement--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/

collision = true;
while(collision == true)
{

checkerA = false;

while(checkerA == false)
{
	x = (rand() % 10) + 1;
	y = (rand() % 10) + 1;
	w = (rand() % 2) +1;

	if(w == 1)
	{
		shipOrientation = "horizontal";
	}
	else
	{
		shipOrientation = "vertical";
	}

	if((shipOrientation == "horizontal") && ((x+2)<=11))
	{
		for(int i = 0; i <= 2; i++)
		{
			if(board2[y][x+i] == '~')
			{
				board2[y][x+i] = 'S';
				collision = false;
			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}

	else if((shipOrientation == "horizontal") && ((x+2)>11))
	{
		cout << "" ;

	}

	else if((shipOrientation == "vertical") && ((y+2)<=11))
	{
		for(int i = 0; i <= 2; i++)
		{
			if(board2[y+i][x] == '~')
			{
				board2[y+i][x] = 'S';
				collision = false;

			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}
	else if((shipOrientation == "vertical") && ((y+2)>11))
	{
		cout << "";
	}
	else
	{
		cout << "";
	}
}

	if(collision == false)
	{
		cout << "";

	}
	else
	{
		cout << "";

				for(int i = 0; i <= 10; i++)
				{
					for(int j = 0; j <= 10; j++)
					{
						if (board2[i][j] == 'S')
						{
							board2[i][j] = '~';
						}
					}
				}
	}
}

/*-----------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Patrol--Boat--Placement--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/

collision = true;
while(collision == true)
{

checkerA = false;

while(checkerA == false)
{
	x = (rand() % 10) + 1;
	y = (rand() % 10) + 1;
	w = (rand() % 2) +1;

	if(w == 1)
	{
		shipOrientation = "horizontal";
	}
	else
	{
		shipOrientation = "vertical";
	}

	if((shipOrientation == "horizontal") && ((x+1)<=11))
	{
		for(int i = 0; i <= 1; i++)
		{
			if(board2[y][x+i] == '~')
			{
				board2[y][x+i] = 'P';
				collision = false;
			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}

	else if((shipOrientation == "horizontal") && ((x+1)>11))
	{
		cout << "";

	}

	else if((shipOrientation == "vertical") && ((y+1)<=11))
	{
		for(int i = 0; i <= 1; i++)
		{
			if(board2[y+i][x] == '~')
			{
				board2[y+i][x] = 'P';
				collision = false;

			}
			else
			{
				collision = true;
				break;
			}
		}
		checkerA = true;
	}
	else if((shipOrientation == "vertical") && ((y+1)>11))
	{
		cout << "";
	}
	else
	{
		cout << "";
	}
}

	if(collision == false)
	{
		cout << "";

	}
	else
	{
		cout << "";

				for(int i = 0; i <= 10; i++)
				{
					for(int j = 0; j <= 10; j++)
					{
						if (board2[i][j] == 'P')
						{
							board2[i][j] = '~';
						}
					}
				}
	}

for(int i = 0; i <= 10; i++)//prints board
	{
		for(int j = 0; j <= 10; j++)
		{
			cout << board2[i][j] << "  ";  //!!!!!!!!!!! This section to print out the board is only present to prove that the
		}								   //computer can successfully randomly place ships. It would be disabled during actual gameplay
		cout << endl;
	}
	cout << endl;
}
cout << "^^^ This board is only being printed for presentation purposes, and will be disabled for a real game" << endl;
cout << "Computer board completed." << endl;

/*-----------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Actual--Gameplay--------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/

//creation of board displaying where user has fired
char board3[11][11] =
	{
		{' ','1','2','3','4','5','6','7','8','9','X'},
		{'A','~','~','~','~','~','~','~','~','~','~'},
		{'B','~','~','~','~','~','~','~','~','~','~'},
		{'C','~','~','~','~','~','~','~','~','~','~'},
		{'D','~','~','~','~','~','~','~','~','~','~'},
		{'E','~','~','~','~','~','~','~','~','~','~'},
		{'F','~','~','~','~','~','~','~','~','~','~'},
		{'G','~','~','~','~','~','~','~','~','~','~'},
		{'H','~','~','~','~','~','~','~','~','~','~'},
		{'I','~','~','~','~','~','~','~','~','~','~'},
		{'J','~','~','~','~','~','~','~','~','~','~'}
	};

cout << endl << "The game will now start. You will enter an x and y coordinate, and the program will return the result." << endl;
cout << "A hit is represented by #, and a miss is represented by *. The game is played until all of one players ships are destroyed." << endl;
cout << "You will be playing against a computer controlled opponent." << endl;


while(playerHitCounter < 17  &&  computerHitCounter < 17)//loop to check if game has been won/lost
{

//Player's Turn

cout << "Enter an x-coordinate where you want to attack (1 -> X):";
cin >> fireX; //user input for x coordinate to fire
cout << endl << "Enter a y-coordinate where you want to attack (A -> J):";
cin >> fireY; //user input for y coordinate to fire
cout << playerAttack(fireX, fireY) << endl; //use of function to fire

	if(board2[y][x] == '~')
		{
			board2[y][x] = '*'; //loop to check for a miss
			board3[y][x] = '*';
			cout << "You Missed!" << endl << endl;
		}
	else
		{
			board2[y][x] = '#'; //loop to check for a hit
			board3[y][x] = '#';
			cout << "You Hit!" << endl << endl;
			playerHitCounter++; //increment to declare when game is won/lost
		}

cout << "       Enemy's Board:" << endl;
for(int i = 0; i <= 10; i++)//prints board
	{
		for(int j = 0; j <= 10; j++)
		{
			cout << board3[i][j] << "  ";
		}
		cout << endl;
	}
	cout << endl;

//Computer's Turn


	x = (rand() % 10) + 1; //random firing for x coordinate
	y = (rand() % 10) + 1; //random firing for y coordinate
	if(board[y][x] == '~')
	{
		board[y][x] = '*';
		cout << "The Enemy Missed!" << endl << endl; //loop to check for enemy miss
		hitMarker = false;
	}
	else
	{
		board[y][x] = '#';
		cout << "The Enemy Hit!" << endl << endl; //loop to check for enemy hit
		hitMarker = true;
		computerHitCounter++;
	}
	cout << "       Your Board:" << endl;
	for(int i = 0; i <= 10; i++)//prints board
		{
			for(int j = 0; j <= 10; j++)
			{
				cout << board[i][j] << "  ";
			}
			cout << endl;
		}
	cout << endl;



}
if(playerHitCounter = 17) //declaration of win/loss after game finishes
{
	cout << endl << endl << endl << "*************************" << endl;
	cout << "You win! Congratulations!" << endl;
	cout << "*************************" << endl;
}
else
{
	cout << "You lost. Sorry!" << endl;
}

return 0;
}


