  class seq_of_commands extends uvm_sequence #(my_transaction);
  
    `uvm_object_utils(seq_of_commands)
    `uvm_declare_p_sequencer(uvm_sequencer#(my_transaction))
    
    rand int n;
    
    constraint how_many { n inside {[2:4]}; }
    
    function new (string name = "");
      super.new(name);
    endfunction: new

    task body;
      repeat(n)
      begin
        read_modify_write seq;
        seq = read_modify_write::type_id::create("seq");
        assert( seq.randomize() );
        seq.start(p_sequencer);
      end
    endtask: body
   
  endclass: seq_of_commands
  
