
  class my_transaction extends uvm_sequence_item;
    `uvm_object_utils(my_transaction)
  
    rand bit cmd;
    rand int addr;
    rand int data;
  
    constraint c_addr { addr >= 0; addr < 256; }
    constraint c_data { data >= 0; data < 256; }
    
    function new (string name = "");
      super.new(name);
    endfunction: new
    
    function string convert2string;
      return $psprintf("cmd=%b, addr=%0d, data=%0d", cmd, addr, data);
    endfunction: convert2string
    /*
    function void do_copy(uvm_object rhs);
      my_transaction rhs_;
      super.do_copy(rhs);
      $cast(rhs_, rhs);
      cmd  = rhs_.cmd;
      addr = rhs_.addr;
      data = rhs_.data;
    endfunction: do_copy
    
    function bit do_compare(uvm_object rhs, uvm_comparer comparer);
      my_transaction rhs_;
      bit status = 1;
    
      status &= super.do_compare(rhs, comparer);
      $cast(rhs_, rhs);

      status &= comparer.compare_field("cmd",  cmd,  rhs_.cmd,  $bits(cmd));
      status &= comparer.compare_field("addr", addr, rhs_.addr, $bits(addr));
      status &= comparer.compare_field("data", data, rhs_.data, $bits(data));
  
      return(status);
    endfunction: do_compare
    */
  endclass: my_transaction


