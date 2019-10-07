0x00000084 <inner_prod>:
  34: // Inputs:      h - pointer to array of int16_t values, length n
  35: //              x - pointer to array of int16_t values, length n
  36: // Returns:     [x (dot) h] >> 16, as an int16_t value
  37: int16_t inner_prod( int16_t *h, int16_t *x, int n )
  38: {
0x00000084 push	{r7}
0x00000086 sub	sp, #1c
0x00000088 add	r7, sp, #0
0x0000008A str	r0, [r7, #c]
0x0000008C str	r1, [r7, #8]
0x0000008E str	r2, [r7, #4]
  39:     int i;
  40:     int32_t sum = 0;            // initialize running sum to zero
0x00000090 movs	r3, #0
0x00000092 str	r3, [r7, #10]
  41:     
  42:     for (i = 0; i < n; ++i)
0x00000094 movs	r3, #0
0x00000096 str	r3, [r7, #14]
0x00000098 b.n	c4 <CYDEV_PICU_SIZE+0x14>
  43:     {
  44:         sum += (h[i] * x[i]);   // accumulate each of the 'n' product terms
0x0000009A ldr	r3, [r7, #14]
0x0000009C lsls	r3, r3, #1
0x0000009E ldr	r2, [r7, #c]
0x000000A0 add	r3, r2
0x000000A2 ldrsh.w	r3, [r3]
0x000000A6 mov	r1, r3
0x000000A8 ldr	r3, [r7, #14]
0x000000AA lsls	r3, r3, #1
0x000000AC ldr	r2, [r7, #8]
0x000000AE add	r3, r2
0x000000B0 ldrsh.w	r3, [r3]
0x000000B4 mul.w	r3, r3, r1
0x000000B8 ldr	r2, [r7, #10]
0x000000BA add	r3, r2
0x000000BC str	r3, [r7, #10]
  37: int16_t inner_prod( int16_t *h, int16_t *x, int n )
  38: {
  39:     int i;
  40:     int32_t sum = 0;            // initialize running sum to zero
  41:     
  42:     for (i = 0; i < n; ++i)
0x000000BE ldr	r3, [r7, #14]
0x000000C0 adds	r3, #1
0x000000C2 str	r3, [r7, #14]
0x000000C4 ldr	r2, [r7, #14]
0x000000C6 ldr	r3, [r7, #4]
0x000000C8 cmp	r2, r3
0x000000CA blt.n	9a <inner_prod+0x16>
  43:     {
  44:         sum += (h[i] * x[i]);   // accumulate each of the 'n' product terms
  45:     }
  46:     sum = sum >> 16;            // right shift to normalize
0x000000CC ldr	r3, [r7, #10]
0x000000CE asrs	r3, r3, #10
0x000000D0 str	r3, [r7, #10]
  47:     
  48:     return (int16_t) sum;       // return value truncated to int16_t range
0x000000D2 ldr	r3, [r7, #10]
0x000000D4 sxth	r3, r3
  49: }
0x000000D6 mov	r0, r3
0x000000D8 adds	r7, #1c
0x000000DA mov	sp, r7
0x000000DC pop	{r7}
0x000000DE bx	lr
