/// just an example for task including..........

interface FA;
  logic a,b,cin;
  logic sum,carry;
endinterface

class transaction;
  rand  bit a,b,cin;
  bit       sum,carry;
  
  task  display(string name);
    $display("\n|-----------------------------------------|");
    $display("|         NAME=%0s            |",name);
    $display("|-----------------------------------------|");
    $display("|      A = %b ------ B=%b ------ CIN = %b    |",a,b,cin);
    $display("|      SUM = %b || CARRY=%b                 |",sum,carry);
    $display("|-----------------------------------------|\n");
  endtask
endclass: transaction
