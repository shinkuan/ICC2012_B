`timescale 1ns/100ps
module TMR_Simplex
#(
	parameter DATA_LEN=8
)
(data_out,TMR_error,dataA_in,dataB_in,dataC_in,A_error_ctrl,B_error_ctrl,C_error_ctrl,clk,reset);

input [DATA_LEN-1:0]dataA_in,dataB_in,dataC_in;
input A_error_ctrl,B_error_ctrl,C_error_ctrl;
input clk,reset;

output [DATA_LEN-1:0]data_out;
output reg TMR_error;

wire [DATA_LEN-1:0]_A,_B,_C;

reg A_fault,B_fault,C_fault;
wire simplex_mode;

assign _A=(A_error_ctrl)? ~dataA_in : dataA_in;
assign _B=(B_error_ctrl)? ~dataB_in : dataB_in;
assign _C=(C_error_ctrl)? ~dataC_in : dataC_in;

assign simplex_mode=A_fault|B_fault|C_fault;

assign data_out=(_A&_B)|(_B&_C)|(_A&_C);

always@(posedge clk or posedge reset)
begin
	if(reset)
		begin
			A_fault   <= 1'b0;
			B_fault   <= 1'b0;
			C_fault   <= 1'b0;
			TMR_error <= 1'b0;
		end
	else
		begin
			A_fault   <= ((_A!=_B)&&(_A != _C)) ? 1'b1 : A_fault;
			B_fault   <= ((_A!=_B)&&(_B != _C)) ? 1'b1 : B_fault;
			C_fault   <= ((_C!=_B)&&(_A != _C)) ? 1'b1 : C_fault;
			TMR_error <= A_fault&(_B!=_C)|B_fault&(_A!=_C)|C_fault&(_A!=_B);
		end
end

endmodule 
