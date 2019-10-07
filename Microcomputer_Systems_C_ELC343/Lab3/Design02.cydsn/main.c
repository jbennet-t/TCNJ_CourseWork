
#include "project.h"
#include "stdio.h"
#include "string.h"

int myCounter(char buttonNum, unsigned int count)//function to format and print counter data
{
    char output[256]; //char array to hold string
    
    LCD_Char_1_ClearDisplay(); //clears display
    LCD_Char_1_WriteControl(LCD_Char_1_CURSOR_HOME); //sets cursor to top left corner
    LCD_Char_1_Position(0,0); 
    LCD_Char_1_PrintString("Button "); //prints 
    LCD_Char_1_Position(0,8); //change position to account for inserting character
    LCD_Char_1_PutChar(buttonNum);
    LCD_Char_1_Position(0,10); //change position to account for next string
    LCD_Char_1_PrintString(" count");
    sprintf(output,"in hex: %08X", count); //formatting output and count for hex format
    LCD_Char_1_Position(1,0); //changing position to next line
    LCD_Char_1_PrintString(output);//printing data
    return 0;
}

int main(void)
{
    unsigned int count1=0; // count for button 1 
    unsigned int count2=0; // count for button 2
        
    CyGlobalIntEnable; 
    LCD_Char_1_Start();//initalizing lcd
    
    LED1_Write(1); //leds initially on
    LED2_Write(1); 
    
    LCD_Char_1_Position(0,0);
    LCD_Char_1_PrintString("Welcome to"); //printing welcome message
    LCD_Char_1_Position(1,0);
    LCD_Char_1_PrintString("Counting Program");
    CyDelay(2000);
    LED1_Write(0);
    LED2_Write(0); 
    LCD_Char_1_ClearDisplay();
    LCD_Char_1_Position(0,0);
    LCD_Char_1_PrintString("Push a button"); 
    LCD_Char_1_Position(1,0); //telling user to push button
    LCD_Char_1_PrintString("to count");
    CyDelay(2000);
        
    for(;;)
    {
        int b1 = 1; //initalizing button variables
        int b2 = 1;
        
        LED1_Write(0);
        LED2_Write(0);  
           
        while(((b1 = Button1_Read()) == 1) && ((b2 = Button2_Read()) == 1)){} // wait for button down event
        
              
        if (b1 == 0) //if button 1 is pressed
        {
            LED1_Write(1); //turn led1 on
            count1++; //increment counter
            myCounter('1', count1);//print data to lcd for this increment         
        }
        else //else if button 2 is pressed
        {
            LED2_Write(1); //turn led2 on
            count2++;//increment counter
            myCounter('2', count2); //print data to lcd for this increment           
        }
        CyDelay(100); //debounce delay
        
        while(Button1_Read() == 0){} // wait until button1 up
        while(Button2_Read() == 0){} // wait until button2 up
        
        CyDelay(100);//debounce delay
    }
}

