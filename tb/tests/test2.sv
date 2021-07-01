  class test2 extends my_test;
     `uvm_component_utils(test2)
	
     function new(string name, uvm_component parent);
	super.new(name, parent);
     endfunction: new
    
     task run_phase(uvm_phase phase);
	seq_of_commands seq;
	seq = seq_of_commands::type_id::create("seq");
	assert( seq.randomize() );
	phase.raise_objection(this);
	seq.start( my_env_h.my_agent_h.my_sequencer_h );
	phase.drop_objection(this);
     endtask: run_phase
     
  endclass: test2

