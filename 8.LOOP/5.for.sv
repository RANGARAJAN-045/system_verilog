/ for loop (num pyramid pattern)

module pattern();
  
  integer i,j;
  integer n=4;
  
  initial begin
    
    for(i=1;i<=n;i++)begin//row
      for(j=1;j<=n-i;j++)begin//for space
        $write(" ");
      end
        for(j=1;j<=2*i-1;j++)begin//for numbers
          $write("%0d ",j);
        end
        $display("");//nxt line
    end
  end
endmodule
