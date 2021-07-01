  class my_test extends uvm_test;
    `uvm_component_utils(my_test)
    
     my_dut_config dut_config_0;
    
     my_env my_env_h;   
   
     //function new(string name = "my_test", uvm_component parent=null);
     function new(string name, uvm_component parent);
        super.new(name, parent);
     endfunction: new
    
     function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(this.get_type_name(), "start build_phase", UVM_LOW)

        dut_config_0 = new();

        if(!uvm_config_db #(virtual dut_if)::get( this, "", "dut_vi", dut_config_0.dut_vi))
          `uvm_fatal("NOVIF", "No virtual interface set")
        // other DUT configuration settings
        uvm_config_db #(my_dut_config)::set(this, "*", "dut_config", dut_config_0);

        my_env_h = my_env::type_id::create("my_env_h", this);
     endfunction: build_phase

     virtual function void end_of_elaboration_phase(uvm_phase phase);
       uvm_top.print_topology(); 
     endfunction: end_of_elaboration_phase

    //task run_phase (uvm_phase phase);
    //  uvm_top.print_topology ();
    //endtask
     
  endclass // my_test

