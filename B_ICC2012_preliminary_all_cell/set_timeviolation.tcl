set_input_delay 4 -clock clk [get_ports F_IO*]
set_output_delay 1 -clock clk [get_ports done]
set_output_delay 2 -max -clock clk [get_ports F_IO*] -add_delay
set_output_delay -1 -min -clock clk [get_ports F_IO*] -add_delay
set_output_delay -1 -min -clock clk [get_ports F_CLE*]
set_output_delay -1 -min -clock clk [get_ports F_ALE*]
set_output_delay 2 -max -clock clk [get_ports F_REN*]
set_output_delay 2 -max -clock clk [get_ports F_WEN*]
set_min_delay 1 -from [get_ports F_RB*]