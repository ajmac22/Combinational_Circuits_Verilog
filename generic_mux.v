`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: AJay
// 
// Create Date:    18:01:57 10/24/2020 
// Design Name:    Behavioural Design
// Module Name:    generic_mux 
// Project Name:   Combinational Circuits
// Target Devices: FPGA/ASIC Both
// Tool versions: 
// Description: 
// Additional Comments: Single Bit Generic Mux (2^k:1 mux) Code 
//
//////////////////////////////////////////////////////////////////////////////////
module generic_mux #(  parameter k = 4 ) // k=4 will give 16:1 Mux where each of 16 input are single bit data line 
 		(
    input [2**k-1:0] in ,
    input [k-1:0] sel,
    output  y
    );
	
 assign y = in[sel];

endmodule
