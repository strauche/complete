
module dut (input wire clock, reset, cmd,
            input logic [7:0] addr, data);

  always @(posedge clock)
  begin
    $display ("DUT received cmd=%b, addr=%h, data=%h", cmd, addr, data);
  end
  
endmodule: dut

