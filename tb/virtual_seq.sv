
class vbase_seq extends uvm_sequence #(uvm_sequence_item);

	
  // Factory registration
	`uvm_object_utils(vbase_seq) 

///////////handles 
         wr_sequencer wr_seqrh[];
   	         virtual_sequencer vsqrh;
		env_config m_cfg;


  // Declare dynamic array of Handles for all the sequences

     	extern function new(string name ="vbase_seq");
	extern task body();
	endclass 
//-----------------  constructor new method  -------------------//

 
	function vbase_seq::new(string name ="vbase_seq");
		super.new(name);
	endfunction
//-----------------  task body() method  -------------------//
 


task vbase_seq::body();
// get the config object env_config from database using uvm_config_db 
	  if(!uvm_config_db #(env_config)::get(null,get_full_name(),"env_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")

// initialize the dynamic arrays for write & read sequencers 
  wr_seqrh = new[m_cfg.no_of_wr_agents];
  
  
  assert($cast(vsqrh,m_sequencer)) else begin
    `uvm_error("BODY", "Error in $cast of virtual sequencer")
  end

 foreach(wr_seqrh[i])
  wr_seqrh[i] = vsqrh.wr_seqrh[i];
endtask: body



	class vseq extends vbase_seq;

     // Define Constructor new() function
	`uvm_object_utils(vseq)
	wr_seq1  wseq;
         wr_seq2 wseq1;

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "vseq");
	extern task body();
	endclass   
//-----------------  constructor new method  -------------------//

// Add constructor 
	function vseq::new(string name ="vseq");
		super.new(name);
	endfunction
//-----------------  task body() method  -------------------//

		task vseq::body();
                 super.body();
            	                 	wseq=wr_seq1::type_id::create("wseq");
				 wseq1=wr_seq2::type_id::create("wseq1");	
	                            //   wseq2=wr_seq3::type_id::create("wseq2");
                                 //   wseq3=wr_seq4::type_id::create("wseq3");	
		                    if(m_cfg.has_wr_agent)
						begin 
                                           // for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
						fork
                	                    		wseq.start(wr_seqrh[0]);
  							wseq1.start(wr_seqrh[1]);
                                                //	wseq2.start(wr_seqrh[0]);
  					//	wseq3.start(wr_seqrh[1]);

						join
						end
                
   

       endtask


   

	class vseq1 extends vbase_seq;

     // Define Constructor new() function
	`uvm_object_utils(vseq1)
	 wr_seq3 wseq2; 
        wr_seq4 wseq3;

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "vseq1");
	extern task body();
	endclass   
//-----------------  constructor new method  -------------------//

// Add constructor 
	function vseq1::new(string name ="vseq1");
		super.new(name);
	endfunction
//-----------------  task body() method  -------------------//

		task vseq1::body();
                 super.body();
            	                 //	wseq=wr_seq1::type_id::create("wseq");
				//	 wseq1=wr_seq2::type_id::create("wseq1");	
	                                wseq2=wr_seq3::type_id::create("wseq2");
                                    wseq3=wr_seq4::type_id::create("wseq3");	
		                    if(m_cfg.has_wr_agent)
						begin 
                                           // for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
						fork
                	                    	//	wseq.start(wr_seqrh[0]);
  						//	wseq1.start(wr_seqrh[1]);
                                                	wseq2.start(wr_seqrh[0]);
  					             	wseq3.start(wr_seqrh[1]);

						join
						end
                
   

                                  endtask


   






	class vseq2 extends vbase_seq;

     // Define Constructor new() function
	`uvm_object_utils(vseq2)
	 wr_seq5 wseq4; 
        wr_seq6 wseq5;

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "vseq2");
	extern task body();
	endclass   
//-----------------  constructor new method  -------------------//

// Add constructor 
	function vseq2::new(string name ="vseq2");
		super.new(name);
	endfunction
//-----------------  task body() method  -------------------//

		task vseq2::body();
                 super.body();
            	                 //	wseq=wr_seq1::type_id::create("wseq");
				//	 wseq1=wr_seq2::type_id::create("wseq1");	
	                                wseq4=wr_seq5::type_id::create("wseq4");
                                    wseq5=wr_seq6::type_id::create("wseq5");	
		                    if(m_cfg.has_wr_agent)
						begin 
                                           // for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
						fork
                	                    	//	wseq.start(wr_seqrh[0]);
  						//	wseq1.start(wr_seqrh[1]);
                                                	wseq4.start(wr_seqrh[0]);
  					             	wseq5.start(wr_seqrh[1]);

						join
						end
                
			endtask




///////////////////****************************////////////////////////////************************////////////////////
	class vseq3 extends vbase_seq;

     // Define Constructor new() function
	`uvm_object_utils(vseq3)
	 wr_seq7 wseq6; 
        wr_seq8 wseq7;

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "vseq3");
	extern task body();
	endclass   
