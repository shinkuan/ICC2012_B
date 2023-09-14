remove_unconnected_ports -blast_buses [get_cells * -hier]

uplevel #0 { report_area } 
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } 
uplevel #0 { report_power -analysis_effort low } 
uplevel #0 { report_area } > ./Report_U18/Report_Area.txt 
uplevel #0 { report_power } > ./Report_U18/Report_Power.txt 
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } > ./Report_U18/Report_Timing.txt 
write -hierarchy -format verilog -output ./Report_U18/NFC_syn.v
write_sdf -version 2.1 -context verilog ./Report_U18/NFC_syn.sdf
write_sdc -version 1.5 ./Report_U18/NFC_syn.sdc