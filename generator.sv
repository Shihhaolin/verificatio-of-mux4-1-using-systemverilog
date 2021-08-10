//Generating the stimulus by randomizing the transaction class

class generator; 
    
rand transaction trans;

mailbox gentodrive;

int repeat_count;

//the event will synchronize all of the class after the generation process completion 
event ended;

//constructor. get mailbix handle from enviroment
function new (mailbox gentodrive, event eneded);
    this.gentodrive = gentodrive;
    this.ended      = ended;
endfunction


//main task, create and randomizes the packet and puts into mailbox
task main();
  repeat(repeat_count) begin
   trans = new();
   if (!trans.randomizes()) $fatal("trans randomization failed");
       gentodrive.put(trans);//if randomization is success, put transaction into mailbox 
  end
endtask


endclass