`timescale 1ns/100ps
module NFC(clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, F_IO_A_READING, F_IO_B_READING, KEY);
    input clk;
    input rst;
    output reg done;

    inout [7:0] F_IO_A;
    output reg F_CLE_A;
    output reg F_ALE_A;
    output reg F_REN_A;
    output reg F_WEN_A;
    output reg F_IO_A_READING;
    input  F_RB_A;

    inout [7:0] F_IO_B;
    output reg F_CLE_B;
    output reg F_ALE_B;
    output reg F_REN_B;
    output reg F_WEN_B;
    output reg F_IO_B_READING;
    input  F_RB_B;

    input [3:0] KEY;


    /*============KEY Wire===========*/
    localparam OFSM_KEY_0 = 4'h5;   //P
    localparam OFSM_KEY_1 = 4'h0;
    localparam OFSM_KEY_2 = 4'h5;   //Y
    localparam OFSM_KEY_3 = 4'h9;
    localparam OFSM_KEY_4 = 4'h5;   //P
    localparam OFSM_KEY_5 = 4'h0;
    localparam OFSM_KEY_6 = 4'h4;   //D
    localparam OFSM_KEY_7 = 4'h4;
    localparam WTMK_KEY = 4'b1111;
    reg WTMK_ACTIVE;
    wire KEY_CORRECT;
    wire KEY_WARTERMARK;
 
    /*========F_IO_A Tristate========*/
    wire [7:0] F_IO_A_IN;
    reg  [7:0] F_IO_A_OUT;

    assign F_IO_A = F_IO_A_READING ? 8'hZZ : F_IO_A_OUT;
    // assign F_IO_A_IN = F_IO_A;
    /*===============================*/


    /*========F_IO_B Tristate========*/
    wire [7:0] F_IO_B_IN;
    reg  [7:0] F_IO_B_OUT;

    assign F_IO_B = F_IO_B_READING ? 8'hZZ : F_IO_B_OUT;
    // assign F_IO_B_IN = F_IO_B;
    /*===============================*/


    reg [4:0] state;
    reg [8:0] page;     //Total of 512 pages, 9 bit.
    reg [8:0] counter;  //Count 512.


    /*
    WARTERMARK: "PY party" ['50', '59', '20', '70', '61', '72', '74', '79']
    MD5:        "583ca420301785991e99345de37d4c5d"
    */

    /*=============Wartermark=============*/
    localparam WARTERMARK_0 = 8'h50;
    localparam WARTERMARK_1 = 8'h59;
    localparam WARTERMARK_2 = 8'h20;
    localparam WARTERMARK_3 = 8'h70;
    localparam WARTERMARK_4 = 8'h61;
    localparam WARTERMARK_5 = 8'h72;
    localparam WARTERMARK_6 = 8'h74;
    localparam WARTERMARK_7 = 8'h79;


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
    localparam OBFUS_DUMY_0  = 5'd24;
    localparam OBFUS_DUMY_1  = 5'd25;
    localparam OBFUS_DUMY_2  = 5'd26;
    localparam OBFUS_DUMY_3  = 5'd27;
    localparam OBFUS_DUMY_4  = 5'd28;
    localparam OBFUS_DUMY_5  = 5'd29;
    localparam OBFUS_DUMY_6  = 5'd30;
    localparam OBFUS_DUMY_7  = 5'd31;
    /*====================================*/
    
    always @(posedge clk) begin
        if (rst) begin
            done <= 1'b0;
            state   <= OBFUS_AUTH_0;
            WTMK_ACTIVE <= 0;

            F_IO_A_READING <= 1'bX;
            F_IO_B_READING <= 1'bX;

            page    <= 9'bX;
            counter <= 9'bX;

            /*=====A=====*/
            F_CLE_A <= 1'bX;
            F_WEN_A <= 1'bX;
            F_WEN_A <= 1'bX;
            F_ALE_A <= 1'bX;
            F_REN_A <= 1'bX;
            /*===========*/

            /*=====B=====*/
            F_CLE_B <= 1'bX;
            F_WEN_B <= 1'bX;
            F_ALE_B <= 1'bX;
            F_REN_B <= 1'bX;
            /*===========*/
            

        end
        else begin
            case (state)
                /*Authentication Region*/
                OBFUS_AUTH_0: begin
                    F_IO_A_READING <= 1'bX;
                    F_IO_B_READING <= 1'bX;

                    page    <= 9'bX;
                    counter <= 9'bX;

                    /*=====A=====*/
                    F_CLE_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_ALE_A <= 1'bX;
                    F_REN_A <= 1'bX;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 1'bX;
                    F_WEN_B <= 1'bX;
                    F_ALE_B <= 1'bX;
                    F_REN_B <= 1'bX;
                    /*===========*/
                    if (KEY == OFSM_KEY_0) begin  //P0
                        state <= OBFUS_AUTH_1;
                    end
                    else begin
                        state <= OBFUS_DUMY_0;
                    end
                end
                OBFUS_AUTH_1: begin
                    F_IO_A_READING <= 1'bX;
                    F_IO_B_READING <= 1'bX;

                    page    <= 9'bX;
                    counter <= 9'bX;

                    /*=====A=====*/
                    F_CLE_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_ALE_A <= 1'bX;
                    F_REN_A <= 1'bX;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 1'bX;
                    F_WEN_B <= 1'bX;
                    F_ALE_B <= 1'bX;
                    F_REN_B <= 1'bX;
                    /*===========*/
                    if (KEY == OFSM_KEY_1) begin  //P1
                        state <= OBFUS_AUTH_2;
                    end
                    else begin
                        state <= OBFUS_DUMY_0;
                    end
                end
                OBFUS_AUTH_2: begin
                    F_IO_A_READING <= 1'bX;
                    F_IO_B_READING <= 1'bX;

                    page    <= 9'bX;
                    counter <= 9'bX;

                    /*=====A=====*/
                    F_CLE_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_ALE_A <= 1'bX;
                    F_REN_A <= 1'bX;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 1'bX;
                    F_WEN_B <= 1'bX;
                    F_ALE_B <= 1'bX;
                    F_REN_B <= 1'bX;
                    /*===========*/
                    if (KEY == OFSM_KEY_2) begin  //Y0
                        state <= OBFUS_AUTH_3;
                    end
                    else begin
                        state <= OBFUS_DUMY_0;
                    end
                end
                OBFUS_AUTH_3: begin
                    F_IO_A_READING <= 1'bX;
                    F_IO_B_READING <= 1'bX;

                    page    <= 9'bX;
                    counter <= 9'bX;

                    /*=====A=====*/
                    F_CLE_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_ALE_A <= 1'bX;
                    F_REN_A <= 1'bX;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 1'bX;
                    F_WEN_B <= 1'bX;
                    F_ALE_B <= 1'bX;
                    F_REN_B <= 1'bX;
                    /*===========*/
                    if (KEY == OFSM_KEY_3) begin  //Y1
                        state <= OBFUS_AUTH_4;
                    end
                    else begin
                        state <= OBFUS_DUMY_0;
                    end
                end
                OBFUS_AUTH_4: begin
                    F_IO_A_READING <= 1'bX;
                    F_IO_B_READING <= 1'bX;

                    page    <= 9'bX;
                    counter <= 9'bX;

                    /*=====A=====*/
                    F_CLE_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_ALE_A <= 1'bX;
                    F_REN_A <= 1'bX;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 1'bX;
                    F_WEN_B <= 1'bX;
                    F_ALE_B <= 1'bX;
                    F_REN_B <= 1'bX;
                    /*===========*/
                    if (KEY == OFSM_KEY_4) begin  //P0
                        state <= OBFUS_AUTH_5;
                    end
                    else begin
                        state <= OBFUS_DUMY_0;
                    end
                end
                OBFUS_AUTH_5: begin
                    F_IO_A_READING <= 1'bX;
                    F_IO_B_READING <= 1'bX;

                    page    <= 9'bX;
                    counter <= 9'bX;

                    /*=====A=====*/
                    F_CLE_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_ALE_A <= 1'bX;
                    F_REN_A <= 1'bX;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 1'bX;
                    F_WEN_B <= 1'bX;
                    F_ALE_B <= 1'bX;
                    F_REN_B <= 1'bX;
                    /*===========*/
                    if (KEY == OFSM_KEY_5) begin  //P1
                        state <= OBFUS_AUTH_6;
                    end
                    else begin
                        state <= OBFUS_DUMY_0;
                    end
                end
                OBFUS_AUTH_6: begin
                    F_IO_A_READING <= 1'bX;
                    F_IO_B_READING <= 1'bX;

                    page    <= 9'bX;
                    counter <= 9'bX;

                    /*=====A=====*/
                    F_CLE_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_WEN_A <= 1'bX;
                    F_ALE_A <= 1'bX;
                    F_REN_A <= 1'bX;
                    /*===========*/

                    /*=====B=====*/
                    F_CLE_B <= 1'bX;
                    F_WEN_B <= 1'bX;
                    F_ALE_B <= 1'bX;
                    F_REN_B <= 1'bX;
                    /*===========*/
                    if (KEY == OFSM_KEY_6) begin  //D0
                        state <= OBFUS_AUTH_7;
                    end
                    else begin
                        state <= OBFUS_DUMY_0;
                    end
                end
                OBFUS_AUTH_7: begin
                    if (KEY == OFSM_KEY_7) begin  //D1
                        //Reset registers and enter normal region
                        done <= 1'b0;

                        F_IO_A_READING <= 1'b0;
                        F_IO_B_READING <= 1'b0;

                        state <= STATE_READ_COMMAND_0;
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
                        if (KEY == WTMK_KEY) begin
                            //Wartermark mode actived.
                            state <= OBFUS_AUTH_0;
                            WTMK_ACTIVE <= 1;
                        end
                        else begin
                            state <= OBFUS_DUMY_0;
                        end
                    end
                end
                /*Dummy Region*/
                OBFUS_DUMY_0: begin
                    state <= OBFUS_DUMY_1;
                end
                OBFUS_DUMY_1: begin
                    state <= OBFUS_DUMY_0;
                end
                /*Normal Region*/
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
        if (rst | (state == OBFUS_AUTH_7)) begin
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
                        if (WTMK_ACTIVE) begin
                            case (counter[2:0])
                                3'd0: begin
                                    F_IO_B_OUT = WARTERMARK_0;
                                end 
                                3'd1: begin
                                    F_IO_B_OUT = WARTERMARK_1;
                                end 
                                3'd2: begin
                                    F_IO_B_OUT = WARTERMARK_2;
                                end 
                                3'd3: begin
                                    F_IO_B_OUT = WARTERMARK_3;
                                end 
                                3'd4: begin
                                    F_IO_B_OUT = WARTERMARK_4;
                                end 
                                3'd5: begin
                                    F_IO_B_OUT = WARTERMARK_5;
                                end 
                                3'd6: begin
                                    F_IO_B_OUT = WARTERMARK_6;
                                end 
                                3'd7: begin
                                    F_IO_B_OUT = WARTERMARK_7;
                                end 
                                default: begin
                                    F_IO_B_OUT = 3'dX;
                                end 
                            endcase
                        end
                        else begin
                            F_IO_B_OUT = F_IO_A;                            
                        end
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
