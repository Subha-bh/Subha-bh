`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2024 12:59:12
// Design Name: 
// Module Name: elevator_1_tb
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
`include "elevator_1.v"

module elevator_1_tb;
reg clk;
reg reset;
reg emergency_stop;
wire door;
reg destiny_floor;


elevator_1 uut(
.clk(clk),
.reset(reset),
.emergency_stop(emergency_stop),
.door(door),
.destiny_floor(destiny_floor)
);

// generate the clock signal
initial begin
clk = 0;
forever #5 clk = ~clk;
end

//case 1 i.e. groung floor
initial begin
reset = 1;
destiny_floor = 3'b000;
emergency_stop = 0;


# 10
reset = 0;
destiny_floor = 3'b001;

# 10
reset = 0;
destiny_floor = 3'b0100;

# 10
reset = 0;
//destiny_floor = 3'b0101;
emergency_stop = 1;

# 10
reset = 0;
//destiny_floor = 3'b0101;
emergency_stop = 0;

# 10
reset = 0;
destiny_floor = 3'b000;

#20
$stop;


end
endmodule
