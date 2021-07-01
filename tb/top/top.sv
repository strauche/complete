// top level testbench
module top;

  import uvm_pkg::*;
  import tests_pkg::*;

  wire reset;
  wire clock;
  wire cmd;
  wire [7:0] data;
  wire [7:0] addr;
  
  dut_if dut_if1 ();
  
  // instantiate DUT
  dut dut1 (.*);

  //assign dut1.clock = dut_if1.clock;
  assign dut1.reset = dut_if1.reset;
  assign dut1.clock = dut_if1.clock;
  assign dut1.cmd   = dut_if1.cmd;
  assign dut1.addr  = dut_if1.addr;
  assign dut1.data  = dut_if1.data;

  // Clock and reset generator
  initial
  begin
    dut_if1.clock = 0;
    forever #5 dut_if1.clock = ~dut_if1.clock;
  end

  initial
  begin
    dut_if1.reset = 1;
    repeat(3) @(negedge dut_if1.clock);
    dut_if1.reset = 0;
  end

  initial
  begin: blk
     uvm_config_db #(virtual dut_if)::set(null, "uvm_test_top", "dut_vi", dut_if1);

     uvm_top.finish_on_completion  = 1;
    
     run_test();
  end

endmodule: top