//-----------------  constructor new method  -------------------//

// Add constructor 
	function vseq3::new(string name ="vseq3");
		super.new(name);
	endfunction
//-----------------  task body() method  -------------------//

		task vseq3::body();
                 super.body();
            	                 //	wseq=wr_seq1::type_id::create("wseq");
				//	 wseq1=wr_seq2::type_id::create("wseq1");	
	                                wseq6=wr_seq7::type_id::create("wseq4");
                                    wseq7=wr_seq8::type_id::create("wseq5");	
		                    if(m_cfg.has_wr_agent)
						begin 
                                           // for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
						fork
                	                    	//	wseq.start(wr_seqrh[0]);
  						//	wseq1.start(wr_seqrh[1]);
                                                	wseq6.start(wr_seqrh[0]);
  					             	wseq7.start(wr_seqrh[1]);

						join
						end
                
			endtask



///////////////////////////////////////PARITY_CONTROL///////////////////////
	class vseq4 extends vbase_seq;

     // Define Constructor new() function
	`uvm_object_utils(vseq4)
	 wr_seq9 wseq8; 
        wr_seq10 wseq9;

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "vseq4");
	extern task body();
	endclass   
//-----------------  constructor new method  -------------------//

// Add constructor 
	function vseq4::new(string name ="vseq4");
		super.new(name);
	endfunction
//-----------------  task body() method  -------------------//

		task vseq4::body();
                 super.body();
            	                 //	wseq=wr_seq1::type_id::create("wseq");
				//	 wseq1=wr_seq2::type_id::create("wseq1");	
	                                wseq8=wr_seq9::type_id::create("wseq4");
                                    wseq9=wr_seq10::type_id::create("wseq5");	
		                    if(m_cfg.has_wr_agent)
						begin 
                                           // for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
						fork
                	                    	//	wseq.start(wr_seqrh[0]);
  						//	wseq1.start(wr_seqrh[1]);
                                                	wseq8.start(wr_seqrh[0]);
  					             	wseq9.start(wr_seqrh[1]);

						join
						end
                
			endtask





//////////////////////////////////////////////////////////////////////OVERUN////////////////////////////////////


	class vseq5 extends vbase_seq;

     // Define Constructor new() function
	`uvm_object_utils(vseq5)
	 wr_seq11 wseq10; 
        wr_seq12 wseq11;

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
 	extern function new(string name = "vseq5");
	extern task body();
	endclass   
//-----------------  constructor new method  -------------------//

// Add constructor 
	function vseq5::new(string name ="vseq5");
		super.new(name);
	endfunction
//-----------------  task body() method  -------------------//

		task vseq5::body();
                 super.body();
            	                 //	wseq=wr_seq1::type_id::create("wseq");
				//	 wseq1=wr_seq2::type_id::create("wseq1");	
	                                wseq10=wr_seq11::type_id::create("wseq10");
                                    wseq11=wr_seq12::type_id::create("wseq11");	
		                    if(m_cfg.has_wr_agent)
						begin 
                                           // for (int i=0 ; i < m_cfg.no_of_wr_agents; i++)
						fork
                	                    	//	wseq.start(wr_seqrh[0]);
  						//	wseq1.start(wr_seqrh[1]);
                                                	wseq10.start(wr_seqrh[0]);
  					             	wseq11.start(wr_seqrh[1]);

						join
						end
                
			endtask




