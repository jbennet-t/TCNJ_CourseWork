# THIS FILE IS AUTOMATICALLY GENERATED
# Project: C:\Users\sinow\Documents\PSoC Creator\Lab4\Design01.cydsn\Design01.cyprj
# Date: Tue, 22 Oct 2019 12:59:27 GMT
#set_units -time ns
create_clock -name {Clock_1(routed)} -period 10000 -waveform {0 5000} [list [get_pins {ClockBlock/dclk_0}]]
create_clock -name {CyILO} -period 1000000 -waveform {0 500000} [list [get_pins {ClockBlock/ilo}] [get_pins {ClockBlock/clk_100k}] [get_pins {ClockBlock/clk_1k}] [get_pins {ClockBlock/clk_32k}]]
create_clock -name {CyIMO} -period 333.33333333333331 -waveform {0 166.666666666667} [list [get_pins {ClockBlock/imo}]]
create_clock -name {CyPLL_OUT} -period 41.666666666666664 -waveform {0 20.8333333333333} [list [get_pins {ClockBlock/pllout}]]
create_clock -name {CyMASTER_CLK} -period 41.666666666666664 -waveform {0 20.8333333333333} [list [get_pins {ClockBlock/clk_sync}]]
create_generated_clock -name {CyBUS_CLK} -source [get_pins {ClockBlock/clk_sync}] -edges {1 2 3} [list [get_pins {ClockBlock/clk_bus_glb}]]
create_generated_clock -name {ADC_SAR_1_theACLK} -source [get_pins {ClockBlock/clk_sync}] -edges {1 3 5} [list [get_pins {ClockBlock/aclk_glb_0}]]
create_generated_clock -name {Clock_1} -source [get_pins {ClockBlock/clk_sync}] -edges {1 241 481} [list [get_pins {ClockBlock/dclk_glb_0}]]


# Component constraints for C:\Users\sinow\Documents\PSoC Creator\Lab4\Design01.cydsn\TopDesign\TopDesign.cysch
# Project: C:\Users\sinow\Documents\PSoC Creator\Lab4\Design01.cydsn\Design01.cyprj
# Date: Tue, 22 Oct 2019 12:59:18 GMT
