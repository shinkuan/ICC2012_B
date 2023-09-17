set_ccopt_property buffer_cells   { BUF12CK BUF1CK BUF2CK BUF3CK BUF4CK BUF6CK BUF8CK }
set_ccopt_property inverter_cells { INV12CK INV1CK INV2CK INV3CK INV4CK INV6CK INV8CK }
# set_ccopt_property clock_gating_cells { }
#set_ccopt_property use_inverters true
set_ccopt_property update_io_latency false
set_ccopt_property post_conditioning_enable_routing_eco 1
create_ccopt_clock_tree_spec
#ccopt_design -cts
ccopt_design
