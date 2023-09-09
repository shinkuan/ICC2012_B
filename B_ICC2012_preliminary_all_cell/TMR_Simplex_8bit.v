`timescale 1ns/100ps
module TMR_Simplex_8bit(data_out,TMR_error,dataA_in,dataB_in,dataC_in,A_error_ctrl,B_error_ctrl,C_error_ctrl,clk,reset);

input [7:0]dataA_in,dataB_in,dataC_in;
input A_error_ctrl,B_error_ctrl,C_error_ctrl;
input clk,reset;

output reg [7:0]data_out;
output reg TMR_error;

wire [7:0]_A,_B,_C;

reg A_fault,B_fault,C_fault;
wire simplex_mode;

assign _A=(A_error_ctrl)? ~dataA_in : dataA_in;
assign _B=(B_error_ctrl)? ~dataB_in : dataB_in;
assign _C=(C_error_ctrl)? ~dataC_in : dataC_in;

assign simplex_mode=A_fault|B_fault|C_fault;

always@(*)
begin
	if(simplex_mode)
		if(A_fault)
		begin
			data_out=_B;
			TMR_error=(_B!=_C);
		end
		else if(B_fault)
		begin
			data_out=_C;
			TMR_error=(_A!=_C);
		end
		else
		begin
			data_out=_A;
			TMR_error=(_A!=_B);
		end
	else
		if((_A!=_B)&&(_A!=_C)&&(_B!=_C))
		begin
			data_out=(_A&_B)|(_B&_C)|(_A&_C);
			TMR_error=1'b1;
		end
		else if((_A!=_B)&&(_A!=_C))
		begin
			data_out=(_A&_B)|(_B&_C)|(_A&_C);
			TMR_error=1'b0;
		end
		else if((_A!=_C)&&(_B!=_C))
		begin
			data_out=(_A&_B)|(_B&_C)|(_A&_C);
			TMR_error=1'b0;
		end
		else 
		begin
			data_out=(_A&_B)|(_B&_C)|(_A&_C);
			TMR_error=1'b0;
		end
end

always@(posedge clk or posedge reset)
begin
	if(reset)
		begin
			A_fault<=1'b0;
			B_fault<=1'b0;
			C_fault<=1'b0;
		end
	else
		begin
			A_fault<=((_A!=_B)&&(_A!=_C))?1'b1:A_fault;
			B_fault<=((_A!=_B)&&(_B!=_C))?1'b1:B_fault;
			C_fault<=((_C!=_B)&&(_A!=_C))?1'b1:C_fault;
		end
end

endmodule 
