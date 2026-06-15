module memory(inf_conc i1);
  reg [7:0] mem [255:0];
  
  always@(posedge i1.inf_clk)begin
    if(i1.inf_rst)
      i1.inf_m_out<=0;
    else if(i1.inf_w_en)begin
      mem[i1.inf_add]<=i1.inf_d;
    end
    else
      i1.inf_m_out<=mem[i1.inf_add];
  end
endmodule

// TB 

interface inf_conc;
  logic  [7:0] inf_add;
  logic  [7:0] inf_d;
  logic  [7:0] inf_m_out;
  logic        inf_rst,inf_w_en,inf_clk;
endinterface

module tb();
  
  inf_conc i1();
  memory dut (i1);
  
  always #5 i1.inf_clk=~i1.inf_clk;
  
  initial begin
    i1.inf_clk=0;
    
  end
  
  task write_read(input [7:0] data,
                  input [7:0] add);
    i1.inf_w_en=0;
    
    @(posedge i1.inf_clk);
    i1.inf_w_en=1;
    i1.inf_d   =data;
    i1.inf_add =add;
    
    @(posedge i1.inf_clk);
    i1.inf_w_en=0;
    
    @(posedge i1.inf_clk);
    @(posedge i1.inf_clk);
    $display("=================================");
    $display("---------_READ_DATA_-------------");
    $display("=================================");
    $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    $display("|  INPUT    DATA = %d           |",i1.inf_d);
    $display("|  ADDRESS       = %d           |",i1.inf_add);
    $display("|  OBTAINED DATA = %d           |",i1.inf_m_out);
    $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  endtask
  
  
  initial begin
    
    i1.inf_rst =1;
    @(posedge i1.inf_clk);
    i1.inf_rst =0;
    
    write_read(8'd10,8'd45);
    #1;
    write_read(8'd44,8'd45);
    #1;
    $finish;
  end
  
endmodule
    
    
