module condition();
  bit [2:0]  a;
  
  initial begin
    
    a=0;
    #2 a= 7;
    
    if(a==10)begin
      
      $display("-----------------------------");
      $display("the given value is matched");
      $display("-----------------------------");
    end
    
    else begin
      $display("-----------------------------");
      $display("the given value is mismatched");
      $display("-----------------------------");
    end
  end
endmodule
