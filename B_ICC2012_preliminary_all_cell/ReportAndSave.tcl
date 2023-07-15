uplevel #0 { report_area } 
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } 
uplevel #0 { report_power -analysis_effort low } 
uplevel #0 { report_area } > ./Report/Report_Area.txt 
uplevel #0 { report_power } > ./Report/Report_Power.txt 
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } > ./Report/Report_Timing.txt 
write -hierarchy -format verilog -output ./Report/NFC_syn.v
write_sdf -version 1.0 -context verilog ./Report/NFC_syn.sdf
