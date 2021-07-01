 class test1 extends my_test;
   `uvm_component_utils(test1)

     function new(string name, uvm_component parent);
	super.new(name, parent);
     endfunction: new
    
     task run_phase(uvm_phase phase);
	read_modify_write seq;
	seq = read_modify_write::type_id::create("seq");
	phase.raise_objection(this);
	seq.start(my_env_h.my_agent_h.my_sequencer_h);
	phase.drop_objection(this);
     endtask // run_phase
  endclass: test1

