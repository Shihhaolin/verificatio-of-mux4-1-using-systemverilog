`include "interface.sv"
`include "test.sv"

module testbench_top;

logic clk;

always
#5 clk = ~clk;

//creating instance of interface
mux_intf intf(clk);

mux_4to1_Assertion UUT(.out(intf.out), .clk(intf.clk), .in_a(intf.in_a), .in_b(intf.in_b), .in_c(intf.in_c), .in_d(intf.in_d),
                       .sel_a(intf.sel_a), .sel_b(intf.sel_b), .sel_c(intf.sel_c), .sel_d(intf.sel_d));

//testcase instance, interface handle is passed to test as an argument
test     t1(intf);

endmodule