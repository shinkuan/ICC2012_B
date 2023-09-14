remove_design -designs

read_file -format verilog {./NFC_TMR.v}
current_design NFC_TMR
create_clock -name "clk" -period 20 -waveform { 10 20  }  { clk  }
set_drive 1 [all_inputs]
set_load -pin_load 1 [all_outputs]

set_input_delay -clock clk  -max -rise 1 "{F_IO_A[6]} {F_IO_B[7]} {F_IO_B[2]} {KEY[0]} {F_IO_B[4]} {F_IO_B[6]} {F_IO_A[1]} {KEY[3]} {F_IO_A[3]} {KEY[1]} {F_IO_A[5]} clk rst F_RB_A {F_IO_A[0]} F_RB_B {F_IO_B[1]} {F_IO_A[7]} {F_IO_B[3]} {F_IO_A[2]} {F_IO_A[4]} {F_IO_B[5]} {F_IO_B[0]} {KEY[2]}"
set_input_delay -clock clk -max -fall 1 "{F_IO_A[6]} {F_IO_B[7]} {F_IO_B[2]} {KEY[0]} {F_IO_B[4]} {F_IO_B[6]} {F_IO_A[1]} {KEY[3]} {F_IO_A[3]} {KEY[1]} {F_IO_A[5]} clk rst F_RB_A {F_IO_A[0]} F_RB_B {F_IO_B[1]} {F_IO_A[7]} {F_IO_B[3]} {F_IO_A[2]} {F_IO_A[4]} {F_IO_B[5]} {F_IO_B[0]} {KEY[2]}"
set_input_delay -clock clk -min -rise 0.2 "{F_IO_A[6]} {F_IO_B[7]} {F_IO_B[2]} {KEY[0]} {F_IO_B[4]} {F_IO_B[6]} {F_IO_A[1]} {KEY[3]} {F_IO_A[3]} {KEY[1]} {F_IO_A[5]} clk rst F_RB_A {F_IO_A[0]} F_RB_B {F_IO_B[1]} {F_IO_A[7]} {F_IO_B[3]} {F_IO_A[2]} {F_IO_A[4]} {F_IO_B[5]} {F_IO_B[0]} {KEY[2]}"
set_input_delay -clock clk  -min -fall 0.2 "{F_IO_A[6]} {F_IO_B[7]} {F_IO_B[2]} {KEY[0]} {F_IO_B[4]} {F_IO_B[6]} {F_IO_A[1]} {KEY[3]} {F_IO_A[3]} {KEY[1]} {F_IO_A[5]} clk rst F_RB_A {F_IO_A[0]} F_RB_B {F_IO_B[1]} {F_IO_A[7]} {F_IO_B[3]} {F_IO_A[2]} {F_IO_A[4]} {F_IO_B[5]} {F_IO_B[0]} {KEY[2]}"

set_output_delay -clock clk  -max -rise 1 "{F_IO_A[6]} F_WEN_B {F_IO_B[7]} {F_IO_B[2]} {F_IO_B[4]} F_ALE_A F_ALE_B {F_IO_B[6]} {F_IO_A[1]} {F_IO_A[3]} done {F_IO_A[5]} {F_IO_A[0]} {F_IO_B[1]} {F_IO_A[7]} {F_IO_B[3]} F_CLE_A F_REN_A F_CLE_B F_REN_B {F_IO_A[2]} {F_IO_A[4]} {F_IO_B[5]} F_WEN_A {F_IO_B[0]}"
set_output_delay -clock clk -max -fall 1 "{F_IO_A[6]} F_WEN_B {F_IO_B[7]} {F_IO_B[2]} {F_IO_B[4]} F_ALE_A F_ALE_B {F_IO_B[6]} {F_IO_A[1]} {F_IO_A[3]} done {F_IO_A[5]} {F_IO_A[0]} {F_IO_B[1]} {F_IO_A[7]} {F_IO_B[3]} F_CLE_A F_REN_A F_CLE_B F_REN_B {F_IO_A[2]} {F_IO_A[4]} {F_IO_B[5]} F_WEN_A {F_IO_B[0]}"
set_output_delay -clock clk -min -rise 0.1 "{F_IO_A[6]} F_WEN_B {F_IO_B[7]} {F_IO_B[2]} {F_IO_B[4]} F_ALE_A F_ALE_B {F_IO_B[6]} {F_IO_A[1]} {F_IO_A[3]} done {F_IO_A[5]} {F_IO_A[0]} {F_IO_B[1]} {F_IO_A[7]} {F_IO_B[3]} F_CLE_A F_REN_A F_CLE_B F_REN_B {F_IO_A[2]} {F_IO_A[4]} {F_IO_B[5]} F_WEN_A {F_IO_B[0]}"
set_output_delay -clock clk  -min -fall 0.1 "{F_IO_A[6]} F_WEN_B {F_IO_B[7]} {F_IO_B[2]} {F_IO_B[4]} F_ALE_A F_ALE_B {F_IO_B[6]} {F_IO_A[1]} {F_IO_A[3]} done {F_IO_A[5]} {F_IO_A[0]} {F_IO_B[1]} {F_IO_A[7]} {F_IO_B[3]} F_CLE_A F_REN_A F_CLE_B F_REN_B {F_IO_A[2]} {F_IO_A[4]} {F_IO_B[5]} F_WEN_A {F_IO_B[0]}"

set_clock_latency 1 clk
set_fix_multiple_port_nets -all -buffer_constants
