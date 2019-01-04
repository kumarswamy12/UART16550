class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)

uvm_tlm_analysis_fifo #(wr_xtn)fifo_wrh[];
wr_xtn wr_data1,wr_data2;
env_config m_cfg;
extern function new(string name="scoreboard",uvm_component parent=null);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern function void check_phase(uvm_phase phase);
endclass

function scoreboard::new(string name="scoreboard",uvm_component parent);
 super.new(name,parent);

endfunction


	function void scoreboard::build_phase(uvm_phase phase);
	// get the config object using uvm_config_db 
	  if(!uvm_config_db #(env_config)::get(this,"","env_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
				fifo_wrh=new[m_cfg.no_of_wr_agents];
					
foreach(fifo_wrh[i])
            begin
        fifo_wrh[i]=new($sformatf("fifo_wrh[%0d]*",i),this);  
      end 
             wr_data1=wr_xtn::type_id::create("wr_data1");
         wr_data2=wr_xtn::type_id::create("wr_data2");;    
endfunction





task scoreboard::run_phase(uvm_phase phase);
        fork
 begin


forever
    begin
         fifo_wrh[0].get(wr_data1);
        fifo_wrh[1].get(wr_data2);
        end
end

      join
endtask


function void scoreboard::check_phase(uvm_phase phase);
       begin
             $display("THE VALUE IN THE REVEIVER FIFO OF DUT1:%d\n",wr_data1.rb[0]);
             $display("THE VALUE IN THE TRANSMITTER FIFO OF DUT1\n: %d",wr_data1.thr[0]);
             $display("THE VALUE IN THE RECIVER FIFO OF DUT2 :%d\n",wr_data2.rb[0]);
             $display("THE VALUE IN THE TRANSMITTER FIFO OF DUT2 :%d",wr_data2.thr[0]);

     if(wr_data1.thr[0]==wr_data2.rb[0])
          	`uvm_info("DUT1", $sformatf("Data in DUT1 Match successful"), UVM_MEDIUM)
       else 
     	    `uvm_info(get_type_name(), $sformatf("Data Match unsuccessful"), UVM_MEDIUM)

  end
 //if(wr_data1.iir[3:1]==3'b010)
   begin
      if(wr_data1.rb[0]==wr_data2.thr[0])
       	`uvm_info(get_type_name(), $sformatf("Data IN DUT2Match successful"), UVM_MEDIUM)
       else 
     	`uvm_info(get_type_name(), $sformatf("Data Match unsuccessful"), UVM_MEDIUM)
		end
  endfunction
