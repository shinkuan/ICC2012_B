module CHIP (
    I_clk, 
    I_rst, 
    O_done, 
    IO_F_IO_A, 
    O_F_CLE_A, 
    O_F_ALE_A, 
    O_F_REN_A, 
    O_F_WEN_A, 
    I_F_RB_A, 
    IO_F_IO_B, 
    O_F_CLE_B, 
    O_F_ALE_B, 
    O_F_REN_B, 
    O_F_WEN_B, 
    I_F_RB_B, 
    I_KEY,
    O_EMPTY
);

    inout [7:0] IO_F_IO_A;
    inout [7:0] IO_F_IO_B;
    input [3:0] I_KEY;
    input I_clk, I_rst, I_F_RB_A, I_F_RB_B;
    output O_done, O_F_CLE_A, O_F_ALE_A, O_F_REN_A, O_F_WEN_A, O_F_CLE_B, O_F_ALE_B, O_F_REN_B, O_F_WEN_B, O_EMPTY;

    wire [7:0] F_IO_A;
    wire [7:0] F_IO_B;
    wire [3:0] KEY;
    wire clk, rst, F_RB_A, F_RB_B;
    wire done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B;

    NFC_TMR NFC_CHIP( clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, 
        F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, KEY );

    // INOUT
    XMD PAD_I_F_IO_A0( .I(IO_F_IO_A[0]), .O(F_IO_A[0]) );
    XMD PAD_I_F_IO_A1( .I(IO_F_IO_A[1]), .O(F_IO_A[1]) );
    XMD PAD_I_F_IO_A2( .I(IO_F_IO_A[2]), .O(F_IO_A[2]) );
    XMD PAD_I_F_IO_A3( .I(IO_F_IO_A[3]), .O(F_IO_A[3]) );
    XMD PAD_I_F_IO_A4( .I(IO_F_IO_A[4]), .O(F_IO_A[4]) );
    XMD PAD_I_F_IO_A5( .I(IO_F_IO_A[5]), .O(F_IO_A[5]) );
    XMD PAD_I_F_IO_A6( .I(IO_F_IO_A[6]), .O(F_IO_A[6]) );
    XMD PAD_I_F_IO_A7( .I(IO_F_IO_A[7]), .O(F_IO_A[7]) );
    XMD PAD_I_F_IO_B0( .I(IO_F_IO_B[0]), .O(F_IO_B[0]) );
    XMD PAD_I_F_IO_B1( .I(IO_F_IO_B[1]), .O(F_IO_B[1]) );
    XMD PAD_I_F_IO_B2( .I(IO_F_IO_B[2]), .O(F_IO_B[2]) );
    XMD PAD_I_F_IO_B3( .I(IO_F_IO_B[3]), .O(F_IO_B[3]) );
    XMD PAD_I_F_IO_B4( .I(IO_F_IO_B[4]), .O(F_IO_B[4]) );
    XMD PAD_I_F_IO_B5( .I(IO_F_IO_B[5]), .O(F_IO_B[5]) );
    XMD PAD_I_F_IO_B6( .I(IO_F_IO_B[6]), .O(F_IO_B[6]) );
    XMD PAD_I_F_IO_B7( .I(IO_F_IO_B[7]), .O(F_IO_B[7]) );

    // INPUT
    XMD PAD_I_KEY0( .I(I_KEY[0]), .O(KEY[0]) );
    XMD PAD_I_KEY1( .I(I_KEY[1]), .O(KEY[1]) );
    XMD PAD_I_KEY2( .I(I_KEY[2]), .O(KEY[2]) );
    XMD PAD_I_KEY3( .I(I_KEY[3]), .O(KEY[3]) );
    XMD PAD_I_clk( .I(I_clk), .O(clk) );
    XMD PAD_I_rst( .I(I_rst), .O(rst) );
    XMD PAD_I_F_RB_A( .I(I_F_RB_A), .O(F_RB_A) );
    XMD PAD_I_F_RB_B( .I(I_F_RB_B), .O(F_RB_B) );

    // OUTPUT
    YA2GSD PAD_O_done( .I(done), .O(O_done), .E(1'b1) );
    YA2GSD PAD_O_F_CLE_A( .I(F_CLE_A), .O(O_F_CLE_A), .E(1'b1) );
    YA2GSD PAD_O_F_ALE_A( .I(F_ALE_A), .O(O_F_ALE_A), .E(1'b1) );
    YA2GSD PAD_O_F_REN_A( .I(F_REN_A), .O(O_F_REN_A), .E(1'b1) );
    YA2GSD PAD_O_F_WEN_A( .I(F_WEN_A), .O(O_F_WEN_A), .E(1'b1) );
    YA2GSD PAD_O_F_CLE_B( .I(F_CLE_B), .O(O_F_CLE_B), .E(1'b1) );
    YA2GSD PAD_O_F_ALE_B( .I(F_ALE_B), .O(O_F_ALE_B), .E(1'b1) );
    YA2GSD PAD_O_F_REN_B( .I(F_REN_B), .O(O_F_REN_B), .E(1'b1) );
    YA2GSD PAD_O_F_WEN_B( .I(F_WEN_B), .O(O_F_WEN_B), .E(1'b1) );
    
endmodule