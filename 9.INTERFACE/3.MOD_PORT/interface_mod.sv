// Problem statement

// Design a 4-bit up/down counter using a SystemVerilog interface with modport.

// If up_down = 1 → count up
// If up_down = 0 → count down
// rst resets count to 0
// TB drives clk, rst, up_down
// DUT drives count
// Display count value every clock cycle

module counter(inf_conc.counter i1);
  
  always@(posedge i1.inf_clk)begin
    if(i1.inf_rst)
      i1.q<=i1.count;
    else if(i1.up_down)begin
      if(i1.q>=i1.count)
        i1.q<=0;
      else
        i1.q<=i1.q+1;
    end
    
    else if(~i1.up_down)begin
      if(i1.q==0)
        i1.q<=i1.count;
      else
        i1.q<=i1.q-1;
    end
  end
endmodule

// tb


interface inf_conc #(parameter width=4);
  logic  [width-1:0] q;
  logic  [width-1:0] count;
  logic              inf_rst,inf_clk;
  logic              up_down;
  
  modport counter (input  inf_clk,input inf_rst,input up_down,output q,input count);
  modport tb      (input  q ,output count,output inf_clk,output inf_rst,output up_down);
endinterface

module tb();
  
  inf_conc i1();
  counter dut (i1);
  
  always #5 i1.inf_clk=~i1.inf_clk;
  
  
  initial begin
    
    $display("=================================");
    $display("---------COUNTER-------------");
    $display("=================================");
    $monitor("| MODE   = %d || COUNT   = %d   |",i1.up_down,i1.q);
    
    
    i1.inf_clk  =0;
    i1.inf_rst  =1;
    i1.up_down  =1;
    i1.count    =9;
    @(posedge i1.inf_clk);
    i1.inf_rst  =0;
    #250;
    i1.up_down  =0;
    #500;
    $display("=================================");
    $finish;
  end
  
endmodule
    
    
    
