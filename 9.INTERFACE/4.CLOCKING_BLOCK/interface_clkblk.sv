module  data_receiver(inf dr);
  
  
  always@(posedge dr.clk)begin
    
    if(dr.rst)begin
      dr.count      <=0;
      dr.receive    <=0;
      dr.done       <=0;
    end
    else begin
      if(~dr.valid)begin
        dr.receive   <=dr.receive;
        dr.count     <=dr.count;
        dr.done      <=0;
      end
      else begin 
        dr.receive   <={dr.receive[2:0],dr.data};
        dr.count     <=dr.count +1;
        dr.done      <=0;
        
        if(dr.count ==3)begin
          dr.receive   <=dr.receive;
          dr.count     <=0;
          dr.done      <=1;
        end
        
      end
    end
  end
endmodule
      
      
      //tb
interface inf (input logic clk,rst);

    logic        data, valid, done;
    logic [3:0]  count,receive=0;

    clocking blk @(posedge clk);
        default input  #1step;
        default output #1;
        input  receive, done;
        output data, valid;
    endclocking

    modport tb           (clocking blk);
    modport data_receiver(input  rst,clk, data, valid,
                          output receive, done);

endinterface
      
module  tb();
  
  logic  rst,clk;
  
  inf dr(clk,rst);
  data_receiver dut (dr);
  
  always #5 clk=~clk;
  
  initial begin
    
    $display("====================================================================");
    $display("-------------------------data_receiver------------------------------");
    $display("====================================================================");
    $monitor("|valid   =%d || sdata   = %d || rdata  = %d || DONE= %d || count=%d|",dr.valid,dr.data,dr.receive,dr.done,dr.count);
    
    clk=0;dr.data=0;dr.valid=0;rst=1;
    
    @(posedge clk);
      rst     =0;
    
    repeat(5)begin
      @(posedge clk);
      dr.valid   =1;
      dr.data    =$urandom;
    end
    #10;
    dr.valid =0;
    #2;
    dr.valid     =0;
    #500;
    $display("======================================================================");
    $finish;
  end
endmodule
