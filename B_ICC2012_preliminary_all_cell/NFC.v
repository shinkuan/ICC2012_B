`timescale 1ns/100ps
module NFC(clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, KEY);
    input clk;
    input rst;
    output reg done;

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

    input [3:0] KEY;


    /*============KEY Wire===========*/
    wire KEY_CORRECT;
 
    /*========F_IO_A Tristate========*/
    wire [7:0] F_IO_A_IN;
    reg  [7:0] F_IO_A_OUT;
    reg        F_IO_A_READING;

    assign F_IO_A = F_IO_A_READING ? 8'hZZ : F_IO_A_OUT;
    // assign F_IO_A_IN = F_IO_A;
    /*===============================*/


    /*========F_IO_B Tristate========*/
    wire [7:0] F_IO_B_IN;
    reg  [7:0] F_IO_B_OUT;
    reg        F_IO_B_READING;

    assign F_IO_B = F_IO_B_READING ? 8'hZZ : F_IO_B_OUT;
    // assign F_IO_B_IN = F_IO_B;
    /*===============================*/


    reg [4:0] state;
    reg [8:0] page;     //Total of 512 pages, 9 bit.
    reg [8:0] counter;  //Count 512.


    /*
    WARTERMARK: "PY Party"
    MD5:        "583ca420301785991e99345de37d4c5d"
    */

    /*=============FSM States=============*/
    localparam STATE_READ_COMMAND_0 = 5'd0;
    localparam STATE_READ_COMMAND_1 = 5'd1;
    localparam STATE_READ_ADDRESS_0 = 5'd2;
    localparam STATE_READ_ADDRESS_1 = 5'd3;
    localparam STATE_READ_ADDRESS_2 = 5'd4;
    localparam STATE_READ_ADDRESS_3 = 5'd5;
    localparam STATE_READ_ADDRESS_4 = 5'd6;
    localparam STATE_READ_ADDRESS_5 = 5'd7;
    localparam STATE_READ_READING_0 = 5'd8;
    localparam STATE_READ_READING_1 = 5'd9;
    localparam STATE_READ_BUSYING_0 = 5'd10;
    localparam STATE_READ_BUSYING_1 = 5'd11;
    localparam OBFUS_AUTH_0  = 5'd16;
    localparam OBFUS_AUTH_1  = 5'd17;
    localparam OBFUS_AUTH_2  = 5'd18;
    localparam OBFUS_AUTH_3  = 5'd19;
    localparam OBFUS_AUTH_4  = 5'd20;
    localparam OBFUS_AUTH_5  = 5'd21;
    localparam OBFUS_AUTH_6  = 5'd22;
    localparam OBFUS_AUTH_7  = 5'd23;
    localparam OBFUS_AUTH_8  = 5'd24 
    localparam OBFUS_AUTH_9  = 5'd25;
    localparam OBFUS_AUTH_10 = 5'd26;
    localparam OBFUS_AUTH_11 = 5'd27;
    localparam OBFUS_AUTH_12 = 5'd28;
    localparam OBFUS_AUTH_13 = 5'd29;
    localparam OBFUS_AUTH_14 = 5'd30;
    localparam OBFUS_AUTH_15 = 5'd31;
    /*====================================*/
    
    always @(posedge clk) begin
        if (rst) begin
            done <= 1'b0;

            F_IO_A_READING <= 1'b0;
            F_IO_B_READING <= 1'b0;

            // state   <= STATE_READ_COMMAND_0;
            state   <= OBFUS_AUTH_0;
            page    <= 9'd0;
            counter <= 9'd0;

            /*=====A=====*/
            F_CLE_A <= 1;
            F_WEN_A <= 0;
            F_WEN_A <= 0;
            F_ALE_A <= 0;
            F_REN_A <= 1;
            /*===========*/

            /*=====B=====*/
            F_CLE_B <= 1;
            F_WEN_B <= 0;
            F_ALE_B <= 0;
            F_REN_B <= 1;
            /*===========*/

        end
        else begin
            case (state)
                OBFUS_AUTH_0: begin
                    
                end
                STATE_READ_COMMAND_0: begin
                    /*=====A=====*/
                    F_CLE_A <= 1;
                    F_WEN_A <= 1;
                    F_ALE_A <= 0;
                    F_REN_A <= 1;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 1;
                    F_WEN_B <= 1;
                    F_ALE_B <= 0;
                    F_REN_B <= 1;
                    /*===========*/

                    state <= STATE_READ_COMMAND_1;
                end
                STATE_READ_COMMAND_1: begin
                    /*=====A=====*/
                    F_CLE_A <= 0;
                    F_WEN_A <= 0;
                    F_ALE_A <= 1;
                    F_REN_A <= 1;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 0;
                    F_WEN_B <= 0;
                    F_ALE_B <= 1;
                    F_REN_B <= 1;
                    /*===========*/

                    state <= STATE_READ_ADDRESS_0;
                end
                STATE_READ_ADDRESS_0: begin
                    /*=====A=====*/
                    F_CLE_A <= 0;
                    F_WEN_A <= 1;
                    F_ALE_A <= 1;
                    F_REN_A <= 1;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 0;
                    F_WEN_B <= 1;
                    F_ALE_B <= 1;
                    F_REN_B <= 1;
                    /*===========*/

                    state <= STATE_READ_ADDRESS_1;
                end
                STATE_READ_ADDRESS_1: begin
                    /*=====A=====*/
                    F_CLE_A <= 0;
                    F_WEN_A <= 0;
                    F_ALE_A <= 1;
                    F_REN_A <= 1;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 0;
                    F_WEN_B <= 0;
                    F_ALE_B <= 1;
                    F_REN_B <= 1;
                    /*===========*/

                    state <= STATE_READ_ADDRESS_2;
                end
                STATE_READ_ADDRESS_2: begin
                    /*=====A=====*/
                    F_CLE_A <= 0;
                    F_WEN_A <= 1;
                    F_ALE_A <= 1;
                    F_REN_A <= 1;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 0;
                    F_WEN_B <= 1;
                    F_ALE_B <= 1;
                    F_REN_B <= 1;
                    /*===========*/

                    state <= STATE_READ_ADDRESS_3;
                end
                STATE_READ_ADDRESS_3: begin
                    /*=====A=====*/
                    F_CLE_A <= 0;
                    F_WEN_A <= 0;
                    F_ALE_A <= 1;
                    F_REN_A <= 1;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 0;
                    F_WEN_B <= 0;
                    F_ALE_B <= 1;
                    F_REN_B <= 1;
                    /*===========*/

                    state <= STATE_READ_ADDRESS_4;
                end
                STATE_READ_ADDRESS_4: begin
                    /*=====A=====*/
                    F_CLE_A <= 0;
                    F_WEN_A <= 1;
                    F_ALE_A <= 1;
                    F_REN_A <= 1;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 0;
                    F_WEN_B <= 1;
                    F_ALE_B <= 1;
                    F_REN_B <= 1;
                    /*===========*/

                    state <= STATE_READ_ADDRESS_5;
                end
                STATE_READ_ADDRESS_5: begin
                    /*=====A=====*/
                    F_CLE_A <= 0;
                    F_WEN_A <= 1;
                    F_ALE_A <= 0;
                    F_REN_A <= 1;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 0;
                    F_WEN_B <= 0;
                    F_ALE_B <= 0;
                    F_REN_B <= 1;
                    /*===========*/

                    F_IO_A_READING <= 1;
                    F_IO_B_READING <= 0;

                    state <= STATE_READ_READING_0;
                end
                STATE_READ_READING_0: begin
                    if (F_RB_A && F_REN_A) begin
                        F_REN_A <= 0;
                        F_WEN_B <= 0;
                    end
                    else begin
                        if (F_WEN_B) begin
                            F_REN_A <= 1;
                            counter <= counter + 1;
                            if (counter == 9'd511) begin
                                F_CLE_A <= 1;
                                F_WEN_A <= 0;
                                F_IO_A_READING <= 0;
                                state <= STATE_READ_READING_1;
                            end
                            else begin

                            end
                        end
                        else begin

                        end
                        F_WEN_B <= 1;
                    end
                end
                STATE_READ_READING_1: begin
                    /*=====A=====*/
                    F_CLE_A <= 1;
                    F_WEN_A <= 0;
                    F_ALE_A <= 0;
                    F_REN_A <= 1;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 1;
                    F_WEN_B <= 0;
                    F_ALE_B <= 0;
                    F_REN_B <= 1;
                    /*===========*/

                    state <= STATE_READ_BUSYING_0;
                end
                STATE_READ_BUSYING_0: begin
                    /*=====B=====*/
                    F_CLE_B <= 1;
                    F_WEN_B <= 1;
                    F_ALE_B <= 0;
                    F_REN_B <= 1;
                    /*===========*/
                    if (!F_RB_B) begin
                        state <= STATE_READ_BUSYING_1;
                    end
                end
                STATE_READ_BUSYING_1: begin
                    if (F_RB_B) begin
                        /*=====B=====*/
                        F_CLE_B <= 1;
                        F_WEN_B <= 0;
                        F_ALE_B <= 0;
                        F_REN_B <= 1;
                        /*===========*/

                        page <= page + 1;
                        if (page == 9'd511) begin
                            done <= 1;
                        end

                        state <= STATE_READ_COMMAND_0;
                    end
                    else begin
                        /*=====B=====*/
                        F_CLE_B <= 0;
                        F_WEN_B <= 1;
                        F_ALE_B <= 0;
                        F_REN_B <= 1;
                        /*===========*/
                    end
                end
                default: begin

                end
            endcase
        end
    end


    always @(*) begin
        if (rst) begin
            F_IO_A_OUT = 8'h00; //Here we use h00 instead of h01 is because we want to start at first half page.
            F_IO_B_OUT = 8'h80;
        end
        else begin
            case (state[3:1])
                STATE_READ_COMMAND_0[3:1]: begin
                    F_IO_A_OUT = 8'h00;
                    F_IO_B_OUT = 8'h80;
                end
                STATE_READ_ADDRESS_0[3:1]: begin
                    F_IO_A_OUT = 8'h00;
                    F_IO_B_OUT = 8'h00;
                end
                STATE_READ_ADDRESS_2[3:1]: begin
                    F_IO_A_OUT = page[7:0];
                    F_IO_B_OUT = page[7:0];
                end
                STATE_READ_ADDRESS_4[3:1]: begin
                    F_IO_A_OUT = {7'b0, page[8]};
                    F_IO_B_OUT = {7'b0, page[8]};
                end
                STATE_READ_READING_0[3:1]: begin
                    F_IO_A_OUT = 8'h00;
                    if (state[0]) begin
                        F_IO_B_OUT = 8'h10;
                    end
                    else begin
                        F_IO_B_OUT = F_IO_A;
                    end
                end
                STATE_READ_BUSYING_0[3:1]: begin
                    F_IO_A_OUT = 8'h00;
                    F_IO_B_OUT = 8'h10;
                end
                default: begin
                    F_IO_A_OUT = 8'hXX;
                    F_IO_B_OUT = 8'hXX;
                end
            endcase
        end
    end
endmodule
