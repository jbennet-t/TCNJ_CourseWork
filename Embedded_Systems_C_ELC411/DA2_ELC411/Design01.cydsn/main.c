#include "project.h"

#define VEC_SZ (32)

// Define arrays for testing, these values have been strategically
// created!  

// Once you run the code -- see if you can figure out
// what is special about them!
int16_t h_tst[] = { 2969,  3489,   6703, -5953,  -1513,   6501,    
                     649,  8741,    640, -4573,   2832, -12287,  
                   -6214, -1204,  -4640, -5577,    499,  -4050,    
                     792,  -877,   1425, 10386,  -1388,  -3142, 
                  -13044, -2026,  -3046, 10578,  -2726,   5762,  
                   -4971,  8798};

int16_t x_tst[] = { 4419,   2836,  -2124,  11797,  -1848,   7082,  
                   -3186,  -2431, -13495,  -3947,  -3463,   7262,   
                    1020,  -1699,  -1236,  14622,   -730,  10044,   
                    2481,   4532,  -1114,   8003,   5543,  -3578,  
                   -8904,    -89,  -2222,   4582,    447,  -2198,   
                    1361,   1447};
                    

// Prototype declarations    
int16_t inner_prod( int16_t *h, int16_t *x, int n );
int16_t inner_prod_asm( int16_t *h, int16_t *x, int n );


// Function:    inner_prod
// Description: Computes the inner product between two length-n arrays of
//              signed 16-bit values, with a right-shift of 16-bits.
// Inputs:      h - pointer to array of int16_t values, length n
//              x - pointer to array of int16_t values, length n
// Returns:     [x (dot) h] >> 16, as an int16_t value

int16_t inner_prod( int16_t *h, int16_t *x, int n )
{
    int i;
    int32_t sum = 0;            // initialize running sum to zero
    
    for (i = 0; i < n; ++i)
    {
        sum += (h[i] * x[i]);   // accumulate each of the 'n' product terms
    }
    sum = sum >> 16;            // right shift to normalize
    
    return (int16_t) sum;       // return value truncated to int16_t range
}

int main(void)
{
    int16_t t1;
    int16_t t2;
    int16_t t3;

    int16_t y1;
    int16_t y2;
    int16_t y3;

    for(;;)
    {
        // 'C' version
        // ===========
        
        // **** NOTE: YOU MUST:
        // insert code here to set port P0[0] to 0
        Pin_1_Write(0);
        // The time when the pin is ZERO represents how long it takes for the compiled 'C' code to run
        
        t1 = inner_prod( h_tst, x_tst, VEC_SZ );    // 'C' inner product between h and x
        t2 = inner_prod( h_tst, h_tst, VEC_SZ );    // 'C' inner product between h and h
        t3 = inner_prod( x_tst, x_tst, VEC_SZ );    // 'C' inner product between x and x
        
        // **** NOTE: YOU MUST:
        // insert code here to set port P0[0] to 1
        Pin_1_Write(1);
        // The time when the pin is ONE represents how long it takes for your assembly code to run
        
        // ASM version (uncomment to test your ASM code)
        // =============================================
        y1 = inner_prod_asm( h_tst, x_tst, VEC_SZ );   // asm inner product between h and x
        y2 = inner_prod_asm( h_tst, h_tst, VEC_SZ );   // asm inner product between h and h
        y3 = inner_prod_asm( x_tst, x_tst, VEC_SZ );   // asm inner product between x and x
    }
}

