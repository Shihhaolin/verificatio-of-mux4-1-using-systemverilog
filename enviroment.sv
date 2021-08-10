//Environment is container class contains Mailbox, Generator and Driver

`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"

class environment;

generator gen;
driver    driv;

mailbox   gentodrive;

event gen_ended;

virtual mux_intf mux_vif;

//constuctor

function new(virtual mux_intf mux_vif);

//get the interface from test
   this.mux_vif = mux_vif;

//create the mailbox 
   gentodrive = new();

//instantiate generator and driver
   gen = new(gentodrive, gen_ended);
   driv = new(mux_vif, gentodrive);

endfunction

task test();
  fork
      gen.main();
      driv.main();
  join_any
endtask

task post_test();
   wait(gen_ended.triggered);
   wait(gen.repeat_count == driv.no_transactions);
endtask

task run;
test();
post_test();
$finish;
endtask

endclass