module caseuhhh();

  bit a;
  bit b;
  bit c;
  bit [1:0] sel;
  bit out;

  initial begin
    a = 0;
    b = 1;
    c = 0;

    sel = 0;
    #10 sel = 1;
    #10 sel = 2;
    #10 sel = 3;
  end

  always_comb begin
    case(sel)
      2'd0: out = a;
      2'd1: out = b;
      2'd2: out = c;
      default: out = 0;
    endcase
  end

  initial begin
    $monitor("sel=%0d out=%0d", sel, out);
  end

endmodule
