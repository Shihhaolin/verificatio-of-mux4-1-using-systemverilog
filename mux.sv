`timescale 1ns/100ps

module mux_4to1_Assertion #(WIDTH = 4)
                  (output logic [WIDTH-1:0] out,
                   input  logic [WIDTH-1:0] in_a,
                   input  logic [WIDTH-1:0] in_b,
                   input  logic [WIDTH-1:0] in_c,
                   input  logic [WIDTH-1:0] in_d,
                   input  bit             sel_a,
                   input  bit             sel_b,
                   input  bit             sel_c,
                   input  bit             sel_d,
                   input  logic             clk);


 always @(posedge clk) begin
     if (sel_a ==1)
     out <= in_a;
     else
       if (sel_b ==1)
       out <= in_b;
      else 
        if (sel_c ==1)
        out <= in_c;
        else
          if (sel_d ==1)
          out <= in_d;
 end     

    //tragger the clock at the negetive edge to avoid race complict
   default clocking defclk@(negedge clk);
   endclocking

   property select_a;
    @(negedge clk)
     (sel_a == 1'b1) |=> (out == in_a);
   endproperty

   property select_b;
    @(negedge clk) 
    ((sel_a == 1'b0) & (sel_b == 1'b1)) |=> (out == in_b);
   endproperty

   property select_c;
    @(negedge clk) 
    ((sel_a == 1'b0) & (sel_b == 1'b0) & (sel_c == 1'b1) ) |=> (out == in_c);
   endproperty

   property select_d;
    @(negedge clk) 
    ((sel_a == 1'b0) & (sel_b == 1'b0) & (sel_c == 1'b0) & (sel_d == 1'b1)) |=> (out == in_d);
   endproperty

   P1:assert property (select_a);
   P2:assert property (select_b);
   P3:assert property (select_c);
   P4:assert property (select_d);

endmodule