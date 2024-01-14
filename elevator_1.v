`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2024 11:53:30
// Design Name: 
// Module Name: elevator_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module elevator_1(
clk,
reset,
emergency_stop,
//current_floor,
//destiny_floor,
door,
//up,
//down,
//stop
destiny_floor
);
input wire clk;
input wire reset;
input emergency_stop;
 input [2:0]destiny_floor;
output reg [1:0] door;
reg [2:0]current_floor, next_floor;
reg [2:0]opcode;
//reg [1:0]emergency_stop;
//opcodes
parameter OP_STOP = 3'b000;
parameter OP_MOVEUP = 3'b001;
parameter OP_MOVEDOWN = 3'b010;
parameter OP_DOOR = 3'b100;


reg [2:0]next_opcode;
reg [2:0] ask;


always@(posedge clk or posedge reset)
   begin
   //first giving the reset condition
      if(reset)
       begin
         opcode <= OP_STOP;
         current_floor <=3'b000;
         door <= 1'b0;
       end
       else
       // cases
       begin
       opcode <= next_opcode;
       //destiny_floor <= ask; 
       current_floor <= next_floor;
       
       if(current_floor == destiny_floor)
       begin
       opcode <= OP_DOOR; // open door
       #5
       door = 1'b0; // after 5 seconds, close the door
       end

       if(current_floor > destiny_floor)
       begin
       opcode <= OP_MOVEDOWN; // open door
       end  
       
       if(current_floor < destiny_floor)
       begin
       opcode <= OP_MOVEUP; // open door
       end    
       
     end  
 end
   
//condition for opening the door 
   always @* 
begin
if (opcode == OP_DOOR)
begin
door = 1'b1;
end
end


// emergency exit
   always @* 
begin
if (emergency_stop == 1)
begin
opcode <= OP_DOOR;
end
end



//opcode cases
    always @* begin
   
    case(opcode)
    OP_STOP: next_floor = current_floor;
    OP_MOVEUP: next_floor = current_floor+1;
    OP_MOVEDOWN: next_floor = current_floor-1;
    OP_DOOR: next_floor = current_floor;
    default: next_floor = current_floor;
    endcase
    
    end

endmodule
