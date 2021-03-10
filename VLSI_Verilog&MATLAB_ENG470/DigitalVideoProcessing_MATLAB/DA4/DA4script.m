% Nominal quantization step size table specified
% in JPEG standard.  Each entry corresponds to the
% colocated DCT coefficient.  For example, the 
% (1,1) entry, of 16, corresponds to the DC coefficient
% and the (8,8) entry, of 99, corresponds to the maximum
% vertical & horizontal frequency pattern
Q_table = [
        16  11  10  16  24  40  51  61
        12  12  14  19  26  58  60  55
        14  13  16  24  40  57  69  56
        14  17  22  29  51  87  80  62
        18  22  37  56  68  109 103 77
        24  35  55  64  81  104 113 92
        49  64  78  87  103 121 120 101
        72  92  95  98  112 100 103 99];


% Get 8-point DCT matrix, A, by:
A = dct(eye(8));

im  = imread( 'testimage.bmp' );   % read input file
yuv = rgb2ycbcr( im );          % convert to Y Cb Cr
y   = yuv(:,:,1);               % get luma component

for i = 0:44
    for j = 0:79
        BLK_IDX_V = i;                  % Select block row
        BLK_IDX_H = j;                   % Select block column

%%%%%%%%%%%%% Lossy Processing, Block Pipeline %%%%%%%%%%%%

% Extract an 8x8 block of luma data
X_block  = y(BLK_IDX_V*8+1:BLK_IDX_V*8+8, BLK_IDX_H*8+1:BLK_IDX_H*8+8 );
X_block  = double(X_block);     % Convert to double for further processing

C_block  = X_block * A.';               % Forward DCT - transpose of A * Xblock
Cq_block = round(C_block/Q_table);    %quantize, Cq = Round({Cij}/{Qij})
Ctilde_block = Cq_block * Q_table;         %dequantize, Cq~ = (Cqij X Qij)
Xtilde_block = A.' * Ctilde_block * A;         %2d inverse transform, (rows and columns) % X~ = A'(Cq~)A
                                       
Xtilde_block = round(Xtilde_block);   % Pixel values are stored as int’s
err  = X_block(:) - Xtilde_block(:);  % Compute error due to lossy proc.
mse  = sum(err' * err)/64;            % Compute block MSE
psnr = 10 * log10((255.^2)/MSE);                 % Compute block PSNR
H(i+1,j+1) = psnr;
    end
end
mesh(H);
