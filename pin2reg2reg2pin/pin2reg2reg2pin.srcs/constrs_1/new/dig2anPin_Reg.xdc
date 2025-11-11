set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk100mhz]
set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports SCLK_O]
 
 
create_clock -period 40.000 -name sys_clk_pin -waveform {0.000 20.000} -add [get_ports clk100mhz]
create_generated_clock -name sclk_pin -source [get_ports clk100mhz] -divide_by 4 [get_ports SCLK_O]
 
set_input_delay -clock [get_clocks sys_clk_pin] -clock_fall -max 15.500 [get_ports MISO]
set_input_delay -clock [get_clocks sys_clk_pin] -clock_fall -min -0.500 [get_ports MISO]
