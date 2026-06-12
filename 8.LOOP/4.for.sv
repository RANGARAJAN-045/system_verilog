// for loop (num inc pattern)

module pattern();
  
  integer i,j;
  
  initial begin
    
    for(i=1;i<=4;i++)begin
      for(j=1;j<=i;j++)begin
        $write(j);
      end
      $display("");
    end
  end
endmodule
