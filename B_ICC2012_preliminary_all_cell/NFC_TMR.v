`include "./NFC.v"
`include "./TMR_Simplex.v"

`timescale 1ns/100ps
module NFC_TMR(clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, A_error_ctrl, B_error_ctrl, C_error_ctrl, TMR_error);

/*===============original_NFC_copy_A IO===============*/
input A_error_ctrl,B_error_ctrl,C_error_ctrl;
output TMR_error;
wire [26:0] data_A,data_B,data_C;
wire [26:0] data_out;

/*===============original_NFC IO===============*/
input clk;
input rst;
output done;

inout [7:0] F_IO_A;
wire [7:0] F_IO_A_input;
wire [7:0] F_IO_A_output;
output F_CLE_A;
output F_ALE_A;
output F_REN_A;
output F_WEN_A;
input F_RB_A;

inout [7:0] F_IO_B;
wire [7:0] F_IO_B_input;
wire [7:0] F_IO_B_output;
output F_CLE_B;
output F_ALE_B;
output F_REN_B;
output F_WEN_B;
input F_RB_B;

wire F_IO_A_READING;
wire F_IO_B_READING;

input [3:0] KEY;

/*===============original_NFC_copy_A IO===============*/
wire OA_done;

wire [7:0] OA_F_IO_A;
wire [7:0] OA_F_IO_A_input;
wire [7:0] OA_F_IO_A_output;
wire OA_F_CLE_A;
wire OA_F_ALE_A;
wire OA_F_REN_A;
wire OA_F_WEN_A;

wire [7:0] OA_F_IO_B;
wire [7:0] OA_F_IO_B_input;
wire [7:0] OA_F_IO_B_output;
wire OA_F_CLE_B;
wire OA_F_ALE_B;
wire OA_F_REN_B;
wire OA_F_WEN_B;

wire OA_F_IO_A_READING;
wire OA_F_IO_B_READING;

/*===============original_NFC_copy_B IO===============*/
wire OB_done;

wire [7:0] OB_F_IO_A;
wire [7:0] OB_F_IO_A_input;
wire [7:0] OB_F_IO_A_output;
wire OB_F_CLE_A;
wire OB_F_ALE_A;
wire OB_F_REN_A;
wire OB_F_WEN_A;

wire [7:0] OB_F_IO_B;
wire [7:0] OB_F_IO_B_input;
wire [7:0] OB_F_IO_B_output;
wire OB_F_CLE_B;
wire OB_F_ALE_B;
wire OB_F_REN_B;
wire OB_F_WEN_B;

wire OB_F_IO_A_READING;
wire OB_F_IO_B_READING;

/*===============original_NFC_copy_C IO===============*/
wire OC_done;

wire [7:0] OC_F_IO_A;
wire [7:0] OC_F_IO_A_input;
wire [7:0] OC_F_IO_A_output;
wire OC_F_CLE_A;
wire OC_F_ALE_A;
wire OC_F_REN_A;
wire OC_F_WEN_A;

wire [7:0] OC_F_IO_B;
wire [7:0] OC_F_IO_B_input;
wire [7:0] OC_F_IO_B_output;
wire OC_F_CLE_B;
wire OC_F_ALE_B;
wire OC_F_REN_B;
wire OC_F_WEN_B;

wire OC_F_IO_A_READING;
wire OC_F_IO_B_READING;

/*===============Inout data flow===============*/
assign OA_F_IO_A_input=OA_F_IO_A;
assign OA_F_IO_A=(!OA_F_IO_A_READING)? 8'hzz:OA_F_IO_A_output;
assign OA_F_IO_A_output=F_IO_A_input;
assign OA_F_IO_B_input=OA_F_IO_B;
assign OA_F_IO_B=(!OA_F_IO_B_READING)? 8'hzz:OA_F_IO_B_output;
assign OA_F_IO_B_output=F_IO_B_input;

assign OB_F_IO_A_input=OB_F_IO_A;
assign OB_F_IO_A=(!OB_F_IO_A_READING)? 8'hzz:OB_F_IO_A_output;
assign OB_F_IO_A_output=F_IO_A_input;
assign OB_F_IO_B_input=OB_F_IO_B;
assign OB_F_IO_B=(!OB_F_IO_B_READING)? 8'hzz:OB_F_IO_B_output;
assign OB_F_IO_B_output=F_IO_B_input;

assign OC_F_IO_A_input=OC_F_IO_A;
assign OC_F_IO_A=(!OC_F_IO_A_READING)? 8'hzz:OC_F_IO_A_output;
assign OC_F_IO_A_output=F_IO_A_input;
assign OC_F_IO_B_input=OC_F_IO_B;
assign OC_F_IO_B=(!OC_F_IO_B_READING)? 8'hzz:OC_F_IO_B_output;
assign OC_F_IO_B_output=F_IO_B_input;

assign F_IO_A_input=F_IO_A;
assign F_IO_A=(F_IO_A_READING)? 8'hzz:F_IO_A_output;

assign F_IO_B_input=F_IO_B;
assign F_IO_B=(F_IO_B_READING)? 8'hzz:F_IO_B_output;


/*===============NFC_TMR IO connection===============*/
NFC OriNFC_A(clk, rst, OA_done, OA_F_IO_A, OA_F_CLE_A, OA_F_ALE_A, OA_F_REN_A, OA_F_WEN_A, F_RB_A, OA_F_IO_B, OA_F_CLE_B, OA_F_ALE_B, OA_F_REN_B, OA_F_WEN_B, F_RB_B, OA_F_IO_A_READING, OA_F_IO_B_READING, KEY);
NFC OriNFC_B(clk, rst, OB_done, OB_F_IO_A, OB_F_CLE_A, OB_F_ALE_A, OB_F_REN_A, OB_F_WEN_A, F_RB_A, OB_F_IO_B, OB_F_CLE_B, OB_F_ALE_B, OB_F_REN_B, OB_F_WEN_B, F_RB_B, OB_F_IO_A_READING, OB_F_IO_B_READING, KEY);
NFC OriNFC_C(clk, rst, OC_done, OC_F_IO_A, OC_F_CLE_A, OC_F_ALE_A, OC_F_REN_A, OC_F_WEN_A, F_RB_A, OC_F_IO_B, OC_F_CLE_B, OC_F_ALE_B, OC_F_REN_B, OC_F_WEN_B, F_RB_B, OC_F_IO_A_READING, OC_F_IO_B_READING, KEY);

assign data_A={OA_done, OA_F_IO_A_input, OA_F_CLE_A, OA_F_ALE_A, OA_F_REN_A, OA_F_WEN_A, OA_F_IO_B_input, OA_F_CLE_B, OA_F_ALE_B, OA_F_REN_B, OA_F_WEN_B, OA_F_IO_A_READING, OA_F_IO_B_READING};
assign data_B={OB_done, OB_F_IO_A_input, OB_F_CLE_A, OB_F_ALE_A, OB_F_REN_A, OB_F_WEN_A, OB_F_IO_B_input, OB_F_CLE_B, OB_F_ALE_B, OB_F_REN_B, OB_F_WEN_B, OB_F_IO_A_READING, OB_F_IO_B_READING};
assign data_C={OC_done, OC_F_IO_A_input, OC_F_CLE_A, OC_F_ALE_A, OC_F_REN_A, OC_F_WEN_A, OC_F_IO_B_input, OC_F_CLE_B, OC_F_ALE_B, OC_F_REN_B, OC_F_WEN_B, OC_F_IO_A_READING, OC_F_IO_B_READING};

TMR_Simplex TMR(data_out,TMR_error,data_A,data_B,data_C,A_error_ctrl,B_error_ctrl,C_error_ctrl,clk,rst);

assign done=data_out[26];
assign F_IO_A_output=data_out[25:18];
assign F_CLE_A=data_out[17];
assign F_ALE_A=data_out[16];
assign F_REN_A=data_out[15];
assign F_WEN_A=data_out[14];
assign F_IO_B_output=data_out[13:6];
assign F_CLE_B=data_out[5];
assign F_ALE_B=data_out[4];
assign F_REN_B=data_out[3];
assign F_WEN_B=data_out[2];
assign F_IO_A_READING=data_out[1];
assign F_IO_B_READING=data_out[0];

endmodule 