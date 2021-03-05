`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// // Engineer: AJay
// 
// Create Date:    10:59:22 12/19/2020 
// Design Name:    Behavioural Design
// Module Name:    barrel_shift_32 
// Project Name:   Combinational Circuits
// Target Devices: FPGA/ASIC Both
// Tool versions: 
// Description: 
// Additional Comments: Performs Left Shift Operation 
//
//////////////////////////////////////////////////////////////////////////////////
module barrel_shift_32(
										
    input [31:0] in_word,
    input [4:0] shift,
    output [31:0] out_word
    );

wire [47:0] a;
wire [39:0] intr0;
wire [35:0] intr1;
wire [33:0] intr2;
wire [32:0] intr3;

assign a = {16'h0000,in_word};
assign intr0[39:32] = 8'h00  ;
assign intr1[35:32] = 4'h0   ;
assign intr2[33:32] = 2'b00  ;
assign intr3[32] = 1'b0      ;

genvar i;

generate 
for (i=0; i< 32; i=i+1) begin : stage1
mux21 m1 (a[i+16],a[i],shift[4],intr0[i]);
end
endgenerate

generate 
for (i=0; i< 32; i=i+1) begin : stage2
mux21 m2 (intr0[i+8],intr0[i],shift[3],intr1[i]);
end
endgenerate

generate 
for (i=0; i< 32; i=i+1) begin : stage3
mux21 m3 (intr1[i+4],intr1[i],shift[2],intr2[i]);
end
endgenerate

generate 
for (i=0; i< 32; i=i+1) begin : stage4
mux21 m4 (intr2[i+2],intr2[i],shift[1],intr3[i]);
end
endgenerate

generate 
for (i=0; i< 32; i=i+1) begin : stage5
mux21 m5 (intr3[i+1],intr3[i],shift[0],out_word[i]);
end
endgenerate


endmodule


//////////////////////////////////////////////////////////////
// 2:1 Mux used in the shifter
module mux21(
 input data1,data0,sel,
 output muxed);
 
 assign muxed = (sel)?data1:data0;
 
endmodule 
 
