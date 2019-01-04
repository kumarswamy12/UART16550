	class base_test extends uvm_test;

   // Factory Registration
	`uvm_component_utils(base_test)

  
         // Handles 
    		 tb envh;
        	 env_config m_tb_cfg;
        	wr_agent_config m_wr_cfg[];
		           
       		  int has_wr_agent = 1;
	         int no_of_wr_agents=2;
//////////////////////////////////  Standard UVM Methods: /////////////////////////////////////////////////////////////////

	extern function new(string name = "base_test",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void config_uart();
        
        endclass
        
////////////////////////////////////// constructor new method  //////////////////////////////////////////////////////

   	function base_test::new(string name = "base_test", uvm_component parent);
		super.new(name,parent);
	 endfunction
//----------------- function config_ram()  -------------------//

	function void base_test::config_uart();
 	   if (has_wr_agent) begin
            m_wr_cfg=new[no_of_wr_agents];
		foreach(m_wr_cfg[i])
		begin
                      m_wr_cfg[i]=wr_agent_config::type_id::create($sformatf("m_wr_cfg[%0d]",i));


         	 if(!uvm_config_db #(virtual uart_if)::get(this,"",$sformatf("vif_%0d",i),m_wr_cfg[i].vif))
		`uvm_fatal("VIF CONFIG","cannot get()interface vif from uvm_config_db. Have you set() it?")
             m_wr_cfg[i].is_active = UVM_ACTIVE;

	                m_tb_cfg.m_wr_agent_cfg[i] = m_wr_cfg[i];
                
                end 
             end

//----------------------------------------------------------------------------------------------------------//
		
			                  m_tb_cfg.has_wr_agent = has_wr_agent;
                                   		endfunction

	function void base_test::build_phase(uvm_phase phase);
                // create the config object using uvm_config_db 
	        m_tb_cfg=env_config::type_id::create("m_tb_cfg");
              if(has_wr_agent)
     m_tb_cfg.m_wr_agent_cfg=new[no_of_wr_agents];
                     // Call function 
                config_uart(); 
	uvm_config_db #(env_config)::set(this,"*","env_config",m_tb_cfg);
		// call super.build()
     		super.build();
		// create the instance for ram_envh handle
		envh=tb::type_id::create("envh", this);
			endfunction


	class uart_test extends base_test;

  
   // Factory Registration
	`uvm_component_utils(uart_test)

   // Declare the handle for  ram_single_vseq virtual sequence
         vseq seqh;
  
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "uart_test" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

//-----------------  constructor new method  -------------------//

 // Define Constructor new() function
   	function uart_test::new(string name = "uart_test" , uvm_component parent);
		super.new(name,parent);
	endfunction


//-----------------  build() phase method  -------------------//
            
	function void uart_test::build_phase(uvm_phase phase);
            super.build_phase(phase);
	endfunction


//-----------------  run() phase method  -------------------//
      	task uart_test::run_phase(uvm_phase phase);
 //raise objection
         phase.raise_objection(this);
 //create instance for sequence
          seqh=vseq::type_id::create("seqh");
 //start the sequence wrt virtual sequencer
          seqh.start(envh.vseqrh);
 //drop objection
		#1000;
         phase.drop_objection(this);
	endtask   
///////////////////////////////////
	class break_control extends base_test;

   // Factory Registration
	`uvm_component_utils(break_control)

vseq1 seqh1;
   
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "break_control" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

//-----------------  constructor new method  -------------------//

 // Define Constructor new() function
   	function break_control::new(string name = "break_control" , uvm_component parent);
		super.new(name,parent);
	endfunction


//-----------------  build() phase method  -------------------//
            
	function void break_control::build_phase(uvm_phase phase);
            super.build_phase(phase);
	endfunction


//-----------------  run() phase method  -------------------//
      	task break_control::run_phase(uvm_phase phase);
 //raise objection
         phase.raise_objection(this);
 //create instance for sequence
          seqh1=vseq1::type_id::create("seqh1");
 //start the sequence wrt virtual sequencer
          seqh1.start(envh.vseqrh);
 //drop objection
		#1000;
         phase.drop_objection(this);
	endtask   
