
package my_pkg;
    `include "uvm_macros.svh"
    import uvm_pkg::*;

    `include "my_dut_config.sv"
    `include "my_transaction.sv"
    `include "read_modify_write.sv"
    `include "seq_of_commands.sv"
    `include "my_driver.sv"
    `include "my_monitor.sv"
    `include "my_agent.sv"
    `include "my_subscriber.sv"

endpackage: my_pkg
