#include "project.h"
#include "stdio.h"
#include "string.h"
#include "math.h"

int main(void)
{
    CyGlobalIntEnable; 
        
    ADC_SAR_1_Start();//initalizing ADC
    VDAC8_1_Start();//initalizing DAC
    
    int32_t output;
    int32_t amplitude;
    int32_t average;
    int32_t sum;// running sum, zero it out each 100,000 samples
    int32_t saved_mean = 0;// gets sum/N at the end of each batch
    int64_t sum_of_sqs;// running sum of (f(n) -saved_mean)2
    int32_t min;// capture min(f(n)) reset to INT_MAX each batch
    int32_t max;// capture max(f(n)) reset to INT_MIN each batch
    int i = 0; // counter variables
    int64_t mean_sq;// Need 64 bits to avoid overflow
    int NUM_SAMPS = 100000; //at 100khz
       
    
    LCD_Char_1_Start();//initalizing lcd
    char lcdOutput[256];

    for(;;)
    {
        sum = 0; //resetting values after every main loop
        sum_of_sqs = 0;
        min = INT_MAX;
        max = INT_MIN;
              
        
        for(i = 0; i <= NUM_SAMPS; i++) //for a batch of 100,000 samples
        {
            ADC_SAR_1_IsEndConversion(ADC_SAR_1_WAIT_FOR_RESULT); //waits for input value at adc
            
            output = ADC_SAR_1_GetResult16(); //gets adc value
            
            if(output > max)
            {
                max = output;
            }
            
            if(output < min)
            {
                min = output;
            }
            
            sum_of_sqs = sum_of_sqs+ ((output - saved_mean)*(output - saved_mean)); //(f(n) - saved_mean)2
                          
                        
            VDAC8_1_SetValue(output >> 4); //sets DAC output, bit shifted from 12bit to 8bit
                                                  
            average = (max+min)/2;
            sum += output;
            
           }
            
            amplitude = (max-min)/2;
            saved_mean = sum/NUM_SAMPS;
            mean_sq = sum_of_sqs / NUM_SAMPS; // Normalize by number of samples
            mean_sq = 1000*mean_sq/(amplitude*amplitude);// Normalize amplitude,so 1.0 -> 1000
        
            
        
            LCD_Char_1_ClearDisplay(); //clears display
            LCD_Char_1_WriteControl(LCD_Char_1_CURSOR_HOME); //sets cursor to top left corner
            sprintf(lcdOutput,"m=%d", (int)min);
            LCD_Char_1_Position(0,0); 
            LCD_Char_1_PrintString(lcdOutput); //prints output
            LCD_Char_1_Position(0,6); //change position 
            
            sprintf(lcdOutput,"M=%d", (int)max);
            LCD_Char_1_PrintString(lcdOutput); //prints output
            LCD_Char_1_Position(1,0); //change position 
            
            sprintf(lcdOutput,"v=%d", (int)average);
            LCD_Char_1_PrintString(lcdOutput); //prints output
            LCD_Char_1_Position(1,7); //change position 
           
            sprintf(lcdOutput,"q=%d", (int)mean_sq); 
            LCD_Char_1_PrintString(lcdOutput); //prints output
            LCD_Char_1_Position(1,14); //change position
            
                        
            //post normalization form 1->1000
            if(1100 >= mean_sq && mean_sq >= 900)//if square wave
            {
                LCD_Char_1_PrintString("Q");
            }
            else if(600 >= mean_sq && mean_sq >= 400)//if sine wave
            {
                LCD_Char_1_PrintString("S");
            }
            else //if triangle wave
            {
                LCD_Char_1_PrintString("T");
            }
                        
            CyDelay(50);
        
    }
}


