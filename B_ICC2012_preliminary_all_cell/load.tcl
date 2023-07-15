remove_design -designs

read_file -format verilog {./NFC.v}
create_clock -name "clk" -period 20 -waveform { 10 20  }  { clk  }

set_fix_multiple_port_nets -all -buffer_constants