///////////////////////////////////////////
	class break1 extends base_test;

   // Factory Registration
	`uvm_component_utils(break1)

vseq2 seqh2;
   
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "break1" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

//-----------------  constructor new method  -------------------//

 // Define Constructor new() function
   	function break1::new(string name = "break1" , uvm_component parent);
		super.new(name,parent);
	endfunction


//-----------------  build() phase method  -------------------//
            
	function void break1::build_phase(uvm_phase phase);
            super.build_phase(phase);
	endfunction


//-----------------  run() phase method  -------------------//
      	task break1::run_phase(uvm_phase phase);
 //raise objection
         phase.raise_objection(this);
 //create instance for sequence
          seqh2=vseq2::type_id::create("seqh2");
 //start the sequence wrt virtual sequencer
          seqh2.start(envh.vseqrh);
 //drop objection
		#1000;
         phase.drop_objection(this);
	endtask   
///////////////////////////////////////////*************************************************/////////////////////////////////////////
	class time_out extends base_test;

   // Factory Registration
	`uvm_component_utils(time_out)

vseq3 seqh3;
   
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "time_out" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

//-----------------  constructor new method  -------------------//

 // Define Constructor new() function
   	function time_out::new(string name = "time_out" , uvm_component parent);
		super.new(name,parent);
	endfunction


//-----------------  build() phase method  -------------------//
            
	function void time_out::build_phase(uvm_phase phase);
            super.build_phase(phase);
	endfunction


//-----------------  run() phase method  -------------------//
      	task time_out::run_phase(uvm_phase phase);
 //raise objection
         phase.raise_objection(this);
 //create instance for sequence
          seqh3=vseq3::type_id::create("seqh3");
 //start the sequence wrt virtual sequencer
          seqh3.start(envh.vseqrh);
 //drop objection
		#1000;
         phase.drop_objection(this);
	endtask   



//////////////////////////PARITY CONTROL////////////////////////////////////////////////
	class parity_control extends base_test;

   // Factory Registration
	`uvm_component_utils(parity_control)

vseq4 seqh4;
   
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "parity_control" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

//-----------------  constructor new method  -------------------//

 // Define Constructor new() function
   	function parity_control::new(string name = "parity_control" , uvm_component parent);
		super.new(name,parent);
	endfunction


//-----------------  build() phase method  -------------------//
            
	function void parity_control::build_phase(uvm_phase phase);
            super.build_phase(phase);
	endfunction


//-----------------  run() phase method  -------------------//
      	task parity_control::run_phase(uvm_phase phase);
 //raise objection
         phase.raise_objection(this);
 //create instance for sequence
          seqh4=vseq4::type_id::create("seqh4");
 //start the sequence wrt virtual sequencer
          seqh4.start(envh.vseqrh);
 //drop objection
		#1000;
         phase.drop_objection(this);
	endtask   


/////////////////////////////////////OVERUN///////////////////////////////
	class over_run extends base_test;

   // Factory Registration
	`uvm_component_utils(over_run)

vseq5 seqh5;
   
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "over_run" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
endclass

//-----------------  constructor new method  -------------------//

 // Define Constructor new() function
   	function over_run::new(string name = "over_run" , uvm_component parent);
		super.new(name,parent);
	endfunction


//-----------------  build() phase method  -------------------//
            
	function void over_run::build_phase(uvm_phase phase);
            super.build_phase(phase);
	endfunction


//-----------------  run() phase method  -------------------//
      	task over_run::run_phase(uvm_phase phase);
 //raise objection
         phase.raise_objection(this);
 //create instance for sequence
          seqh5=vseq5::type_id::create("seqh5");
 //start the sequence wrt virtual sequencer
          seqh5.start(envh.vseqrh);
 //drop objection
		#1000;
         phase.drop_objection(this);
	endtask   

