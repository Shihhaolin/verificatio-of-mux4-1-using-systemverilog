//main function of test is trying to creating the environment
//configuring the testbench i.e, decide the type and number of transaction to be generated
//initiaing the stimulus driving

`include "enviroment.sv"
program test(mux_intf intf);

environment env;

initial begin
    //create enviroment
    env = new(intf);
    //run 10 times
    env.gen.repeat_count = 10;

    env.run();
end

endprogram