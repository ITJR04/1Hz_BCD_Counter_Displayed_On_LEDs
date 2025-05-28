## clock
set_property PACKAGE_PIN Y9 [get_ports clk] 
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## leds
set_property PACKAGE_PIN T22 [get_ports {leds[0]}];
set_property PACKAGE_PIN T21 [get_ports {leds[1]}];  
set_property PACKAGE_PIN U22 [get_ports {leds[2]}]; 
set_property PACKAGE_PIN U21 [get_ports {leds[3]}];  
set_property IOSTANDARD LVCMOS33 [get_ports {leds[*]}]

## reset
set_property PACKAGE_PIN F22 [get_ports reset];  # "SW0"
set_property IOSTANDARD LVCMOS33 [get_ports reset]