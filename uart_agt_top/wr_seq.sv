class wr_seq extends uvm_sequence #(wr_xtn);

`uvm_object_utils(wr_seq); 

env_config m_cfg;

extern function new(string name="wr_seq");
endclass

function wr_seq::new(string name="wr_Seq");
super.new(name);
endfunction



class wr_seq1 extends wr_seq;
`uvm_object_utils(wr_seq1); 


extern function new(string name="wr_seq1");
extern task body();

endclass

function wr_seq1::new(string name="wr_seq1");
super.new(name);
endfunction

	task wr_seq1::body();
                    
    	    
	  begin
   if(!uvm_config_db #(env_config)::get(null,get_full_name(),"env_config",m_cfg))
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 


        ////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


//////////////////////////////////////PASS THE DLV VALUE ////////////////////////////////////////////////////////////////////
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==28;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0000_0011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==m_cfg.i;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b101;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

  
/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
repeat(14)
begin
    	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1; wb_dat_i==24 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req);

	
end
//////////////////////////////////INTERRUPT identification REGISTER//////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

  get_response(req);
   
 if(req.iir[3:1]==3'b010)
begin
    $display("the value stored in iir is %b",req.iir);
   repeat(14)
begin
      start_item(req);
     assert(req.randomize() with {wb_addr_i==0;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH)
    	   finish_item(req);
		        
    end

 

end


		end
    	
    endtask



class wr_seq2 extends wr_seq;
`uvm_object_utils(wr_seq2); 


extern function new(string name="wr_seq2");
extern task body();

endclass

function wr_seq2::new(string name="wr_seq2");
super.new(name);
endfunction

	task wr_seq2::body();
    	    
	  begin


           
   
	  
   if(!uvm_config_db #(env_config)::get(null,get_full_name(),"env_config",m_cfg))
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?") 


        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   





//////////////////////////////////////PASS THE DLV VALUE //////////////////////////////////////////////////////////////////// 
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==14;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0000_0011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==m_cfg.i ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b101;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
  repeat(14)
    begin
    	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1; wb_dat_i==36 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
end

///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
get_response(req);
  if(req.iir[3:1]==3'b010)
begin
  repeat(14)
	begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req);
 
 end

end
		end
    	
    endtask
      



////////////////////////////////////////SETTING TRIGGER LEVEL TO 4 BYTES////////////////////////////////////////////////////////////////

class wr_seq3 extends wr_seq;
`uvm_object_utils(wr_seq3); 


extern function new(string name="wr_seq3");
extern task body();

endclass

function wr_seq3::new(string name="wr_seq3");
super.new(name);
endfunction

	task wr_seq3::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   





//////////////////////////////////////PASS THE DLV VALUE //////////////////////////////////////////////////////////////////// 
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==28;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0100_0011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==8'b1100_0110 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b101;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
 		repeat(14)
begin
    	  start_item(req);

   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
end
 
///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
get_response(req);
  if(req.iir[3:1]==3'b010)
     $display("value in the iir of sequence :%b",req.iir);

	repeat(14)
     begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 

  end

	end
    	
    endtask
           
////////////////////////


class wr_seq4 extends wr_seq;
`uvm_object_utils(wr_seq4); 


extern function new(string name="wr_seq4");
extern task body();

endclass

function wr_seq4::new(string name="wr_seq4");
super.new(name);
endfunction

	task wr_seq4::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   


                  start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==14;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0100_0011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==8'b1100_0110 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
 
   	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b101;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

    
/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
repeat(14)
begin
    	  start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
end


///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
get_response(req);
  if(req.iir[3:1]==3'b010) 
  $display("value in the iir of sequence :%b",req.iir);


  repeat(14)
  begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 
    
 end


		end
    	
    endtask
            



//////////////////////////////////////////PARITY_CONTROL SEWQUENCE///////////////////////////////////////////////////////////
class wr_seq5 extends wr_seq;
`uvm_object_utils(wr_seq5); 


extern function new(string name="wr_seq5");
extern task body();

endclass

function wr_seq5::new(string name="wr_seq5");
super.new(name);
endfunction

	task wr_seq5::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   





//////////////////////////////////////PASS THE DLV VALUE //////////////////////////////////////////////////////////////////// 
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==28;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0000_0011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==8'b0000_0110 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b111;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
 		//repeat(14)
 begin
    	  start_item(req);

   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==5;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
end
 
///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
get_response(req);
  if(req.iir[3:1]==3'b010)

     begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req);
end 
if(req.iir[3:1]==3'b011)

     begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==5;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 



  
end
		end
    	
    endtask
           
////////////////////////


class wr_seq6 extends wr_seq;
`uvm_object_utils(wr_seq6); 


extern function new(string name="wr_seq6");
extern task body();

endclass

function wr_seq6::new(string name="wr_seq6");
super.new(name);
endfunction

	task wr_seq6::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   





//////////////////////////////////////PASS THE DLV VALUE //////////////////////////////////////////////////////////////////// 
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==14;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0000_0011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==8'b0000_0110 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b111;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

    

/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
//repeat(14)
begin
    	  start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1 ;wb_dat_i==3;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
end


///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
get_response(req);
  if(req.iir[3:1]==3'b010)

 
   begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 
    end
 begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==5;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 
    end


		end
    	
    endtask
      

///////////////***************************////////*************////////////////////////////////////

//////////////////////////////////////////PARITY_CONTROL SEWQUENCE///////////////////////////////////////////////////////////
class wr_seq7 extends wr_seq;
`uvm_object_utils(wr_seq7); 


extern function new(string name="wr_seq7");
extern task body();

endclass

function wr_seq7::new(string name="wr_seq7");
super.new(name);
endfunction

	task wr_seq7::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   





//////////////////////////////////////PASS THE DLV VALUE //////////////////////////////////////////////////////////////////// 
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==28;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0000_0011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==8'b1100_0110 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b101;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
 	repeat(12)
 begin
    	  start_item(req);

   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
end
 
///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
get_response(req);
  if(req.iir[3:1]==3'b010)
repeat(15)
     begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req);
end 
if(req.iir[3:1]==3'b011)

     begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==5;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 



  
end
		end
    	
    endtask
           
////////////////////////


class wr_seq8 extends wr_seq;
`uvm_object_utils(wr_seq8); 


extern function new(string name="wr_seq8");
extern task body();

endclass

function wr_seq8::new(string name="wr_seq8");
super.new(name);
endfunction

	task wr_seq8::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   





//////////////////////////////////////PASS THE DLV VALUE //////////////////////////////////////////////////////////////////// 
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==14;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0000_0011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==8'b1100_0110 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b101;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

    
/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
repeat(12)
begin
    	  start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1 ;wb_dat_i==3;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
end


///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
get_response(req);
  if(req.iir[3:1]==3'b010)

 repeat(15)
   begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 
    end
 begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==5;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 
    end


		end
    	
    endtask
      

///////////////////////////////////////////////////////PARITY CONTROL//////////            
class wr_seq9 extends wr_seq;
`uvm_object_utils(wr_seq9); 


extern function new(string name="wr_seq9");
extern task body();

endclass

function wr_seq9::new(string name="wr_seq9");
super.new(name);
endfunction

	task wr_seq9::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   





//////////////////////////////////////PASS THE DLV VALUE //////////////////////////////////////////////////////////////////// 
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==28;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0001_1011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==8'b0000_0110 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b100;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
 	

    	  start_item(req);

   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==8'b0000_0101;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
get_response(req);
 /* if(req.iir[3:1]==3'b010)

     
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req);*/

 if(req.iir[3:1]==3'b011)

     begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==5;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 



  
end
		end
    	
    endtask
           
////////////////////////


class wr_seq10 extends wr_seq;
`uvm_object_utils(wr_seq10); 


extern function new(string name="wr_seq10");
extern task body();

endclass

function wr_seq10::new(string name="wr_seq10");
super.new(name);
endfunction

	task wr_seq10::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   





//////////////////////////////////////PASS THE DLV VALUE //////////////////////////////////////////////////////////////////// 
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==14;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0000_1011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==8'b0000_0110 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b100;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

    
/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
    	  start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1 ;wb_dat_i==3;wb_dat_i==8'b0000_0011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
get_response(req);
/*  if(req.iir[3:1]==3'b010)
begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 
   end*/
 if(req.iir[3:1]==3'b011)

 begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==5;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 
    end

		end
    	
    endtask
    
////////////////////////////////////////////////////OVER_RUN////////////////////////////////////////////////////////////////
                        class wr_seq11 extends wr_seq;
`uvm_object_utils(wr_seq11); 


extern function new(string name="wr_seq11");
extern task body();

endclass

function wr_seq11::new(string name="wr_seq11");
super.new(name);
endfunction

	task wr_seq11::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   





//////////////////////////////////////PASS THE DLV VALUE //////////////////////////////////////////////////////////////////// 
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==28;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0000_0011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==8'b1100_0110 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b100;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
 	repeat(20)
 begin

    	  start_item(req);

   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

end

///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 


///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
get_response(req);
 /* if(req.iir[3:1]==3'b010)

     repeat(8)
   begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req);*/
//end
if(req.iir[3:1]==3'b011)

     begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==5;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 



  
end
		end
    	
    endtask
           
////////////////////////


class wr_seq12 extends wr_seq;
`uvm_object_utils(wr_seq12); 


extern function new(string name="wr_seq12");
extern task body();

endclass

function wr_seq12::new(string name="wr_seq12");
super.new(name);
endfunction

	task wr_seq12::body();
    	    
	  begin
        /////////////////////////////////////SELECTING THE LINE CONTROL REGISTER(DIVISOR LATCH ACESS BIT)/////////////////////////////////////
   	  req=wr_xtn::type_id::create("req");
	   start_item(req);
   	   assert(req.randomize() with { wb_addr_i==3; wb_we_i==1; wb_dat_i[7]==1 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	   





//////////////////////////////////////PASS THE DLV VALUE //////////////////////////////////////////////////////////////////// 
           start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1;wb_dat_i==14;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 



//////////////////////////////////SELECT THE LINE CONTROL REGISTER(LCR) && PASS THRE BIT VALUE/////////////////////////////////
             start_item(req);
   	   assert(req.randomize() with {wb_addr_i==3;wb_we_i==1;wb_dat_i==8'b0000_0011;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
	

    	
    
////////////////////////////////FIFO_CONTROL REGISTER////////////////////////////////////////////
              start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==1;wb_dat_i==8'b1100_0110 ;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 
		
    	
    
/////////////////////////////INTERUPT ENABLE REGISTER/////////////////////////////////////////////
 start_item(req);
   	   assert(req.randomize() with {wb_addr_i==1;wb_we_i==1;wb_dat_i[7:4]==0;wb_dat_i[2:0]==3'b100;wb_dat_i[3]==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

    
/////////////////////////////////////TRANSMITTER HOLDING REGISTER/////////////////////////////
       repeat(20)
   begin
    	  start_item(req);
     
   	   assert(req.randomize() with {wb_addr_i==0;wb_we_i==1 ;wb_dat_i==3;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

end

///////////////////////////////////////////INTERRRUPT IDENTIFICATION REGISTER///////////////////////////////////////////////
        	  start_item(req);
   	   assert(req.randomize() with {wb_addr_i==2;wb_we_i==0; });
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	   finish_item(req); 

///////////////////////////////////////////////////geeting the respoonse//////////////////////////////////////////
get_response(req);
  if(req.iir[3:1]==3'b010)
/*repeat(8)
  begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==0;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 
   end*/
 if(req.iir[3:1]==3'b011)

 begin
      start_item(req);
          assert(req.randomize() with {wb_addr_i==5;wb_we_i==0;});
	   `uvm_info("WR_SEQUENCE",$sformatf("printing from sequence \n %s", req.sprint()),UVM_HIGH) 
	finish_item(req); 
    end

		end
    	
    endtask
    

