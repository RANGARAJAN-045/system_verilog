//Write a SystemVerilog program using a while loop to print numbers from 1 to 10.

module loop();
  
  int a;
  
  initial begin
    a=1;
    
    while(a<11)begin
      $display("a=%d",a);
      a++;
    end
  end
  
endmodule
