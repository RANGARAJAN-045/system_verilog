module counter(inf_conc i1);
  
  always@(i1.inf_clk)begin
    if(i1.inf_rst)
      i1.q<=0;
    else begin
      if(i1.q>=i1.count)
        i1.q<=0;
      else
        i1.q<=i1.q+1;
    end
  end
endmodule
      
    //tb
    
interface inf_conc #(parameter width=8,count=9);
  logic  [width-1:0] q;
  logic              inf_rst,inf_clk;
endinterface

module tb();
  
  inf_conc i1();
  counter dut (i1);
  
  always #5 i1.inf_clk=~i1.inf_clk;
  
  
  initial begin
    
    $display("=================================");
    $display("---------COUNTER-------------");
    $display("=================================");
    $monitor("|  COUNT         = %d           |",i1.q);
    
    
    i1.inf_clk=0;i1.inf_rst=1;
    @(posedge i1.inf_clk);
    i1.inf_rst=0;
    #100;
    $display("=================================");
    $finish;
  end
  
endmodule
  
