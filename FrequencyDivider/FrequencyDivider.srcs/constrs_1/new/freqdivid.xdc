create_clock -period 10.000 -name clk_in -waveform {0.000 5.000} [get_ports clk_in]
 
create_generated_clock -name CLK_OUT -source [get_ports clk_in] -divide_by 2 [get_ports clk_out]
