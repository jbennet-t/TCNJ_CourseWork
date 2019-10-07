/*==========================================================
 Author: Jordan Sinoway
 Modified By: -
 Date: 11/28/2017

 Course: CSC-215
 File:  bproject.cpp
 Rev #: 1.1
 Description: This program is a version of the classic boardgame:
 Battleship. The user is(or should be) able to choose where to position
 ships on a game board that is represented by a 2D array. The user can
 choose "coordinates" to fire at on the game board such as A2 or F7, and
 the program will check if a ship is placed at that point, and return a
 message saying if it was hit or a miss. The hit/miss will be reflected
 by a change of symbols on the gameboard. The game is played until all
 of one of the players ships are destroyed.
 ============================================================*/

#include <iostream>
#include <string>
#include <ctime>

using namespace std;

string userInput = "";
string shipLocationX = "";
string shipLocationY = "";
string shipOrientation = "";

int x = 0;
int y = 0;
bool checkerA = false;

int main()
{

	char board[11][11] =
	{
		{' ','1','2','3','4','5','6','7','8','9','X'},
		{'A','~','~','~','~','~','~','~','~','~','~'},
		{'B','~','~','~','~','~','~','~','~','~','~'},
		{'C','~','~','~','~','~','~','~','~','~','~'},
		{'D','~','~','~','~','~','~','~','~','~','~'},
		{'E','~','~','~','~','~','~','~','~','~','~'},   //creates center/main part of board
		{'F','~','~','~','~','~','~','~','~','~','~'},
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
-------------------------------------------New--Section--Of--Code--------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------*/


while(x == 0)
{
cout << "Enter a set of coordinates (Ex. 1A, 2B, 5H) to place your ships, and an orientation (horizontal or vertical)." << endl;
	cout << "At which X-coordinate would you like to place your aircraft carrier? (Length of 5): ";
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
	cout << "At which Y-coordinate would you like to place your aircraft carrier? (Length of 5): ";
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

	if((shipOrientation == "horizontal") && ((x+4)<=11))
	{
		for(int i = 0; i <= 4; i++)
		{
			board[x+i][y] = 'S';
		}
		checkerA = true;
	}

	else if((shipOrientation == "horizontal") && ((x+4)>11))
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;

	}

	else if((shipOrientation == "vertical") && ((y+4)<=11))
	{
		for(int i = 0; i <= 4; i++)
		{
			board[x][y+i] = 'S';
		}
		checkerA = true;
	}
	else if((shipOrientation == "vertical") && ((y+4)>11))
	{
		cout << "The ship will not fit on the board in this position. Try a different orientation." << endl;
	}
	else
	{
		cout << "Enter a correct orientation." << endl;
	}
}
cout << "The aircraft carrier was successfully placed." << endl << endl;;
for(int i = 0; i <= 10; i++)//prints board
	{
		for(int j = 0; j <= 10; j++)
		{
			cout << board[i][j] << "  ";
		}
		cout << endl;
	}
	cout << endl;



/*
while(userInput =! Q)
{

}

*/
return 0;
}


