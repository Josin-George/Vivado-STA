create_clock -period 10 [get_ports clk]
 
set_input_delay -clock clk -max 6 [get_ports d]
 
set_input_delay -clock clk -min 3 [get_ports d]
