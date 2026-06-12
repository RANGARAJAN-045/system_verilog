//Write a SystemVerilog program using a while loop to print numbers from 1 to 10.

module loop();
  
  int a;
  
  initial begin
    a=1;
    
    do begin
      $display("a=%d",a);
      a++;
    end
    
    while(a<11);
  end
endmodule
