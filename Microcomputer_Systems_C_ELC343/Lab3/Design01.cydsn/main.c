#include "project.h"
#include "string.h"

int main(void)
{
    //initalization
    CyGlobalIntEnable; 
    LCD_Char_1_Start(); //initalizes lcd
    int i = 0; //counter for for loop
    for(;;)
    {
        
        while (Button_Read()== 1) //idle loop while waiting for button down
        {   
            
            LCD_Char_1_ClearDisplay(); //clears screen to start
            LCD_Char_1_WriteControl(LCD_Char_1_CURSOR_HOME); //sets cursor to top left corner
            LCD_Char_1_Position(0,0); //starts on first line, leftmost position
            LCD_Char_1_PrintString("My First Microcontroller");
            LCD_Char_1_Position(1,0); //starts on second line, leftmost position
            LCD_Char_1_PrintString("I/0 Console Program");
            CyDelay(1000); //waits so person can read
            for(i = 0; i <= 10; i++) //iterates through entire string buffer
            {
                LCD_Char_1_WriteControl(LCD_Char_1_DISPLAY_SCRL_LEFT); //scrolls through buffer 
                CyDelay(200);
            }
            CyDelay(1000);
            
            LCD_Char_1_ClearDisplay(); //clears screen
            LCD_Char_1_WriteControl(LCD_Char_1_CURSOR_HOME); //resets position
            LCD_Char_1_Position(0,0);
            LCD_Char_1_PrintString("Microcontroller Programmer");
            LCD_Char_1_Position(1,0);
            LCD_Char_1_PrintString("Press a switch to continue...");
            CyDelay(1000);
            for(i = 0; i <= 10; i++)
            {
                LCD_Char_1_WriteControl(LCD_Char_1_DISPLAY_SCRL_LEFT);
                CyDelay(200);
            }
            CyDelay(1000);
                        
           
            
        } 
        
        //do action on button down event
        CyDelay(100); //debounce delay
        while (Button_Read() == 0) { //idle loop waiting for button up
        LCD_Char_1_ClearDisplay();
        LCD_Char_1_Position(0,0);
        LCD_Char_1_PrintString("Program completion");
        LCD_Char_1_Position(1,0);
        LCD_Char_1_PrintString("Succeeded ");
        CyDelay(10000); 
        }
        
    }
    
    
}
