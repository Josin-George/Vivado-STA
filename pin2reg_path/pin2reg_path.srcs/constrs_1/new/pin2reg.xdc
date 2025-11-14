set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk100mhz]
 
 
create_clock -period 40.000 -name sys_clk_pin -waveform {0.000 20.000} -add [get_ports clk100mhz]
set_output_delay -clock [get_clocks sys_clk_pin] -clock_fall -max 5.500 [get_ports MOSI]
set_output_delay -clock [get_clocks sys_clk_pin] -clock_fall -min -2.500 [get_ports MOSI]