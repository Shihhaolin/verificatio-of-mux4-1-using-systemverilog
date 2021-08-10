//Interface will group the signals, specifies the direction (Modport) 
//and Synchronize the signals(Clocking Block).

interface mux_intf(input logic clk);

localparam WIDTH = 4;

 logic [WIDTH-1:0] out;
 logic [WIDTH-1:0] in_a;
 logic [WIDTH-1:0] in_b;
 logic [WIDTH-1:0] in_c;
 logic [WIDTH-1:0] in_d;
 bit             sel_a;
 bit             sel_b;
 bit             sel_c;
 bit             sel_d;


clocking driver_cb @(posedge clk);
  default input #1 output #1;
 input  out;
 output in_a;
 output in_b;
 output in_c;
 output in_d;
 output sel_a;
 output sel_b;
 output sel_c;
 output sel_d;
 
 endclocking

 clocking monitor_cb @(posedge clk);
   default input #1 output #1;
 input  out;
 input in_a;
 input in_b;
 input in_c;
 input in_d;
 input sel_a;
 input sel_b;
 input sel_c;
 input sel_d;
 
 endclocking

modport DRIVER (clocking driver_cb,
                input    clk);

modport MONITOR (clocking monitor_cb,
                input    clk);

endinterface