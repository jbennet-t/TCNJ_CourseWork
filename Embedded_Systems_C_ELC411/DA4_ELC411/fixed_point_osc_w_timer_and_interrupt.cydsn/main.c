#include "project.h"
    
int main(void)
{
    CyGlobalIntEnable; /* Enable global interrupts. */

    UART_Start();

    Timer_1_Start();
    Timer_2_Start();
    Timer_3_Start();
    Timer_4_Start();
    
    isr_1_Start();
    isr_2_Start();
    isr_3_Start();
    isr_4_Start();
    
    while (1)
    {
    }
}

