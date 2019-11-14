#include "project.h"
#include <stdio.h>

//#define FLOATING_VER

#define FIXED_N         (15)
#define FIXED_M         (32-FIXED_N-1)
#define FIXED_ONE       (1<<FIXED_N)
#define FIXED_ONE_HALF  (FIXED_ONE >> 1)

#define SQR(x) ((x) * (x))

// Define w0 as PI/100

// cos(w0) ~ 1.0
// sin(w0) ~ w0, small angle approximation
#define COS_0   (FIXED_ONE)
#define SIN_0   ( (int) (FIXED_ONE * 3.1415926535897 / 100 + 0.5))

#define DCOS_0 (1.0)
#define DSIN_0 (2 * 3.1415926535897 / 100)

#ifdef FLOATING_VER
    double      dx_real = 1.0;
    double      dx_imag = 0.0;
    double      drsq;
    double      disq;
#else    
    int32_t     x_real=FIXED_ONE;   // Initial value of x (complex number) is 1+j0, in fixed point
    int32_t     x_imag=0;           // Initial value of x (complex number) is 1+j0, in fixed point
    
    int32_t     rsq;                // Holds square of real component
    int32_t     isq;                // Holds square of imag component
#endif

    int32_t     sgn_real;           // +/-1, based on x_real > 0 or < 0
    int32_t     sgn_imag;           // +/-1, based on x_imag > 0 or < 0

int main(void)
{
    int         i;
    char        msg_str[1024];
    
    CyGlobalIntEnable; /* Enable global interrupts. */
    
    UART_Start();
    
    for(i = 0; i < 400; ++i)
    {
#ifdef FLOATING_VER
        dx_real = dx_real*DCOS_0 - dx_imag*DSIN_0;
        dx_imag = dx_real*DSIN_0 + dx_imag*DCOS_0;

        sgn_real = dx_real >= 0 ? 1 : -1;                // signum of x_real
        sgn_imag = dx_imag >= 0 ? 1 : -1;                // signum of x_imag

        drsq = SQR(dx_real);
        disq = SQR(dx_imag);

        if (drsq+disq > 1.0)
        {
            dx_real -= 0.001 * sgn_real;
            dx_imag -= 0.001 * sgn_imag;
        }
        else
        {
            dx_real += 0.001 * sgn_real;
            dx_imag += 0.001 * sgn_imag;
        }
        
        sprintf( msg_str, "%5d\t%5d\n\r", (int) (dx_real*1000), (int) (dx_imag*1000) );
        UART_PutString(msg_str);
#else
        x_real = x_real*COS_0 - x_imag*SIN_0;//x_real << FIXED_N;                     // QM.N * QM.N -> Q2M.2N
        x_real = (x_real + FIXED_ONE_HALF) >> FIXED_N;  // convert back to QM.N, with rounding
        
        x_imag = x_real*SIN_0 + x_imag*COS_0;                           // QM.N * QM.N -> Q2M.2N
        x_imag = (x_imag + FIXED_ONE_HALF) >> FIXED_N;  // convert back to QM.N, with rounding
        
        sgn_real = x_real >= 0 ? 1 : -1;                // signum of x_real
        sgn_imag = x_imag >= 0 ? 1 : -1;                // signum of x_imag
        
        rsq = SQR(x_real);                              // QM.N * QM.N -> Q2M.2N
        rsq = (rsq + FIXED_ONE_HALF) >> FIXED_N;        // convert back to QM.N, with rounding
        
        isq = SQR(x_imag);                            // QM.N * QM.N -> Q2M.2N
        isq = (isq + FIXED_ONE_HALF) >> FIXED_N;        // convert back to QM.N, with rounding
        
        // The goal is for 'x' to represent a value on the unit circle, i.e. complex magnitue
        // should be unity.  Because of quantization error (which will even occur with double
        // precision, need some way of avoiding collapsing to zero, or growing to infinity
        //
        // My quick and dirty solution is to push both real and imaginary part down toward
        // zero a smidgen if the magnitude is greater than one, and away from zero otherwise 
        if (rsq+isq > FIXED_ONE)
        {
            x_real -= sgn_real;
            x_imag -= sgn_imag;
        }
        else
        {
            x_real += sgn_real;
            x_imag += sgn_imag;
        }
        
        sprintf( msg_str, "%5d\t%5d\n\r", (int) (x_real), (int) (x_imag) );
        UART_PutString(msg_str);
#endif        

    }
}

