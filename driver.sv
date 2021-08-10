//driver is able to receive the stimulus generated from the generator 
//and drive to DUT by assigning transaction class values to interface signals.

`define DRIV_IF mux_vif.DRIVER.driver_cb

class driver;

virtual mux_intf mux_vif;

mailbox gentodrive;

int no_transactions;

//constructor 
function new(virtual mux_intf mux_vif, mailbox gentodrive);
   this.gentodrive = gentodrive;
   this.mux_vif    = mux_vif;
endfunction

task drive;
  forever begin
      transaction trans;
      `DRIV_IF.sel_a <=0;
      `DRIV_IF.sel_b <=0;
      `DRIV_IF.sel_c <=0;
      `DRIV_IF.sel_d <=0;
      gentodrive.get(trans);
      $display("--------[DRVER_TRANSFER: %0d]----------"
                ,no_transactions);
      @(posedge mux_vif.DRIVER.clk);
        begin
        `DRIV_IF.out <= trans.out;
        `DRIV_IF.sel_a <= trans.sel_a;
        `DRIV_IF.sel_b <= trans.sel_b;
        `DRIV_IF.sel_c <= trans.sel_c;
        `DRIV_IF.sel_d <= trans.sel_d;
        $display("\tout = %0h", trans.out);
        end
    no_transactions++;
  end
endtask


task main;
    forever 
    drive();
   
  endtask
  
  
endclass