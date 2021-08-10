//declare the fields

class transaction;

 localparam WIDTH = 4;

     logic [WIDTH-1:0] out;
rand logic [WIDTH-1:0] in_a;
rand logic [WIDTH-1:0] in_b;
rand logic [WIDTH-1:0] in_c;
rand logic [WIDTH-1:0] in_d;
rand bit             sel_a;
rand bit             sel_b;
rand bit             sel_c;
rand bit             sel_d;

//only one sel would be 1
constraint sel_constraint1 { (sel_a != sel_b); (sel_a != sel_c); (sel_a != sel_d); 
                             (sel_b != sel_c); (sel_b != sel_d); (sel_c != sel_d);}


endclass