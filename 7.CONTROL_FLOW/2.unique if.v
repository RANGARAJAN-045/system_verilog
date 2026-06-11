module condition();
  bit [2:0]  a;
  bit [2:0]  b;
  
  initial begin
    
    a=0;
    #2 a= 7;b=7;
    
    unique if(a==b)begin
      
      $display("-----------------------------");
      $display("the given value is matched");
      $display("-----------------------------");
    end
    
    else if(a<b)begin
      
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
    
