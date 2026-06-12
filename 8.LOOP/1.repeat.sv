//Write a program using a repeat loop to display the multiplication table of 2.

module loop();
  int a,b;
  
  initial begin
    a=0;
    b=0;
    
    repeat(10)begin
      a++;
      b=(a*2);
      $display("0%d x 2 = %0d",a,b);
    end
    
  end
endmodule
