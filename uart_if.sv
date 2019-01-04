interface uart_if(input bit clock);
  
///////////////////////WISHINPUT SIGNALS///////////////////////////////////


  
	
      logic [4:0] wb_addr_i;
 logic [31:0] wb_dat_i,wb_dat_o;
 bit [3:0] wb_sel_i;
   bit  wb_we_i, wb_stb_i, wb_cyc_i, wb_ack_o;
	logic wb_rst_i;
	bit wb_clk_i; 





////////////////////////////UART_MOEDEM SIGNALS ///////////////////////////////////////

bit int_o;                        //interface signal/////
bit baud_o;

	bit stx_pad_o, srx_pad_i;

	bit rts_pad_o, cts_pad_i, dtr_pad_o, dsr_pad_i, ri_pad_i, dcd_pad_i;
	




clocking wr_cb @(posedge clock);
default input #1 output #0;

output wb_addr_i;
output wb_dat_i;
output wb_we_i;
 output  wb_sel_i;
  output wb_rst_i;
  output wb_cyc_i;
   output wb_stb_i;
  input wb_ack_o;
  input int_o;
   input wb_dat_o;
endclocking
    



clocking wr_mon_cb @(posedge clock);
default input #1 output #0;
  //input wb_rst_i;
input wb_addr_i;
input wb_dat_i;
input wb_we_i;
 input  wb_sel_i;
  input wb_rst_i;
  input wb_cyc_i;
   input wb_stb_i;
   input wb_ack_o;
input int_o;
input wb_dat_o;
endclocking




modport WR_DR(clocking wr_cb);
modport WR_MON(clocking wr_mon_cb);
 

endinterface
