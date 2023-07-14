`timescale 1ns/100ps
module NFC(clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B);
    input clk;
    input rst;
    output done;

    inout [7:0] F_IO_A;
    output reg F_CLE_A;
    output reg F_ALE_A;
    output reg F_REN_A;
    output reg F_WEN_A;
    input  F_RB_A;

    inout [7:0] F_IO_B;
    output reg F_CLE_B;
    output reg F_ALE_B;
    output reg F_REN_B;
    output reg F_WEN_B;
    input  F_RB_B;


wire [7:0] F_IO_A_IN;
reg  [7:0] F_IO_A_OUT;
reg        F_IO_A_READING;

reg [3:0] state;
reg [8:0] page;     //Total of 512 pages, 9 bit.
reg [1:0] state_address;
reg       state_command;



//FSM States
localparam STATE_READ_COMMAND = 4'd0;
localparam STATE_READ_ADDRESS = 4'd1;
localparam STATE_READ_READING = 4'd2;

localparam STATE_READ_COMMAND_0 = 1'b0;
localparam STATE_READ_COMMAND_1 = 1'b1;

localparam STATE_READ_ADDRESS_0 = 2'd0;
localparam STATE_READ_ADDRESS_1 = 2'd1;
localparam STATE_READ_ADDRESS_2 = 2'd2;

assign F_IO_A = F_IO_A_READING ? 8'hZZ : F_IO_A_OUT;
assign F_IO_A = F_IO_A_IN;

always @(posedge clk) begin
    if (rst) begin
        F_IO_A_READING <= 0;

        state         <= STATE_READ_COMMAND;
        state_address <= STATE_READ_ADDRESS_0;
        state_command <= STATE_READ_COMMAND_0;
        page    <= 0;

        F_CLE_A <= 1;
        F_WEN_A <= 1;
        F_ALE_A <= 0;
        F_REN_A <= 1;
    end else begin
        case (state)
            STATE_READ_COMMAND: begin
                // F_CLE_A <= 1;
                // F_ALE_A <= 0;
                if (F_WEN_A) begin
                    F_WEN_A <= 0;
                    case (state_command)
                        STATE_READ_COMMAND_0: begin
                            state_command <= STATE_READ_COMMAND_1;
                        end
                        STATE_READ_COMMAND_1: begin
                            state_command <= STATE_READ_COMMAND_0;
                            state <= STATE_READ_ADDRESS;
                            F_CLE_A <= 0;
                            F_ALE_A <= 1;
                        end
                        default: begin
                            
                        end 
                    endcase
                end else begin
                    F_WEN_A <= 1;
                end
            end
            STATE_READ_ADDRESS: begin
                if (F_WEN_A) begin
                    F_WEN_A <= 0;
                    case (state_address)
                        STATE_READ_ADDRESS_0: begin
                            state_address <= STATE_READ_ADDRESS_1;
                        end
                        STATE_READ_ADDRESS_1: begin
                            state_address <= STATE_READ_ADDRESS_2;
                        end
                        default: begin
                            
                        end
                    endcase
                end else begin
                    F_WEN_A <= 1;
                    if (state_address == STATE_READ_ADDRESS_2) begin
                        state <= STATE_READ_READING;
                        state_address <= STATE_READ_ADDRESS_0;
                    end else begin
                        
                    end
                end
            end
            STATE_READ_READING: begin
                F_IO_A_READING <= 1;
                F_ALE_A <= 0;
                F_CLE_A <= 0;
                if (F_RB_A && F_REN_A) begin
                    F_REN_A <= 0;
                end else begin
                    F_REN_A <= 1;
                end
            end
            default: begin
                
            end
        endcase
    end
end


always @(*) begin
    case (state)
        STATE_READ_COMMAND: begin
            F_IO_A_OUT = 8'h00; //Here we use h00 instead of h01 is because we want to start at first half page.
        end
        STATE_READ_ADDRESS: begin
            case (state_address)
                STATE_READ_ADDRESS_0: begin
                    F_IO_A_OUT = 8'h00;
                end
                STATE_READ_ADDRESS_1: begin
                    F_IO_A_OUT = page[7:0];
                end
                STATE_READ_ADDRESS_2: begin
                    F_IO_A_OUT = {7'b0, page[8]};
                end
                default: begin
                    F_IO_A_OUT = 8'hXX;
                end
            endcase
        end
        STATE_READ_READING: begin
            F_IO_A_OUT = {7'b0, page[8]};
        end
        default: begin
            F_IO_A_OUT = 8'hXX;
        end
    endcase    
end


endmodule
