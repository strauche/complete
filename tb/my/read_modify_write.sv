  class read_modify_write extends uvm_sequence #(my_transaction);
  
    `uvm_object_utils(read_modify_write)
    
    function new (string name = "");
      super.new(name);
    endfunction: new

    task body;
      my_transaction tx;
      int a;
      int d;

      tx = my_transaction::type_id::create("tx");
      start_item(tx);
      assert( tx.randomize() );
      tx.cmd = 1;
      finish_item(tx);

      a = tx.addr;      
      d = tx.data;
      ++d;

      tx = my_transaction::type_id::create("tx");
      start_item(tx);
      tx.cmd = 1;
      tx.addr = a;
      tx.data = d;
      finish_item(tx);
    endtask: body
   
  endclass: read_modify_write

