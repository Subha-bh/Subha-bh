//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2023 18:35:52
// Design Name: 
// Module Name: cal_tb
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


//`timescale 100ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.11.2023 22:56:36
// Design Name: 
// Module Name: calculator_1
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


//a,
//b,
//out,
//carry_flag,
//zero_flag,
//opcode
//    );
// reg [7:0]a;
// reg [7:0]b;
//reg [15:0]out;
// reg carry_flag;
// reg zero_flag;
// reg [2:0]opcode;
 
// parameter [2:0]add=3'b000;
// parameter [2:0]sub=3'b001;
// parameter [2:0]mult=3'b010;
// parameter [2:0]div=3'b011;
// parameter [2:0]exp=3'b100;
// parameter [2:0]square=3'b101;
// parameter [2:0]negation=3'b110;
// parameter [2:0]option_or=3'b111;
 
// always @(a or b or opcode)
// begin
 
// case(opcode)
 
// add:
// begin
// out = a + b;
// carry_flag = out[8];
//// zero_flag = out[15:0]; 
// end
 
// sub:
// begin
// out = a-b;
// carry_flag = out[8];
//// zero flag
// end
 
 
// mult:
// begin
// out = (a*b);
//zero_flag = 1;
////carry_flag = out([7:0])[8];
// end
 
// div:
// begin
// out = (a/b);
// end
 
// exp:
// begin
// out = (a^b);
// end
 
// square:
// begin
// out = (a^2);
// end
 
// negation:
// begin
// out = ~(a & b);
// end
 
// option_or:
// begin
// out = (a | b);
// end
 
// default:
// begin
// out = 16'b0;
// carry_flag = 1'b0;
// zero_flag = 1'b0;
// end

// endcase
 
// end

 
//endmodule


//module cal_tb;
    
// reg [7:0]a_tb;
// reg [7:0]b_tb;
// reg [15:0]out_tb;
 
// initial begin
// a_tb = 8'b00000001;
// b_tb = 8'b00000011;
// out_tb = 3'b000;
// end
 

`timescale 1ns / 1ps
 `include "calculator_1.v"
module calculator_1_tb;

 reg [7:0]a;
 reg [7:0]b;
 wire [15:0]out;
 wire carry_flag;
 wire zero_flag;
 reg [2:0]opcode;
 
 calculator_1 UUT (
    .a(a),
    .b(b),
    .out(out),
    .carry_flag(carry_flag),
    .zero_flag(zero_flag),
    .opcode(opcode)
  ); 
  
  initial begin 
  
  a = 8'b00000001;
  b = 8'b00000001;
  opcode = 3'b000;
  #10;
  
  a = 8'b00000011;
  b = 8'b00000001;
  opcode = 3'b000;
  #10;
  
  a = 8'b00000001;
  b = 8'b00000011;
  opcode = 3'b000;
  #10;
  
  a = 8'b00000011;
  b = 8'b00000011;
  opcode = 3'b000;
  #10;
  
  end
  
endmodule
