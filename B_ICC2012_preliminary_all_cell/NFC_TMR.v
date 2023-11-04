`timescale 1ns/100ps
`include "NFC.v"
// `include "TMR_Simplex.v"

// module NFC_TMR(clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, KEY, A_ERROR_CTRL, B_ERROR_CTRL, C_ERROR_CTRL, TMR_ERROR);
module NFC_TMR(clk, rst, done, F_IO_A_IN, F_IO_A_OUT, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_RB_A, F_IO_B_IN, F_IO_B_OUT, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, F_IO_A_READING, F_IO_B_READING, KEY);

    /*===============NFC_TMR IO===============*/
    // input A_ERROR_CTRL,B_ERROR_CTRL,C_ERROR_CTRL;
    // output TMR_ERROR;


    /*===============original_NFC IO===============*/
    input clk;
    input rst;
    output done;

    // inout [7:0] F_IO_A;
    input [7:0] F_IO_A_IN;
    output [7:0] F_IO_A_OUT;
    output F_CLE_A;
    output F_ALE_A;
    output F_REN_A;
    output F_WEN_A;
    input F_RB_A;

    inout [7:0] F_IO_B;
    input [7:0] F_IO_B_IN;
    output [7:0] F_IO_B_OUT;
    output F_CLE_B;
    output F_ALE_B;
    output F_REN_B;
    output F_WEN_B;
    input F_RB_B;

    output F_IO_A_READING;
    output F_IO_B_READING;

    input [3:0] KEY;

    /*===============original_NFC_copy_A IO===============*/
    wire OA_done;

    wire [7:0] OA_F_IO_A_IN;
    wire [7:0] OA_F_IO_A_OUT;
    wire OA_F_CLE_A;
    wire OA_F_ALE_A;
    wire OA_F_REN_A;
    wire OA_F_WEN_A;

    wire [7:0] OA_F_IO_B_IN;
    wire [7:0] OA_F_IO_B_OUT;
    wire OA_F_CLE_B;
    wire OA_F_ALE_B;
    wire OA_F_REN_B;
    wire OA_F_WEN_B;

    wire OA_F_IO_A_READING;
    wire OA_F_IO_B_READING;

    /*===============original_NFC_copy_B IO===============*/
    wire OB_done;

    wire [7:0] OB_F_IO_A_IN;
    wire [7:0] OB_F_IO_A_OUT;
    wire OB_F_CLE_A;
    wire OB_F_ALE_A;
    wire OB_F_REN_A;
    wire OB_F_WEN_A;

    wire [7:0] OB_F_IO_B_IN;
    wire [7:0] OB_F_IO_B_OUT;
    wire OB_F_CLE_B;
    wire OB_F_ALE_B;
    wire OB_F_REN_B;
    wire OB_F_WEN_B;

    wire OB_F_IO_A_READING;
    wire OB_F_IO_B_READING;

    /*===============original_NFC_copy_C IO===============*/
    wire OC_done;

    wire [7:0] OC_F_IO_A_IN;
    wire [7:0] OC_F_IO_A_OUT;
    wire OC_F_CLE_A;
    wire OC_F_ALE_A;
    wire OC_F_REN_A;
    wire OC_F_WEN_A;

    wire [7:0] OC_F_IO_B_IN;
    wire [7:0] OC_F_IO_B_OUT;
    wire OC_F_CLE_B;
    wire OC_F_ALE_B;
    wire OC_F_REN_B;
    wire OC_F_WEN_B;

    wire OC_F_IO_A_READING;
    wire OC_F_IO_B_READING;

    /*===============Inout data flow===============*/
    assign OA_F_IO_A_IN=F_IO_A_IN;
    assign OA_F_IO_B_IN=F_IO_B_IN;

    assign OB_F_IO_A_IN=F_IO_A_IN;
    assign OB_F_IO_B_IN=F_IO_B_IN;

    assign OC_F_IO_A_IN=F_IO_A_IN;
    assign OC_F_IO_B_IN=F_IO_B_IN;

    // assign F_IO_A_IN=F_IO_A;
    // assign F_IO_B_IN=F_IO_B;
    // assign F_IO_A=(F_IO_A_READING)? 8'hzz:F_IO_A_OUT;
    // assign F_IO_B=(F_IO_B_READING)? 8'hzz:F_IO_B_OUT;


    /*===============NFC_TMR IO connection===============*/
    NFC OriNFC_A(clk, rst, OA_done, OA_F_IO_A_IN, OA_F_IO_A_OUT, OA_F_CLE_A, OA_F_ALE_A, OA_F_REN_A, OA_F_WEN_A, F_RB_A, OA_F_IO_B_IN, OA_F_IO_B_OUT, OA_F_CLE_B, OA_F_ALE_B, OA_F_REN_B, OA_F_WEN_B, F_RB_B, OA_F_IO_A_READING, OA_F_IO_B_READING ,KEY);
    NFC OriNFC_B(clk, rst, OB_done, OB_F_IO_A_IN, OB_F_IO_A_OUT, OB_F_CLE_A, OB_F_ALE_A, OB_F_REN_A, OB_F_WEN_A, F_RB_A, OB_F_IO_B_IN, OB_F_IO_B_OUT, OB_F_CLE_B, OB_F_ALE_B, OB_F_REN_B, OB_F_WEN_B, F_RB_B, OB_F_IO_A_READING, OB_F_IO_B_READING ,KEY);
    NFC OriNFC_C(clk, rst, OC_done, OC_F_IO_A_IN, OC_F_IO_A_OUT, OC_F_CLE_A, OC_F_ALE_A, OC_F_REN_A, OC_F_WEN_A, F_RB_A, OC_F_IO_B_IN, OC_F_IO_B_OUT, OC_F_CLE_B, OC_F_ALE_B, OC_F_REN_B, OC_F_WEN_B, F_RB_B, OC_F_IO_A_READING, OC_F_IO_B_READING ,KEY);


    TMR_1bit TMR_done(done,OA_done,OB_done,OC_done);
    TMR_8bit TMR_F_IO_A_OUT(F_IO_A_OUT,OA_F_IO_A_OUT,OB_F_IO_A_OUT,OC_F_IO_A_OUT);
    TMR_1bit TMR_F_CLE_A(F_CLE_A,OA_F_CLE_A,OB_F_CLE_A,OC_F_CLE_A);
    TMR_1bit TMR_F_ALE_A(F_ALE_A,OA_F_ALE_A,OB_F_ALE_A,OC_F_ALE_A);
    TMR_1bit TMR_F_REN_A(F_REN_A,OA_F_REN_A,OB_F_REN_A,OC_F_REN_A);
    TMR_1bit TMR_F_WEN_A(F_WEN_A,OA_F_WEN_A,OB_F_WEN_A,OC_F_WEN_A);
    TMR_8bit TMR_F_IO_B_OUT(F_IO_B_OUT,OA_F_IO_B_OUT,OB_F_IO_B_OUT,OC_F_IO_B_OUT);
    TMR_1bit TMR_F_CLE_B(F_CLE_B,OA_F_CLE_B,OB_F_CLE_B,OC_F_CLE_B);
    TMR_1bit TMR_F_ALE_B(F_ALE_B,OA_F_ALE_B,OB_F_ALE_B,OC_F_ALE_B);
    TMR_1bit TMR_F_REN_B(F_REN_B,OA_F_REN_B,OB_F_REN_B,OC_F_REN_B);
    TMR_1bit TMR_F_WEN_B(F_WEN_B,OA_F_WEN_B,OB_F_WEN_B,OC_F_WEN_B);
    TMR_1bit TMR_F_IO_A_READING(F_IO_A_READING,OA_F_IO_A_READING,OB_F_IO_A_READING,OC_F_IO_A_READING);
    TMR_1bit TMR_F_IO_B_READING(F_IO_B_READING,OA_F_IO_B_READING,OB_F_IO_B_READING,OC_F_IO_B_READING);
endmodule

module TMR_1bit(data_out,dataA_in,dataB_in,dataC_in);
    input dataA_in,dataB_in,dataC_in;
    output data_out;

    assign data_out=(dataA_in&dataB_in)|(dataB_in&dataC_in)|(dataA_in&dataC_in);
endmodule

module TMR_8bit(data_out,dataA_in,dataB_in,dataC_in);
    input [7:0] dataA_in,dataB_in,dataC_in;
    output [7:0] data_out;

    assign data_out=(dataA_in&dataB_in)|(dataB_in&dataC_in)|(dataA_in&dataC_in);
endmodule
