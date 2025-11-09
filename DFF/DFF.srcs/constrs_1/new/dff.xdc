
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.000 -name main_clk -waveform {0.000 5.000} [get_ports clk]
