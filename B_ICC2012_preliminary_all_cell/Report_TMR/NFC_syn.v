/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Thu Sep  7 00:43:12 2023
/////////////////////////////////////////////////////////////


module NFC_0_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
endmodule


module NFC_0_DW01_inc_1 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
endmodule


module NFC_0 ( clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, 
        F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, 
        F_IO_A_READING, F_IO_B_READING, KEY );
  inout [7:0] F_IO_A;
  inout [7:0] F_IO_B;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B, F_IO_A_READING, F_IO_B_READING;
  wire   N164, N165, N166, N167, N168, N169, N170, N171, N172, N180, N181,
         N182, N183, N184, N185, N186, N187, N188, N251, n141, n142, n146,
         n149, n151, n152, n153, n154, n155, n156, n157, n158, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n143, n144, n145, n147,
         n148, n150, n159, n197, n198, n199, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241;
  wire   [4:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;

  NFC_0_DW01_inc_0 add_585 ( .A(page), .SUM({N188, N187, N186, N185, N184, 
        N183, N182, N181, N180}) );
  NFC_0_DW01_inc_1 add_531 ( .A(counter), .SUM({N172, N171, N170, N169, N168, 
        N167, N166, N165, N164}) );
  DFFQX1 \counter_reg[3]  ( .D(n176), .CK(clk), .Q(counter[3]) );
  DFFQX1 \counter_reg[6]  ( .D(n173), .CK(clk), .Q(counter[6]) );
  DFFQX1 \counter_reg[4]  ( .D(n175), .CK(clk), .Q(counter[4]) );
  DFFQX1 \counter_reg[5]  ( .D(n174), .CK(clk), .Q(counter[5]) );
  DFFQX1 \counter_reg[8]  ( .D(n171), .CK(clk), .Q(counter[8]) );
  DFFQX1 \counter_reg[7]  ( .D(n172), .CK(clk), .Q(counter[7]) );
  DFFQX1 F_CLE_A_reg ( .D(n170), .CK(clk), .Q(F_CLE_A) );
  DFFQX1 F_WEN_A_reg ( .D(n169), .CK(clk), .Q(F_WEN_A) );
  EDFFX1 F_ALE_A_reg ( .D(n166), .E(n161), .CK(clk), .Q(F_ALE_A) );
  EDFFX1 F_CLE_B_reg ( .D(n165), .E(N251), .CK(clk), .Q(F_CLE_B) );
  DFFQX1 done_reg ( .D(n167), .CK(clk), .Q(done) );
  DFFQX1 F_REN_A_reg ( .D(n180), .CK(clk), .Q(F_REN_A) );
  EDFFX1 F_WEN_B_reg ( .D(n163), .E(n162), .CK(clk), .Q(F_WEN_B), .QN(n158) );
  EDFFX1 F_ALE_B_reg ( .D(n164), .E(N251), .CK(clk), .Q(F_ALE_B) );
  DFFQX1 \page_reg[3]  ( .D(n186), .CK(clk), .Q(page[3]) );
  DFFQX1 \page_reg[8]  ( .D(n181), .CK(clk), .Q(page[8]) );
  DFFQX1 \page_reg[6]  ( .D(n183), .CK(clk), .Q(page[6]) );
  DFFQX1 \page_reg[5]  ( .D(n184), .CK(clk), .Q(page[5]) );
  DFFQX1 \page_reg[1]  ( .D(n189), .CK(clk), .Q(page[1]) );
  DFFQX1 \page_reg[7]  ( .D(n182), .CK(clk), .Q(page[7]) );
  DFFQX1 \page_reg[2]  ( .D(n187), .CK(clk), .Q(page[2]) );
  DFFQX1 \page_reg[4]  ( .D(n185), .CK(clk), .Q(page[4]) );
  DFFQX1 \counter_reg[1]  ( .D(n179), .CK(clk), .Q(counter[1]) );
  DFFQX1 \page_reg[0]  ( .D(n188), .CK(clk), .Q(page[0]) );
  DFFQX1 \counter_reg[2]  ( .D(n177), .CK(clk), .Q(counter[2]) );
  EDFFX1 WTMK_ACTIVE_reg ( .D(n206), .E(n160), .CK(clk), .Q(n159), .QN(n204)
         );
  DFFX1 F_IO_A_READING_reg ( .D(n168), .CK(clk), .Q(F_IO_A_READING), .QN(n142)
         );
  DFFQX1 \state_reg[0]  ( .D(n194), .CK(clk), .Q(state[0]) );
  TBUFXL \F_IO_B_tri[7]  ( .A(n218), .OE(1'b1), .Y(F_IO_B[7]) );
  TBUFXL \F_IO_B_tri[1]  ( .A(n156), .OE(1'b1), .Y(F_IO_B[1]) );
  TBUFXL \F_IO_B_tri[3]  ( .A(n154), .OE(1'b1), .Y(F_IO_B[3]) );
  TBUFXL \F_IO_B_tri[5]  ( .A(n152), .OE(1'b1), .Y(F_IO_B[5]) );
  TBUFXL \F_IO_B_tri[2]  ( .A(n155), .OE(1'b1), .Y(F_IO_B[2]) );
  TBUFXL \F_IO_B_tri[6]  ( .A(n151), .OE(1'b1), .Y(F_IO_B[6]) );
  TBUFXL \F_IO_B_tri[0]  ( .A(n157), .OE(1'b1), .Y(F_IO_B[0]) );
  TBUFXL \F_IO_B_tri[4]  ( .A(n153), .OE(1'b1), .Y(F_IO_B[4]) );
  TBUFXL \F_IO_A_tri[6]  ( .A(n197), .OE(n142), .Y(F_IO_A[6]) );
  DFFQX1 \counter_reg[0]  ( .D(n178), .CK(clk), .Q(counter[0]) );
  TBUFXL \F_IO_A_tri[0]  ( .A(n149), .OE(n142), .Y(F_IO_A[0]) );
  DFFQX1 \state_reg[4]  ( .D(n190), .CK(clk), .Q(state[4]) );
  DFFQX1 \state_reg[2]  ( .D(n192), .CK(clk), .Q(state[2]) );
  DFFQX1 \state_reg[1]  ( .D(n193), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[3]  ( .D(n191), .CK(clk), .Q(state[3]) );
  TBUFXL \F_IO_A_tri[2]  ( .A(n212), .OE(n142), .Y(F_IO_A[2]) );
  TBUFXL \F_IO_A_tri[1]  ( .A(n199), .OE(n142), .Y(F_IO_A[1]) );
  TBUFXL \F_IO_A_tri[5]  ( .A(n198), .OE(n142), .Y(F_IO_A[5]) );
  TBUFXL \F_IO_A_tri[3]  ( .A(n146), .OE(n142), .Y(F_IO_A[3]) );
  TBUFXL \F_IO_A_tri[7]  ( .A(n141), .OE(n142), .Y(F_IO_A[7]) );
  TBUFXL \F_IO_A_tri[4]  ( .A(n214), .OE(n142), .Y(F_IO_A[4]) );
  CLKINVX1 U3 ( .A(1'b0), .Y(F_REN_B) );
  CLKINVX1 U5 ( .A(1'b1), .Y(F_IO_B_READING) );
  CLKINVX1 U7 ( .A(state[3]), .Y(n225) );
  CLKINVX1 U8 ( .A(state[4]), .Y(n236) );
  NAND2X1 U9 ( .A(n206), .B(n115), .Y(n138) );
  CLKINVX1 U10 ( .A(n69), .Y(n233) );
  CLKINVX1 U11 ( .A(n87), .Y(n228) );
  CLKINVX1 U12 ( .A(n82), .Y(n227) );
  CLKINVX1 U13 ( .A(n53), .Y(n224) );
  CLKINVX1 U14 ( .A(n56), .Y(n237) );
  OR2X1 U15 ( .A(n121), .B(n138), .Y(n132) );
  NAND2BX1 U16 ( .AN(n50), .B(n230), .Y(n115) );
  NOR2X1 U17 ( .A(n132), .B(n219), .Y(n141) );
  CLKINVX1 U18 ( .A(n85), .Y(n231) );
  CLKINVX1 U19 ( .A(n109), .Y(n230) );
  CLKINVX1 U20 ( .A(n46), .Y(n214) );
  NOR2BX1 U21 ( .AN(n145), .B(n138), .Y(n129) );
  NOR4X1 U22 ( .A(n204), .B(n87), .C(n225), .D(n138), .Y(n136) );
  NAND2X1 U23 ( .A(n235), .B(n229), .Y(n87) );
  NOR2X1 U24 ( .A(n217), .B(n132), .Y(n199) );
  NOR2X1 U25 ( .A(n215), .B(n132), .Y(n198) );
  NOR2X1 U26 ( .A(n210), .B(n132), .Y(n146) );
  XOR2X1 U27 ( .A(n222), .B(n220), .Y(n135) );
  CLKINVX1 U28 ( .A(n45), .Y(n212) );
  AOI2BB1X1 U29 ( .A0N(n98), .A1N(n72), .B0(n161), .Y(n101) );
  OAI21XL U30 ( .A0(n229), .A1(n98), .B0(n125), .Y(n161) );
  NOR3X1 U31 ( .A(n236), .B(n234), .C(n57), .Y(n82) );
  OAI22XL U32 ( .A0(n229), .A1(n47), .B0(n48), .B1(n49), .Y(n194) );
  AOI221XL U33 ( .A0(n50), .A1(n229), .B0(n226), .B1(n238), .C0(n51), .Y(n48)
         );
  NOR2X1 U34 ( .A(n225), .B(n89), .Y(n90) );
  NOR2X1 U35 ( .A(n225), .B(n208), .Y(n99) );
  NAND2X1 U36 ( .A(n234), .B(n236), .Y(n69) );
  NOR3X1 U37 ( .A(n236), .B(n237), .C(n109), .Y(n84) );
  OAI21XL U38 ( .A0(n228), .A1(n69), .B0(n125), .Y(N251) );
  NAND2X1 U39 ( .A(n232), .B(n225), .Y(n88) );
  AOI2BB1X1 U40 ( .A0N(n108), .A1N(n50), .B0(n205), .Y(n91) );
  NOR2X1 U41 ( .A(n237), .B(n109), .Y(n108) );
  NOR2X1 U42 ( .A(n88), .B(n236), .Y(n53) );
  AND2X2 U43 ( .A(n91), .B(n92), .Y(n89) );
  NAND2X1 U44 ( .A(n47), .B(n206), .Y(n49) );
  NAND2X1 U45 ( .A(n233), .B(n235), .Y(n98) );
  NAND2X1 U46 ( .A(n125), .B(n69), .Y(n162) );
  OAI222XL U47 ( .A0(n225), .A1(n231), .B0(n224), .B1(n54), .C0(n227), .C1(
        n237), .Y(n73) );
  OR2X1 U48 ( .A(n65), .B(n84), .Y(n81) );
  CLKINVX1 U49 ( .A(n79), .Y(n226) );
  CLKINVX1 U50 ( .A(n59), .Y(n232) );
  NAND2X1 U51 ( .A(n78), .B(n241), .Y(n56) );
  CLKINVX1 U52 ( .A(n205), .Y(n206) );
  CLKINVX1 U53 ( .A(n58), .Y(n238) );
  OAI31XL U54 ( .A0(n225), .A1(n137), .A2(n138), .B0(n46), .Y(n153) );
  AOI211X1 U55 ( .A0(F_IO_A[4]), .A1(n204), .B0(n87), .C0(n139), .Y(n137) );
  AOI21X1 U56 ( .A0(n135), .A1(n223), .B0(n204), .Y(n139) );
  NAND3BX1 U57 ( .AN(n198), .B(n130), .C(n140), .Y(n152) );
  AOI22X1 U58 ( .A0(F_IO_A[5]), .A1(n129), .B0(n136), .B1(counter[1]), .Y(n140) );
  NAND3BX1 U59 ( .AN(n149), .B(n127), .C(n128), .Y(n157) );
  AOI32X1 U60 ( .A0(n223), .A1(n220), .A2(n221), .B0(F_IO_A[0]), .B1(n129), 
        .Y(n128) );
  CLKINVX1 U61 ( .A(n130), .Y(n221) );
  NAND3BX1 U62 ( .AN(n197), .B(n143), .C(n144), .Y(n151) );
  OAI31XL U63 ( .A0(n220), .A1(counter[2]), .A2(counter[0]), .B0(n136), .Y(
        n143) );
  NAND2X1 U64 ( .A(F_IO_A[6]), .B(n129), .Y(n144) );
  NAND3BX1 U65 ( .AN(n146), .B(n127), .C(n134), .Y(n154) );
  NAND2X1 U66 ( .A(F_IO_A[3]), .B(n129), .Y(n134) );
  AO21X1 U67 ( .A0(F_IO_A[2]), .A1(n129), .B0(n133), .Y(n155) );
  OAI31XL U68 ( .A0(n130), .A1(counter[0]), .A2(n220), .B0(n45), .Y(n133) );
  AO21X1 U69 ( .A0(F_IO_A[1]), .A1(n129), .B0(n131), .Y(n156) );
  OAI31XL U70 ( .A0(n130), .A1(counter[1]), .A2(n223), .B0(n216), .Y(n131) );
  CLKINVX1 U71 ( .A(n199), .Y(n216) );
  CLKINVX1 U72 ( .A(n147), .Y(n218) );
  AOI211X1 U73 ( .A0(F_IO_A[7]), .A1(n145), .B0(n148), .C0(n138), .Y(n147) );
  OAI32X1 U74 ( .A0(state[1]), .A1(state[3]), .A2(state[2]), .B0(n121), .B1(
        n219), .Y(n148) );
  OAI21XL U75 ( .A0(n132), .A1(n213), .B0(n150), .Y(n149) );
  NAND4BX1 U76 ( .AN(n138), .B(page[8]), .C(state[1]), .D(state[2]), .Y(n150)
         );
  NAND2X1 U77 ( .A(n231), .B(state[2]), .Y(n109) );
  NAND2X1 U78 ( .A(state[1]), .B(state[0]), .Y(n85) );
  NAND2BX1 U79 ( .AN(n132), .B(page[4]), .Y(n46) );
  NAND2X1 U80 ( .A(state[4]), .B(n225), .Y(n50) );
  NAND3BX1 U81 ( .AN(n135), .B(counter[0]), .C(n136), .Y(n127) );
  NAND2BX1 U82 ( .AN(n132), .B(page[2]), .Y(n45) );
  NOR2BX1 U83 ( .AN(page[6]), .B(n132), .Y(n197) );
  CLKINVX1 U84 ( .A(state[1]), .Y(n235) );
  NAND2X1 U85 ( .A(n136), .B(counter[2]), .Y(n130) );
  CLKINVX1 U86 ( .A(state[0]), .Y(n229) );
  NOR3X1 U87 ( .A(n225), .B(n159), .C(n87), .Y(n145) );
  NAND2X1 U88 ( .A(state[2]), .B(n235), .Y(n121) );
  CLKINVX1 U89 ( .A(page[7]), .Y(n219) );
  CLKINVX1 U90 ( .A(page[5]), .Y(n215) );
  CLKINVX1 U91 ( .A(page[1]), .Y(n217) );
  CLKINVX1 U92 ( .A(page[0]), .Y(n213) );
  CLKINVX1 U93 ( .A(counter[1]), .Y(n220) );
  CLKINVX1 U94 ( .A(counter[2]), .Y(n222) );
  CLKINVX1 U95 ( .A(counter[0]), .Y(n223) );
  CLKINVX1 U96 ( .A(page[3]), .Y(n210) );
  AOI2BB1X1 U97 ( .A0N(n84), .A1N(state[3]), .B0(n205), .Y(n125) );
  OAI211X1 U98 ( .A0(n68), .A1(n69), .B0(state[3]), .C0(n70), .Y(n47) );
  AOI2BB2X1 U99 ( .B0(F_RB_B), .B1(state[0]), .A0N(F_RB_B), .A1N(n57), .Y(n68)
         );
  AOI31X1 U100 ( .A0(n235), .A1(n234), .A2(n71), .B0(n205), .Y(n70) );
  NAND3X1 U101 ( .A(n229), .B(n236), .C(n72), .Y(n71) );
  OAI21XL U102 ( .A0(state[2]), .A1(n87), .B0(n236), .Y(n103) );
  NAND2X1 U103 ( .A(state[1]), .B(n229), .Y(n57) );
  AOI22X1 U104 ( .A0(n230), .A1(n77), .B0(n226), .B1(n58), .Y(n76) );
  OAI21XL U105 ( .A0(n237), .A1(n80), .B0(state[4]), .Y(n77) );
  NOR2X1 U106 ( .A(n239), .B(n240), .Y(n80) );
  OAI22XL U107 ( .A0(n227), .A1(n56), .B0(state[4]), .B1(n57), .Y(n51) );
  OAI22XL U108 ( .A0(n235), .A1(n47), .B0(n52), .B1(n49), .Y(n193) );
  AOI211X1 U109 ( .A0(n53), .A1(n54), .B0(n55), .C0(n51), .Y(n52) );
  OAI32X1 U110 ( .A0(n58), .A1(state[2]), .A2(n57), .B0(state[4]), .B1(n59), 
        .Y(n55) );
  NAND2X1 U111 ( .A(F_REN_A), .B(F_RB_A), .Y(n96) );
  NOR3X1 U112 ( .A(n85), .B(state[2]), .C(n236), .Y(n65) );
  NAND4X1 U113 ( .A(counter[8]), .B(counter[7]), .C(n110), .D(n111), .Y(n72)
         );
  AND3X2 U114 ( .A(counter[6]), .B(counter[4]), .C(counter[5]), .Y(n110) );
  NOR4BX1 U115 ( .AN(counter[3]), .B(n112), .C(n220), .D(n222), .Y(n111) );
  NAND3BX1 U116 ( .AN(n158), .B(n96), .C(counter[0]), .Y(n112) );
  NAND4X1 U117 ( .A(state[3]), .B(n233), .C(F_RB_B), .D(n231), .Y(n92) );
  NAND3X1 U118 ( .A(state[3]), .B(n233), .C(n228), .Y(n95) );
  CLKINVX1 U119 ( .A(state[2]), .Y(n234) );
  NAND2X1 U120 ( .A(state[4]), .B(n86), .Y(n79) );
  OAI21XL U121 ( .A0(state[2]), .A1(n57), .B0(n87), .Y(n86) );
  NAND4BX1 U122 ( .AN(n92), .B(page[8]), .C(n117), .D(n118), .Y(n116) );
  NOR3X1 U123 ( .A(n219), .B(n213), .C(n210), .Y(n117) );
  NOR3X1 U124 ( .A(n119), .B(n215), .C(n217), .Y(n118) );
  NAND3X1 U125 ( .A(page[6]), .B(page[2]), .C(page[4]), .Y(n119) );
  NAND4X1 U126 ( .A(n224), .B(n206), .C(n79), .D(n83), .Y(n190) );
  AOI211X1 U127 ( .A0(state[3]), .A1(state[4]), .B0(n81), .C0(n82), .Y(n83) );
  NAND4X1 U128 ( .A(n120), .B(n121), .C(n88), .D(n57), .Y(n166) );
  NAND2X1 U129 ( .A(state[1]), .B(n234), .Y(n120) );
  OAI2BB2XL U130 ( .B0(n93), .B1(n94), .A0N(F_REN_A), .A1N(n93), .Y(n180) );
  NOR2X1 U131 ( .A(n95), .B(n96), .Y(n94) );
  NOR2BX1 U132 ( .AN(n97), .B(n161), .Y(n93) );
  AO21X1 U133 ( .A0(n96), .A1(n158), .B0(n98), .Y(n97) );
  OAI2BB2XL U134 ( .B0(n101), .B1(n104), .A0N(F_WEN_A), .A1N(n101), .Y(n169)
         );
  AOI32X1 U135 ( .A0(state[2]), .A1(n236), .A2(state[1]), .B0(n105), .B1(n229), 
        .Y(n104) );
  OAI2BB2XL U136 ( .B0(n101), .B1(n102), .A0N(F_CLE_A), .A1N(n101), .Y(n170)
         );
  NOR2X1 U137 ( .A(state[3]), .B(n103), .Y(n102) );
  OAI2BB2XL U138 ( .B0(n49), .B1(n60), .A0N(state[2]), .A1N(n61), .Y(n192) );
  OA21XL U139 ( .A0(n227), .A1(n56), .B0(n64), .Y(n60) );
  OAI21XL U140 ( .A0(n205), .A1(n62), .B0(n47), .Y(n61) );
  AOI33X1 U141 ( .A0(KEY[3]), .A1(n65), .A2(n66), .B0(n231), .B1(n225), .B2(
        n233), .Y(n64) );
  NAND3X1 U142 ( .A(n235), .B(n234), .C(state[3]), .Y(n105) );
  NAND2X1 U143 ( .A(state[0]), .B(n235), .Y(n59) );
  CLKINVX1 U144 ( .A(n100), .Y(n208) );
  OAI31XL U145 ( .A0(n95), .A1(n158), .A2(n211), .B0(n91), .Y(n100) );
  CLKINVX1 U146 ( .A(n96), .Y(n211) );
  AOI222XL U147 ( .A0(n228), .A1(n238), .B0(n63), .B1(n236), .C0(n54), .C1(
        n232), .Y(n62) );
  NAND2X1 U148 ( .A(state[1]), .B(n57), .Y(n63) );
  OAI2BB1X1 U149 ( .A0N(n67), .A1N(n206), .B0(n47), .Y(n191) );
  NAND4BX1 U150 ( .AN(n73), .B(n74), .C(n75), .D(n76), .Y(n67) );
  OAI21XL U151 ( .A0(KEY[1]), .A1(KEY[2]), .B0(n65), .Y(n74) );
  OAI2BB1X1 U152 ( .A0N(KEY[0]), .A1N(KEY[3]), .B0(n81), .Y(n75) );
  NAND2BX1 U154 ( .AN(n103), .B(n122), .Y(n165) );
  OAI21XL U155 ( .A0(F_RB_B), .A1(n85), .B0(state[3]), .Y(n122) );
  AO22X1 U156 ( .A0(counter[0]), .A1(n208), .B0(N164), .B1(n99), .Y(n178) );
  AO22X1 U157 ( .A0(n89), .A1(page[0]), .B0(N180), .B1(n90), .Y(n188) );
  AO22X1 U158 ( .A0(n89), .A1(page[8]), .B0(N188), .B1(n90), .Y(n181) );
  AO22X1 U159 ( .A0(counter[8]), .A1(n208), .B0(N172), .B1(n99), .Y(n171) );
  AO22X1 U160 ( .A0(counter[2]), .A1(n208), .B0(N166), .B1(n99), .Y(n177) );
  AO22X1 U161 ( .A0(counter[1]), .A1(n208), .B0(N165), .B1(n99), .Y(n179) );
  AO22X1 U162 ( .A0(n89), .A1(page[7]), .B0(N187), .B1(n90), .Y(n182) );
  AO22X1 U163 ( .A0(page[1]), .A1(n89), .B0(N181), .B1(n90), .Y(n189) );
  AO22X1 U164 ( .A0(page[5]), .A1(n89), .B0(N185), .B1(n90), .Y(n184) );
  AO22X1 U165 ( .A0(page[4]), .A1(n89), .B0(N184), .B1(n90), .Y(n185) );
  AO22X1 U166 ( .A0(page[6]), .A1(n89), .B0(N186), .B1(n90), .Y(n183) );
  AO22X1 U167 ( .A0(page[2]), .A1(n89), .B0(N182), .B1(n90), .Y(n187) );
  AO22X1 U168 ( .A0(counter[7]), .A1(n208), .B0(N171), .B1(n99), .Y(n172) );
  AO22X1 U169 ( .A0(n89), .A1(page[3]), .B0(N183), .B1(n90), .Y(n186) );
  AO22X1 U170 ( .A0(counter[5]), .A1(n208), .B0(N169), .B1(n99), .Y(n174) );
  AO22X1 U171 ( .A0(counter[4]), .A1(n208), .B0(N168), .B1(n99), .Y(n175) );
  AO22X1 U172 ( .A0(counter[6]), .A1(n208), .B0(N170), .B1(n99), .Y(n173) );
  AO22X1 U173 ( .A0(counter[3]), .A1(n208), .B0(N167), .B1(n99), .Y(n176) );
  OAI31XL U174 ( .A0(n126), .A1(n240), .A2(n115), .B0(n206), .Y(n160) );
  NAND3X1 U175 ( .A(KEY[0]), .B(KEY[2]), .C(KEY[3]), .Y(n126) );
  OAI32X1 U176 ( .A0(n207), .A1(state[4]), .A2(state[3]), .B0(n142), .B1(n106), 
        .Y(n168) );
  CLKINVX1 U177 ( .A(n106), .Y(n207) );
  OAI211X1 U178 ( .A0(n95), .A1(n72), .B0(n107), .C0(n91), .Y(n106) );
  NAND3X1 U179 ( .A(n225), .B(n236), .C(n230), .Y(n107) );
  OAI31XL U180 ( .A0(n225), .A1(n205), .A2(n209), .B0(n113), .Y(n167) );
  NAND2X1 U181 ( .A(done), .B(n209), .Y(n113) );
  CLKINVX1 U182 ( .A(n114), .Y(n209) );
  OAI211X1 U183 ( .A0(n56), .A1(n115), .B0(n116), .C0(n206), .Y(n114) );
  OAI31XL U184 ( .A0(n225), .A1(F_RB_B), .A2(n235), .B0(n124), .Y(n163) );
  OAI21XL U185 ( .A0(n96), .A1(n105), .B0(n229), .Y(n124) );
  OAI211X1 U186 ( .A0(n231), .A1(n234), .B0(n123), .C0(n88), .Y(n164) );
  NAND3X1 U187 ( .A(n234), .B(n225), .C(state[1]), .Y(n123) );
  NOR3X1 U188 ( .A(KEY[1]), .B(KEY[3]), .C(n239), .Y(n78) );
  NOR4X1 U189 ( .A(KEY[0]), .B(KEY[1]), .C(KEY[2]), .D(KEY[3]), .Y(n54) );
  NAND2X1 U190 ( .A(KEY[0]), .B(n78), .Y(n58) );
  NOR3X1 U191 ( .A(n241), .B(KEY[2]), .C(KEY[1]), .Y(n66) );
  CLKBUFX3 U194 ( .A(rst), .Y(n205) );
  CLKINVX1 U195 ( .A(KEY[2]), .Y(n239) );
  CLKINVX1 U196 ( .A(KEY[0]), .Y(n241) );
  CLKINVX1 U197 ( .A(KEY[1]), .Y(n240) );
endmodule


module NFC_2_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
endmodule


module NFC_2_DW01_inc_1 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
endmodule


module NFC_2 ( clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, 
        F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, 
        F_IO_A_READING, F_IO_B_READING, KEY );
  inout [7:0] F_IO_A;
  inout [7:0] F_IO_B;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B, F_IO_A_READING, F_IO_B_READING;
  wire   N164, N165, N166, N167, N168, N169, N170, N171, N172, N180, N181,
         N182, N183, N184, N185, N186, N187, N188, N251, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n242, n243, n244, n245, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n151, n152, n153, n154, n155, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402;
  wire   [4:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;

  NFC_2_DW01_inc_0 add_585 ( .A(page), .SUM({N188, N187, N186, N185, N184, 
        N183, N182, N181, N180}) );
  NFC_2_DW01_inc_1 add_531 ( .A(counter), .SUM({N172, N171, N170, N169, N168, 
        N167, N166, N165, N164}) );
  DFFQX1 \counter_reg[8]  ( .D(n221), .CK(clk), .Q(counter[8]) );
  DFFQX1 \counter_reg[6]  ( .D(n219), .CK(clk), .Q(counter[6]) );
  DFFQX1 \counter_reg[4]  ( .D(n217), .CK(clk), .Q(counter[4]) );
  DFFQX1 \counter_reg[5]  ( .D(n218), .CK(clk), .Q(counter[5]) );
  DFFQX1 \counter_reg[3]  ( .D(n216), .CK(clk), .Q(counter[3]) );
  DFFQX1 \counter_reg[7]  ( .D(n220), .CK(clk), .Q(counter[7]) );
  DFFQX1 F_CLE_A_reg ( .D(n222), .CK(clk), .Q(F_CLE_A) );
  DFFQX1 F_WEN_A_reg ( .D(n223), .CK(clk), .Q(F_WEN_A) );
  EDFFX1 F_ALE_A_reg ( .D(n226), .E(n231), .CK(clk), .Q(F_ALE_A) );
  EDFFX1 F_CLE_B_reg ( .D(n227), .E(N251), .CK(clk), .Q(F_CLE_B) );
  EDFFX1 F_WEN_B_reg ( .D(n229), .E(n230), .CK(clk), .Q(F_WEN_B), .QN(n233) );
  DFFQX1 done_reg ( .D(n225), .CK(clk), .Q(done) );
  EDFFX1 F_ALE_B_reg ( .D(n228), .E(N251), .CK(clk), .Q(F_ALE_B) );
  DFFQX1 F_REN_A_reg ( .D(n212), .CK(clk), .Q(F_REN_A) );
  DFFQX1 \page_reg[3]  ( .D(n206), .CK(clk), .Q(page[3]) );
  DFFQX1 \page_reg[6]  ( .D(n209), .CK(clk), .Q(page[6]) );
  DFFQX1 \page_reg[1]  ( .D(n203), .CK(clk), .Q(page[1]) );
  DFFQX1 \page_reg[2]  ( .D(n205), .CK(clk), .Q(page[2]) );
  DFFQX1 \page_reg[7]  ( .D(n210), .CK(clk), .Q(page[7]) );
  DFFQX1 \page_reg[8]  ( .D(n211), .CK(clk), .Q(page[8]) );
  DFFQX1 \page_reg[0]  ( .D(n204), .CK(clk), .Q(page[0]) );
  DFFQX1 \page_reg[4]  ( .D(n207), .CK(clk), .Q(page[4]) );
  DFFQX1 \page_reg[5]  ( .D(n208), .CK(clk), .Q(page[5]) );
  DFFQX1 \counter_reg[1]  ( .D(n213), .CK(clk), .Q(counter[1]) );
  DFFQX1 \counter_reg[2]  ( .D(n215), .CK(clk), .Q(counter[2]) );
  EDFFX1 WTMK_ACTIVE_reg ( .D(n364), .E(n232), .CK(clk), .Q(n148), .QN(n362)
         );
  DFFX1 F_IO_A_READING_reg ( .D(n224), .CK(clk), .Q(F_IO_A_READING), .QN(n244)
         );
  DFFQX1 \state_reg[2]  ( .D(n200), .CK(clk), .Q(state[2]) );
  DFFQX1 \state_reg[0]  ( .D(n198), .CK(clk), .Q(state[0]) );
  TBUFXL \F_IO_B_tri[7]  ( .A(n379), .OE(1'b1), .Y(F_IO_B[7]) );
  TBUFXL \F_IO_B_tri[1]  ( .A(n235), .OE(1'b1), .Y(F_IO_B[1]) );
  TBUFXL \F_IO_B_tri[0]  ( .A(n234), .OE(1'b1), .Y(F_IO_B[0]) );
  TBUFXL \F_IO_B_tri[3]  ( .A(n237), .OE(1'b1), .Y(F_IO_B[3]) );
  TBUFXL \F_IO_B_tri[5]  ( .A(n239), .OE(1'b1), .Y(F_IO_B[5]) );
  TBUFXL \F_IO_B_tri[4]  ( .A(n238), .OE(1'b1), .Y(F_IO_B[4]) );
  TBUFXL \F_IO_B_tri[2]  ( .A(n236), .OE(1'b1), .Y(F_IO_B[2]) );
  TBUFXL \F_IO_B_tri[6]  ( .A(n240), .OE(1'b1), .Y(F_IO_B[6]) );
  DFFQX1 \counter_reg[0]  ( .D(n214), .CK(clk), .Q(counter[0]) );
  TBUFXL \F_IO_A_tri[0]  ( .A(n242), .OE(n244), .Y(F_IO_A[0]) );
  DFFQX1 \state_reg[4]  ( .D(n202), .CK(clk), .Q(state[4]) );
  DFFQX1 \state_reg[1]  ( .D(n199), .CK(clk), .Q(state[1]) );
  TBUFXL \F_IO_A_tri[1]  ( .A(n154), .OE(n244), .Y(F_IO_A[1]) );
  TBUFXL \F_IO_A_tri[2]  ( .A(n155), .OE(n244), .Y(F_IO_A[2]) );
  TBUFXL \F_IO_A_tri[5]  ( .A(n153), .OE(n244), .Y(F_IO_A[5]) );
  TBUFXL \F_IO_A_tri[6]  ( .A(n151), .OE(n244), .Y(F_IO_A[6]) );
  TBUFXL \F_IO_A_tri[3]  ( .A(n243), .OE(n244), .Y(F_IO_A[3]) );
  TBUFXL \F_IO_A_tri[4]  ( .A(n152), .OE(n244), .Y(F_IO_A[4]) );
  TBUFXL \F_IO_A_tri[7]  ( .A(n245), .OE(n244), .Y(F_IO_A[7]) );
  DFFQX1 \state_reg[3]  ( .D(n201), .CK(clk), .Q(state[3]) );
  CLKINVX1 U3 ( .A(1'b0), .Y(F_REN_B) );
  CLKINVX1 U5 ( .A(1'b1), .Y(F_IO_B_READING) );
  CLKINVX1 U7 ( .A(state[3]), .Y(n395) );
  OAI31XL U8 ( .A0(n93), .A1(n233), .A2(n367), .B0(n96), .Y(n102) );
  CLKINVX1 U9 ( .A(state[4]), .Y(n397) );
  CLKINVX1 U10 ( .A(rst), .Y(n364) );
  CLKINVX1 U11 ( .A(n67), .Y(n389) );
  NAND2BX1 U12 ( .AN(n51), .B(n67), .Y(n47) );
  NOR2X1 U13 ( .A(rst), .B(n69), .Y(n67) );
  OAI21XL U14 ( .A0(n386), .A1(n72), .B0(n71), .Y(N251) );
  CLKINVX1 U15 ( .A(n72), .Y(n393) );
  NAND2X1 U16 ( .A(n71), .B(n72), .Y(n230) );
  CLKINVX1 U17 ( .A(n59), .Y(n386) );
  CLKINVX1 U18 ( .A(n90), .Y(n388) );
  CLKINVX1 U19 ( .A(n120), .Y(n391) );
  CLKINVX1 U20 ( .A(n112), .Y(n385) );
  CLKINVX1 U21 ( .A(n121), .Y(n399) );
  NOR2X1 U22 ( .A(n378), .B(n47), .Y(n155) );
  NOR2X1 U23 ( .A(n373), .B(n47), .Y(n152) );
  NAND2X1 U24 ( .A(n390), .B(n363), .Y(n90) );
  NOR2X1 U25 ( .A(n90), .B(n91), .Y(n69) );
  NOR2X1 U26 ( .A(n47), .B(n380), .Y(n245) );
  NAND2X1 U27 ( .A(n363), .B(n396), .Y(n51) );
  CLKINVX1 U28 ( .A(n80), .Y(n390) );
  NOR2BX1 U29 ( .AN(n49), .B(n389), .Y(n54) );
  NOR4X1 U30 ( .A(n362), .B(n395), .C(n59), .D(n389), .Y(n55) );
  NAND2X1 U31 ( .A(n396), .B(n387), .Y(n59) );
  NOR2X1 U32 ( .A(n376), .B(n47), .Y(n154) );
  NOR2X1 U33 ( .A(n374), .B(n47), .Y(n153) );
  NOR2X1 U34 ( .A(n371), .B(n47), .Y(n151) );
  NOR2X1 U35 ( .A(n370), .B(n47), .Y(n243) );
  AOI21X1 U36 ( .A0(n395), .A1(n123), .B0(rst), .Y(n71) );
  NOR2BX1 U37 ( .AN(n106), .B(n395), .Y(n107) );
  NAND2X1 U38 ( .A(n96), .B(n88), .Y(n106) );
  AOI2BB1X1 U39 ( .A0N(n100), .A1N(n94), .B0(n231), .Y(n97) );
  OAI21XL U40 ( .A0(n387), .A1(n100), .B0(n71), .Y(n231) );
  OAI21XL U41 ( .A0(n363), .A1(n59), .B0(n397), .Y(n78) );
  OAI21XL U42 ( .A0(n402), .A1(n398), .B0(n111), .Y(n125) );
  NOR3X1 U43 ( .A(n397), .B(n394), .C(n82), .Y(n112) );
  OAI22XL U44 ( .A0(n387), .A1(n114), .B0(n139), .B1(n127), .Y(n198) );
  AOI221XL U45 ( .A0(n91), .A1(n387), .B0(n400), .B1(n384), .C0(n136), .Y(n139) );
  CLKINVX1 U46 ( .A(n109), .Y(n384) );
  AOI2BB1X1 U47 ( .A0N(n108), .A1N(n91), .B0(rst), .Y(n96) );
  NOR2X1 U48 ( .A(n399), .B(n90), .Y(n108) );
  NOR2X1 U49 ( .A(n395), .B(n366), .Y(n101) );
  NAND2X1 U50 ( .A(n394), .B(n397), .Y(n72) );
  NOR3X1 U51 ( .A(n80), .B(n363), .C(n397), .Y(n126) );
  NAND2X1 U52 ( .A(n392), .B(n395), .Y(n77) );
  CLKINVX1 U53 ( .A(n363), .Y(n394) );
  NOR2X1 U54 ( .A(n77), .B(n397), .Y(n120) );
  OAI2BB2XL U55 ( .B0(n380), .B1(n106), .A0N(N187), .A1N(n107), .Y(n210) );
  OAI2BB2XL U56 ( .B0(n378), .B1(n106), .A0N(N182), .A1N(n107), .Y(n205) );
  OAI2BB2XL U57 ( .B0(n376), .B1(n106), .A0N(N181), .A1N(n107), .Y(n203) );
  OAI2BB2XL U58 ( .B0(n374), .B1(n106), .A0N(N185), .A1N(n107), .Y(n208) );
  OAI2BB2XL U59 ( .B0(n373), .B1(n106), .A0N(N184), .A1N(n107), .Y(n207) );
  OAI2BB2XL U60 ( .B0(n371), .B1(n106), .A0N(N186), .A1N(n107), .Y(n209) );
  OAI2BB2XL U61 ( .B0(n370), .B1(n106), .A0N(N183), .A1N(n107), .Y(n206) );
  OAI2BB2XL U62 ( .B0(n381), .B1(n102), .A0N(N165), .A1N(n101), .Y(n213) );
  NAND2X1 U63 ( .A(n114), .B(n364), .Y(n127) );
  NOR3X1 U64 ( .A(n368), .B(n380), .C(n370), .Y(n86) );
  OAI21XL U65 ( .A0(rst), .A1(n113), .B0(n114), .Y(n201) );
  NOR4X1 U66 ( .A(n115), .B(n116), .C(n117), .D(n118), .Y(n113) );
  OAI22XL U67 ( .A0(n399), .A1(n385), .B0(n119), .B1(n391), .Y(n117) );
  NAND2X1 U68 ( .A(n124), .B(n125), .Y(n115) );
  NAND2BX1 U69 ( .AN(n126), .B(n123), .Y(n111) );
  CLKINVX1 U70 ( .A(n102), .Y(n366) );
  NAND2X1 U71 ( .A(n393), .B(n396), .Y(n100) );
  CLKINVX1 U72 ( .A(n138), .Y(n392) );
  NAND2X1 U73 ( .A(n141), .B(n402), .Y(n121) );
  CLKINVX1 U74 ( .A(n137), .Y(n400) );
  NAND3BX1 U75 ( .AN(n153), .B(n56), .C(n57), .Y(n239) );
  AOI22X1 U76 ( .A0(F_IO_A[5]), .A1(n54), .B0(n55), .B1(counter[1]), .Y(n57)
         );
  NAND3BX1 U77 ( .AN(n242), .B(n62), .C(n66), .Y(n234) );
  AOI32X1 U78 ( .A0(n383), .A1(n381), .A2(n382), .B0(F_IO_A[0]), .B1(n54), .Y(
        n66) );
  CLKINVX1 U79 ( .A(n56), .Y(n382) );
  AO21X1 U80 ( .A0(F_IO_A[2]), .A1(n54), .B0(n64), .Y(n236) );
  OAI31XL U81 ( .A0(n56), .A1(counter[0]), .A2(n381), .B0(n377), .Y(n64) );
  CLKINVX1 U82 ( .A(n155), .Y(n377) );
  AO21X1 U83 ( .A0(F_IO_A[1]), .A1(n54), .B0(n65), .Y(n235) );
  OAI31XL U84 ( .A0(n56), .A1(counter[1]), .A2(n383), .B0(n375), .Y(n65) );
  CLKINVX1 U85 ( .A(n154), .Y(n375) );
  NAND3BX1 U86 ( .AN(n151), .B(n52), .C(n53), .Y(n240) );
  OAI31XL U87 ( .A0(n381), .A1(counter[2]), .A2(counter[0]), .B0(n55), .Y(n52)
         );
  NAND2X1 U88 ( .A(F_IO_A[6]), .B(n54), .Y(n53) );
  NAND3BX1 U89 ( .AN(n243), .B(n62), .C(n63), .Y(n237) );
  NAND2X1 U90 ( .A(F_IO_A[3]), .B(n54), .Y(n63) );
  OAI31XL U91 ( .A0(n395), .A1(n58), .A2(n389), .B0(n372), .Y(n238) );
  CLKINVX1 U92 ( .A(n152), .Y(n372) );
  AOI211X1 U93 ( .A0(F_IO_A[4]), .A1(n362), .B0(n59), .C0(n60), .Y(n58) );
  AOI2BB1X1 U94 ( .A0N(n61), .A1N(counter[0]), .B0(n362), .Y(n60) );
  CLKINVX1 U95 ( .A(n48), .Y(n379) );
  AOI211X1 U96 ( .A0(F_IO_A[7]), .A1(n49), .B0(n50), .C0(n389), .Y(n48) );
  OAI32X1 U97 ( .A0(state[1]), .A1(state[3]), .A2(n363), .B0(n51), .B1(n380), 
        .Y(n50) );
  OAI21XL U98 ( .A0(n47), .A1(n369), .B0(n68), .Y(n242) );
  NAND4X1 U99 ( .A(page[8]), .B(n67), .C(state[1]), .D(n363), .Y(n68) );
  NAND2X1 U100 ( .A(state[1]), .B(state[0]), .Y(n80) );
  CLKINVX1 U101 ( .A(state[1]), .Y(n396) );
  NAND2X1 U102 ( .A(state[4]), .B(n395), .Y(n91) );
  CLKBUFX3 U103 ( .A(state[2]), .Y(n363) );
  NAND3X1 U104 ( .A(n61), .B(n55), .C(counter[0]), .Y(n62) );
  CLKINVX1 U105 ( .A(state[0]), .Y(n387) );
  NAND2X1 U106 ( .A(counter[2]), .B(n55), .Y(n56) );
  NOR3X1 U107 ( .A(n59), .B(n148), .C(n395), .Y(n49) );
  XOR2X1 U108 ( .A(counter[2]), .B(n381), .Y(n61) );
  CLKINVX1 U109 ( .A(page[7]), .Y(n380) );
  CLKINVX1 U110 ( .A(page[1]), .Y(n376) );
  CLKINVX1 U111 ( .A(page[2]), .Y(n378) );
  CLKINVX1 U112 ( .A(page[0]), .Y(n369) );
  CLKINVX1 U113 ( .A(page[5]), .Y(n374) );
  CLKINVX1 U114 ( .A(page[4]), .Y(n373) );
  CLKINVX1 U115 ( .A(counter[1]), .Y(n381) );
  CLKINVX1 U116 ( .A(counter[0]), .Y(n383) );
  CLKINVX1 U117 ( .A(page[3]), .Y(n370) );
  CLKINVX1 U118 ( .A(page[6]), .Y(n371) );
  OAI22XL U119 ( .A0(state[4]), .A1(n90), .B0(n400), .B1(n109), .Y(n118) );
  OAI22XL U120 ( .A0(n390), .A1(n395), .B0(n122), .B1(n123), .Y(n116) );
  AND2X2 U121 ( .A(KEY[1]), .B(KEY[2]), .Y(n122) );
  OAI211X1 U122 ( .A0(n142), .A1(n72), .B0(state[3]), .C0(n143), .Y(n114) );
  AOI2BB2X1 U123 ( .B0(F_RB_B), .B1(state[0]), .A0N(F_RB_B), .A1N(n82), .Y(
        n142) );
  AOI31X1 U124 ( .A0(n396), .A1(n394), .A2(n144), .B0(rst), .Y(n143) );
  NAND3X1 U125 ( .A(n387), .B(n397), .C(n94), .Y(n144) );
  NAND2X1 U126 ( .A(state[1]), .B(n387), .Y(n82) );
  NAND4BX1 U127 ( .AN(n145), .B(counter[8]), .C(counter[7]), .D(n146), .Y(n94)
         );
  AND3X2 U128 ( .A(counter[6]), .B(counter[4]), .C(counter[5]), .Y(n146) );
  NAND4BX1 U129 ( .AN(n147), .B(counter[3]), .C(counter[2]), .D(counter[0]), 
        .Y(n145) );
  NAND3BX1 U130 ( .AN(n233), .B(n75), .C(counter[1]), .Y(n147) );
  OAI22XL U131 ( .A0(n121), .A1(n385), .B0(state[4]), .B1(n82), .Y(n136) );
  CLKINVX1 U132 ( .A(n75), .Y(n367) );
  OAI22XL U133 ( .A0(n396), .A1(n114), .B0(n134), .B1(n127), .Y(n199) );
  AOI211X1 U134 ( .A0(n119), .A1(n120), .B0(n135), .C0(n136), .Y(n134) );
  OAI32X1 U135 ( .A0(n137), .A1(n363), .A2(n82), .B0(state[4]), .B1(n138), .Y(
        n135) );
  NAND4X1 U136 ( .A(F_RB_B), .B(n393), .C(state[3]), .D(n390), .Y(n88) );
  NAND2X1 U137 ( .A(F_REN_A), .B(F_RB_A), .Y(n75) );
  NAND2X1 U138 ( .A(state[4]), .B(n140), .Y(n109) );
  OAI21XL U139 ( .A0(n363), .A1(n82), .B0(n59), .Y(n140) );
  NAND3X1 U140 ( .A(state[4]), .B(n121), .C(n388), .Y(n123) );
  NAND3X1 U141 ( .A(state[3]), .B(n386), .C(n393), .Y(n93) );
  NAND4X1 U142 ( .A(n391), .B(n364), .C(n109), .D(n110), .Y(n202) );
  AOI211X1 U143 ( .A0(state[3]), .A1(state[4]), .B0(n111), .C0(n112), .Y(n110)
         );
  NAND4X1 U144 ( .A(n81), .B(n51), .C(n77), .D(n82), .Y(n226) );
  NAND2X1 U145 ( .A(state[1]), .B(n394), .Y(n81) );
  OAI2BB2XL U146 ( .B0(n369), .B1(n106), .A0N(N180), .A1N(n107), .Y(n204) );
  OAI2BB2XL U147 ( .B0(n368), .B1(n106), .A0N(N188), .A1N(n107), .Y(n211) );
  OAI2BB2XL U148 ( .B0(n383), .B1(n102), .A0N(N164), .A1N(n101), .Y(n214) );
  OAI2BB2XL U149 ( .B0(n103), .B1(n104), .A0N(F_REN_A), .A1N(n103), .Y(n212)
         );
  NOR2X1 U150 ( .A(n75), .B(n93), .Y(n104) );
  NOR2BX1 U151 ( .AN(n105), .B(n231), .Y(n103) );
  AO21X1 U152 ( .A0(n75), .A1(n233), .B0(n100), .Y(n105) );
  OAI2BB2XL U154 ( .B0(n97), .B1(n98), .A0N(F_WEN_A), .A1N(n97), .Y(n223) );
  AOI32X1 U155 ( .A0(n363), .A1(n397), .A2(state[1]), .B0(n74), .B1(n387), .Y(
        n98) );
  OAI2BB2XL U156 ( .B0(n97), .B1(n99), .A0N(F_CLE_A), .A1N(n97), .Y(n222) );
  NOR2X1 U157 ( .A(state[3]), .B(n78), .Y(n99) );
  OAI2BB2XL U158 ( .B0(n127), .B1(n128), .A0N(n363), .A1N(n129), .Y(n200) );
  OA21XL U159 ( .A0(n121), .A1(n385), .B0(n132), .Y(n128) );
  OAI21XL U160 ( .A0(rst), .A1(n130), .B0(n114), .Y(n129) );
  NAND3X1 U161 ( .A(n396), .B(n394), .C(state[3]), .Y(n74) );
  NOR3X1 U162 ( .A(n89), .B(n376), .C(n378), .Y(n87) );
  NAND3X1 U163 ( .A(page[4]), .B(page[6]), .C(page[5]), .Y(n89) );
  NAND2X1 U164 ( .A(state[0]), .B(n396), .Y(n138) );
  AOI222XL U165 ( .A0(n400), .A1(n386), .B0(n131), .B1(n397), .C0(n119), .C1(
        n392), .Y(n130) );
  NAND2X1 U166 ( .A(state[1]), .B(n82), .Y(n131) );
  OAI31XL U167 ( .A0(n70), .A1(n401), .A2(n398), .B0(n364), .Y(n232) );
  NAND3X1 U168 ( .A(KEY[0]), .B(n69), .C(KEY[1]), .Y(n70) );
  CLKINVX1 U169 ( .A(page[8]), .Y(n368) );
  NAND2BX1 U170 ( .AN(n78), .B(n79), .Y(n227) );
  OAI21XL U171 ( .A0(F_RB_B), .A1(n80), .B0(state[3]), .Y(n79) );
  AO22X1 U172 ( .A0(counter[8]), .A1(n366), .B0(N172), .B1(n101), .Y(n221) );
  AO22X1 U173 ( .A0(counter[2]), .A1(n366), .B0(N166), .B1(n101), .Y(n215) );
  AO22X1 U174 ( .A0(counter[7]), .A1(n366), .B0(N171), .B1(n101), .Y(n220) );
  AO22X1 U175 ( .A0(counter[5]), .A1(n366), .B0(N169), .B1(n101), .Y(n218) );
  AO22X1 U176 ( .A0(counter[4]), .A1(n366), .B0(N168), .B1(n101), .Y(n217) );
  AO22X1 U177 ( .A0(counter[6]), .A1(n366), .B0(N170), .B1(n101), .Y(n219) );
  AO22X1 U178 ( .A0(counter[3]), .A1(n366), .B0(N167), .B1(n101), .Y(n216) );
  AOI33X1 U179 ( .A0(n126), .A1(KEY[3]), .A2(n133), .B0(n390), .B1(n395), .B2(
        n393), .Y(n132) );
  NOR3X1 U180 ( .A(n402), .B(KEY[2]), .C(KEY[1]), .Y(n133) );
  OAI32X1 U181 ( .A0(n365), .A1(state[4]), .A2(state[3]), .B0(n244), .B1(n92), 
        .Y(n224) );
  CLKINVX1 U182 ( .A(n92), .Y(n365) );
  OAI211X1 U183 ( .A0(n93), .A1(n94), .B0(n95), .C0(n96), .Y(n92) );
  NAND3X1 U184 ( .A(n395), .B(n397), .C(n388), .Y(n95) );
  OAI31XL U185 ( .A0(n395), .A1(rst), .A2(n83), .B0(n84), .Y(n225) );
  NAND2X1 U186 ( .A(done), .B(n83), .Y(n84) );
  AOI211X1 U187 ( .A0(n69), .A1(n399), .B0(n85), .C0(rst), .Y(n83) );
  NOR4BBX1 U188 ( .AN(n86), .BN(n87), .C(n88), .D(n369), .Y(n85) );
  OAI31XL U189 ( .A0(n395), .A1(F_RB_B), .A2(n396), .B0(n73), .Y(n229) );
  OAI21XL U190 ( .A0(n74), .A1(n75), .B0(n387), .Y(n73) );
  OAI211X1 U191 ( .A0(n390), .A1(n394), .B0(n76), .C0(n77), .Y(n228) );
  NAND3X1 U192 ( .A(n394), .B(n395), .C(state[1]), .Y(n76) );
  OAI21XL U193 ( .A0(KEY[1]), .A1(KEY[2]), .B0(n126), .Y(n124) );
  NOR4X1 U194 ( .A(KEY[0]), .B(KEY[1]), .C(KEY[2]), .D(KEY[3]), .Y(n119) );
  NOR3X1 U195 ( .A(KEY[1]), .B(KEY[3]), .C(n401), .Y(n141) );
  NAND2X1 U198 ( .A(n141), .B(KEY[0]), .Y(n137) );
  CLKINVX1 U199 ( .A(KEY[0]), .Y(n402) );
  CLKINVX1 U200 ( .A(KEY[2]), .Y(n401) );
  CLKINVX1 U201 ( .A(KEY[3]), .Y(n398) );
endmodule


module NFC_1_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
endmodule


module NFC_1_DW01_inc_1 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
endmodule


module NFC_1 ( clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, 
        F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, 
        F_IO_A_READING, F_IO_B_READING, KEY );
  inout [7:0] F_IO_A;
  inout [7:0] F_IO_B;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B, F_IO_A_READING, F_IO_B_READING;
  wire   N164, N165, N166, N167, N168, N169, N170, N171, N172, N180, N181,
         N182, N183, N184, N185, N186, N187, N188, N251, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n242, n243, n244, n245, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n151, n152, n153, n154, n155, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402;
  wire   [4:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;

  NFC_1_DW01_inc_0 add_585 ( .A(page), .SUM({N188, N187, N186, N185, N184, 
        N183, N182, N181, N180}) );
  NFC_1_DW01_inc_1 add_531 ( .A(counter), .SUM({N172, N171, N170, N169, N168, 
        N167, N166, N165, N164}) );
  DFFQX1 \counter_reg[8]  ( .D(n221), .CK(clk), .Q(counter[8]) );
  DFFQX1 \counter_reg[6]  ( .D(n219), .CK(clk), .Q(counter[6]) );
  DFFQX1 \counter_reg[4]  ( .D(n217), .CK(clk), .Q(counter[4]) );
  DFFQX1 \counter_reg[5]  ( .D(n218), .CK(clk), .Q(counter[5]) );
  DFFQX1 \counter_reg[3]  ( .D(n216), .CK(clk), .Q(counter[3]) );
  DFFQX1 \counter_reg[7]  ( .D(n220), .CK(clk), .Q(counter[7]) );
  DFFQX1 F_CLE_A_reg ( .D(n222), .CK(clk), .Q(F_CLE_A) );
  DFFQX1 F_WEN_A_reg ( .D(n223), .CK(clk), .Q(F_WEN_A) );
  EDFFX1 F_ALE_A_reg ( .D(n226), .E(n231), .CK(clk), .Q(F_ALE_A) );
  DFFQX1 done_reg ( .D(n225), .CK(clk), .Q(done) );
  EDFFX1 F_WEN_B_reg ( .D(n229), .E(n230), .CK(clk), .Q(F_WEN_B), .QN(n233) );
  EDFFX1 F_CLE_B_reg ( .D(n227), .E(N251), .CK(clk), .Q(F_CLE_B) );
  DFFQX1 F_REN_A_reg ( .D(n212), .CK(clk), .Q(F_REN_A) );
  EDFFX1 F_ALE_B_reg ( .D(n228), .E(N251), .CK(clk), .Q(F_ALE_B) );
  DFFQX1 \page_reg[3]  ( .D(n206), .CK(clk), .Q(page[3]) );
  DFFQX1 \page_reg[6]  ( .D(n209), .CK(clk), .Q(page[6]) );
  DFFQX1 \page_reg[5]  ( .D(n208), .CK(clk), .Q(page[5]) );
  DFFQX1 \page_reg[1]  ( .D(n203), .CK(clk), .Q(page[1]) );
  DFFQX1 \page_reg[2]  ( .D(n205), .CK(clk), .Q(page[2]) );
  DFFQX1 \page_reg[7]  ( .D(n210), .CK(clk), .Q(page[7]) );
  DFFQX1 \page_reg[8]  ( .D(n211), .CK(clk), .Q(page[8]) );
  DFFQX1 \page_reg[0]  ( .D(n204), .CK(clk), .Q(page[0]) );
  DFFQX1 \page_reg[4]  ( .D(n207), .CK(clk), .Q(page[4]) );
  DFFQX1 \counter_reg[1]  ( .D(n213), .CK(clk), .Q(counter[1]) );
  DFFQX1 \counter_reg[2]  ( .D(n215), .CK(clk), .Q(counter[2]) );
  EDFFX1 WTMK_ACTIVE_reg ( .D(n364), .E(n232), .CK(clk), .Q(n148), .QN(n362)
         );
  DFFQX1 \state_reg[2]  ( .D(n200), .CK(clk), .Q(state[2]) );
  DFFQX1 \state_reg[0]  ( .D(n198), .CK(clk), .Q(state[0]) );
  TBUFXL \F_IO_B_tri[6]  ( .A(n240), .OE(1'b1), .Y(F_IO_B[6]) );
  TBUFXL \F_IO_B_tri[3]  ( .A(n237), .OE(1'b1), .Y(F_IO_B[3]) );
  TBUFXL \F_IO_B_tri[5]  ( .A(n239), .OE(1'b1), .Y(F_IO_B[5]) );
  TBUFXL \F_IO_B_tri[7]  ( .A(n379), .OE(1'b1), .Y(F_IO_B[7]) );
  TBUFXL \F_IO_B_tri[1]  ( .A(n235), .OE(1'b1), .Y(F_IO_B[1]) );
  TBUFXL \F_IO_B_tri[2]  ( .A(n236), .OE(1'b1), .Y(F_IO_B[2]) );
  TBUFXL \F_IO_B_tri[0]  ( .A(n234), .OE(1'b1), .Y(F_IO_B[0]) );
  TBUFXL \F_IO_B_tri[4]  ( .A(n238), .OE(1'b1), .Y(F_IO_B[4]) );
  DFFQX1 \counter_reg[0]  ( .D(n214), .CK(clk), .Q(counter[0]) );
  DFFX1 F_IO_A_READING_reg ( .D(n224), .CK(clk), .Q(F_IO_A_READING), .QN(n244)
         );
  TBUFXL \F_IO_A_tri[0]  ( .A(n242), .OE(n244), .Y(F_IO_A[0]) );
  DFFQX1 \state_reg[4]  ( .D(n202), .CK(clk), .Q(state[4]) );
  DFFQX1 \state_reg[1]  ( .D(n199), .CK(clk), .Q(state[1]) );
  TBUFXL \F_IO_A_tri[2]  ( .A(n155), .OE(n244), .Y(F_IO_A[2]) );
  TBUFXL \F_IO_A_tri[1]  ( .A(n154), .OE(n244), .Y(F_IO_A[1]) );
  TBUFXL \F_IO_A_tri[5]  ( .A(n153), .OE(n244), .Y(F_IO_A[5]) );
  TBUFXL \F_IO_A_tri[6]  ( .A(n151), .OE(n244), .Y(F_IO_A[6]) );
  TBUFXL \F_IO_A_tri[3]  ( .A(n243), .OE(n244), .Y(F_IO_A[3]) );
  TBUFXL \F_IO_A_tri[7]  ( .A(n245), .OE(n244), .Y(F_IO_A[7]) );
  TBUFXL \F_IO_A_tri[4]  ( .A(n152), .OE(n244), .Y(F_IO_A[4]) );
  DFFQX1 \state_reg[3]  ( .D(n201), .CK(clk), .Q(state[3]) );
  CLKINVX1 U3 ( .A(1'b0), .Y(F_REN_B) );
  CLKINVX1 U5 ( .A(1'b1), .Y(F_IO_B_READING) );
  CLKINVX1 U7 ( .A(state[3]), .Y(n395) );
  OAI31XL U8 ( .A0(n93), .A1(n233), .A2(n367), .B0(n96), .Y(n102) );
  CLKINVX1 U9 ( .A(state[4]), .Y(n397) );
  CLKINVX1 U10 ( .A(rst), .Y(n364) );
  CLKINVX1 U11 ( .A(n67), .Y(n389) );
  NAND2BX1 U12 ( .AN(n51), .B(n67), .Y(n47) );
  NOR2X1 U13 ( .A(rst), .B(n69), .Y(n67) );
  OAI21XL U14 ( .A0(n386), .A1(n72), .B0(n71), .Y(N251) );
  CLKINVX1 U15 ( .A(n72), .Y(n393) );
  NAND2X1 U16 ( .A(n71), .B(n72), .Y(n230) );
  CLKINVX1 U17 ( .A(n59), .Y(n386) );
  CLKINVX1 U18 ( .A(n90), .Y(n388) );
  CLKINVX1 U19 ( .A(n120), .Y(n391) );
  CLKINVX1 U20 ( .A(n112), .Y(n385) );
  CLKINVX1 U21 ( .A(n121), .Y(n399) );
  NOR2X1 U22 ( .A(n373), .B(n47), .Y(n152) );
  NAND2X1 U23 ( .A(n390), .B(n363), .Y(n90) );
  NOR2X1 U24 ( .A(n90), .B(n91), .Y(n69) );
  NOR2X1 U25 ( .A(n47), .B(n380), .Y(n245) );
  NAND2X1 U26 ( .A(n363), .B(n396), .Y(n51) );
  CLKINVX1 U27 ( .A(n80), .Y(n390) );
  NOR2BX1 U28 ( .AN(n49), .B(n389), .Y(n54) );
  NOR4X1 U29 ( .A(n362), .B(n395), .C(n59), .D(n389), .Y(n55) );
  NAND2X1 U30 ( .A(n396), .B(n387), .Y(n59) );
  NOR2X1 U31 ( .A(n376), .B(n47), .Y(n154) );
  NOR2X1 U32 ( .A(n378), .B(n47), .Y(n155) );
  NOR2X1 U33 ( .A(n374), .B(n47), .Y(n153) );
  NOR2X1 U34 ( .A(n371), .B(n47), .Y(n151) );
  NOR2X1 U35 ( .A(n370), .B(n47), .Y(n243) );
  AOI21X1 U36 ( .A0(n395), .A1(n123), .B0(rst), .Y(n71) );
  NOR2BX1 U37 ( .AN(n106), .B(n395), .Y(n107) );
  NAND2X1 U38 ( .A(n96), .B(n88), .Y(n106) );
  AOI2BB1X1 U39 ( .A0N(n100), .A1N(n94), .B0(n231), .Y(n97) );
  OAI21XL U40 ( .A0(n387), .A1(n100), .B0(n71), .Y(n231) );
  OAI21XL U41 ( .A0(n363), .A1(n59), .B0(n397), .Y(n78) );
  OAI21XL U42 ( .A0(n402), .A1(n398), .B0(n111), .Y(n125) );
  NOR3X1 U43 ( .A(n397), .B(n394), .C(n82), .Y(n112) );
  OAI22XL U44 ( .A0(n387), .A1(n114), .B0(n139), .B1(n127), .Y(n198) );
  AOI221XL U45 ( .A0(n91), .A1(n387), .B0(n400), .B1(n384), .C0(n136), .Y(n139) );
  CLKINVX1 U46 ( .A(n109), .Y(n384) );
  AOI2BB1X1 U47 ( .A0N(n108), .A1N(n91), .B0(rst), .Y(n96) );
  NOR2X1 U48 ( .A(n399), .B(n90), .Y(n108) );
  NOR2X1 U49 ( .A(n395), .B(n366), .Y(n101) );
  NAND2X1 U50 ( .A(n394), .B(n397), .Y(n72) );
  NOR3X1 U51 ( .A(n80), .B(n363), .C(n397), .Y(n126) );
  NAND2X1 U52 ( .A(n392), .B(n395), .Y(n77) );
  CLKINVX1 U53 ( .A(n363), .Y(n394) );
  NOR2X1 U54 ( .A(n77), .B(n397), .Y(n120) );
  OAI2BB2XL U55 ( .B0(n380), .B1(n106), .A0N(N187), .A1N(n107), .Y(n210) );
  OAI2BB2XL U56 ( .B0(n378), .B1(n106), .A0N(N182), .A1N(n107), .Y(n205) );
  OAI2BB2XL U57 ( .B0(n376), .B1(n106), .A0N(N181), .A1N(n107), .Y(n203) );
  OAI2BB2XL U58 ( .B0(n374), .B1(n106), .A0N(N185), .A1N(n107), .Y(n208) );
  OAI2BB2XL U59 ( .B0(n373), .B1(n106), .A0N(N184), .A1N(n107), .Y(n207) );
  OAI2BB2XL U60 ( .B0(n371), .B1(n106), .A0N(N186), .A1N(n107), .Y(n209) );
  OAI2BB2XL U61 ( .B0(n370), .B1(n106), .A0N(N183), .A1N(n107), .Y(n206) );
  OAI2BB2XL U62 ( .B0(n381), .B1(n102), .A0N(N165), .A1N(n101), .Y(n213) );
  NAND2X1 U63 ( .A(n114), .B(n364), .Y(n127) );
  NOR3X1 U64 ( .A(n368), .B(n380), .C(n370), .Y(n86) );
  OAI21XL U65 ( .A0(rst), .A1(n113), .B0(n114), .Y(n201) );
  NOR4X1 U66 ( .A(n115), .B(n116), .C(n117), .D(n118), .Y(n113) );
  OAI22XL U67 ( .A0(n399), .A1(n385), .B0(n119), .B1(n391), .Y(n117) );
  NAND2X1 U68 ( .A(n124), .B(n125), .Y(n115) );
  NAND2BX1 U69 ( .AN(n126), .B(n123), .Y(n111) );
  CLKINVX1 U70 ( .A(n102), .Y(n366) );
  NAND2X1 U71 ( .A(n393), .B(n396), .Y(n100) );
  CLKINVX1 U72 ( .A(n138), .Y(n392) );
  NAND2X1 U73 ( .A(n141), .B(n402), .Y(n121) );
  CLKINVX1 U74 ( .A(n137), .Y(n400) );
  OAI31XL U75 ( .A0(n395), .A1(n58), .A2(n389), .B0(n372), .Y(n238) );
  CLKINVX1 U76 ( .A(n152), .Y(n372) );
  AOI211X1 U77 ( .A0(F_IO_A[4]), .A1(n362), .B0(n59), .C0(n60), .Y(n58) );
  AOI2BB1X1 U78 ( .A0N(n61), .A1N(counter[0]), .B0(n362), .Y(n60) );
  NAND3BX1 U79 ( .AN(n153), .B(n56), .C(n57), .Y(n239) );
  AOI22X1 U80 ( .A0(F_IO_A[5]), .A1(n54), .B0(n55), .B1(counter[1]), .Y(n57)
         );
  NAND3BX1 U81 ( .AN(n242), .B(n62), .C(n66), .Y(n234) );
  AOI32X1 U82 ( .A0(n383), .A1(n381), .A2(n382), .B0(F_IO_A[0]), .B1(n54), .Y(
        n66) );
  CLKINVX1 U83 ( .A(n56), .Y(n382) );
  AO21X1 U84 ( .A0(F_IO_A[2]), .A1(n54), .B0(n64), .Y(n236) );
  OAI31XL U85 ( .A0(n56), .A1(counter[0]), .A2(n381), .B0(n377), .Y(n64) );
  CLKINVX1 U86 ( .A(n155), .Y(n377) );
  AO21X1 U87 ( .A0(F_IO_A[1]), .A1(n54), .B0(n65), .Y(n235) );
  OAI31XL U88 ( .A0(n56), .A1(counter[1]), .A2(n383), .B0(n375), .Y(n65) );
  CLKINVX1 U89 ( .A(n154), .Y(n375) );
  NAND3BX1 U90 ( .AN(n243), .B(n62), .C(n63), .Y(n237) );
  NAND2X1 U91 ( .A(F_IO_A[3]), .B(n54), .Y(n63) );
  NAND3BX1 U92 ( .AN(n151), .B(n52), .C(n53), .Y(n240) );
  OAI31XL U93 ( .A0(n381), .A1(counter[2]), .A2(counter[0]), .B0(n55), .Y(n52)
         );
  NAND2X1 U94 ( .A(F_IO_A[6]), .B(n54), .Y(n53) );
  CLKINVX1 U95 ( .A(n48), .Y(n379) );
  AOI211X1 U96 ( .A0(F_IO_A[7]), .A1(n49), .B0(n50), .C0(n389), .Y(n48) );
  OAI32X1 U97 ( .A0(state[1]), .A1(state[3]), .A2(n363), .B0(n51), .B1(n380), 
        .Y(n50) );
  OAI21XL U98 ( .A0(n47), .A1(n369), .B0(n68), .Y(n242) );
  NAND4X1 U99 ( .A(page[8]), .B(n67), .C(state[1]), .D(n363), .Y(n68) );
  NAND2X1 U100 ( .A(state[1]), .B(state[0]), .Y(n80) );
  CLKINVX1 U101 ( .A(state[1]), .Y(n396) );
  NAND2X1 U102 ( .A(state[4]), .B(n395), .Y(n91) );
  CLKBUFX3 U103 ( .A(state[2]), .Y(n363) );
  NAND3X1 U104 ( .A(n61), .B(n55), .C(counter[0]), .Y(n62) );
  CLKINVX1 U105 ( .A(state[0]), .Y(n387) );
  NAND2X1 U106 ( .A(counter[2]), .B(n55), .Y(n56) );
  NOR3X1 U107 ( .A(n59), .B(n148), .C(n395), .Y(n49) );
  XOR2X1 U108 ( .A(counter[2]), .B(n381), .Y(n61) );
  CLKINVX1 U109 ( .A(page[7]), .Y(n380) );
  CLKINVX1 U110 ( .A(page[1]), .Y(n376) );
  CLKINVX1 U111 ( .A(page[2]), .Y(n378) );
  CLKINVX1 U112 ( .A(page[0]), .Y(n369) );
  CLKINVX1 U113 ( .A(page[4]), .Y(n373) );
  CLKINVX1 U114 ( .A(counter[1]), .Y(n381) );
  CLKINVX1 U115 ( .A(counter[0]), .Y(n383) );
  CLKINVX1 U116 ( .A(page[3]), .Y(n370) );
  CLKINVX1 U117 ( .A(page[5]), .Y(n374) );
  CLKINVX1 U118 ( .A(page[6]), .Y(n371) );
  OAI22XL U119 ( .A0(state[4]), .A1(n90), .B0(n400), .B1(n109), .Y(n118) );
  OAI22XL U120 ( .A0(n390), .A1(n395), .B0(n122), .B1(n123), .Y(n116) );
  AND2X2 U121 ( .A(KEY[1]), .B(KEY[2]), .Y(n122) );
  OAI211X1 U122 ( .A0(n142), .A1(n72), .B0(state[3]), .C0(n143), .Y(n114) );
  AOI2BB2X1 U123 ( .B0(F_RB_B), .B1(state[0]), .A0N(F_RB_B), .A1N(n82), .Y(
        n142) );
  AOI31X1 U124 ( .A0(n396), .A1(n394), .A2(n144), .B0(rst), .Y(n143) );
  NAND3X1 U125 ( .A(n387), .B(n397), .C(n94), .Y(n144) );
  NAND2X1 U126 ( .A(state[1]), .B(n387), .Y(n82) );
  NAND4BX1 U127 ( .AN(n145), .B(counter[8]), .C(counter[7]), .D(n146), .Y(n94)
         );
  AND3X2 U128 ( .A(counter[6]), .B(counter[4]), .C(counter[5]), .Y(n146) );
  NAND4BX1 U129 ( .AN(n147), .B(counter[3]), .C(counter[2]), .D(counter[0]), 
        .Y(n145) );
  NAND3BX1 U130 ( .AN(n233), .B(n75), .C(counter[1]), .Y(n147) );
  OAI22XL U131 ( .A0(n121), .A1(n385), .B0(state[4]), .B1(n82), .Y(n136) );
  CLKINVX1 U132 ( .A(n75), .Y(n367) );
  OAI22XL U133 ( .A0(n396), .A1(n114), .B0(n134), .B1(n127), .Y(n199) );
  AOI211X1 U134 ( .A0(n119), .A1(n120), .B0(n135), .C0(n136), .Y(n134) );
  OAI32X1 U135 ( .A0(n137), .A1(n363), .A2(n82), .B0(state[4]), .B1(n138), .Y(
        n135) );
  NAND4X1 U136 ( .A(F_RB_B), .B(n393), .C(state[3]), .D(n390), .Y(n88) );
  NAND2X1 U137 ( .A(F_REN_A), .B(F_RB_A), .Y(n75) );
  NAND2X1 U138 ( .A(state[4]), .B(n140), .Y(n109) );
  OAI21XL U139 ( .A0(n363), .A1(n82), .B0(n59), .Y(n140) );
  NAND3X1 U140 ( .A(state[4]), .B(n121), .C(n388), .Y(n123) );
  NAND3X1 U141 ( .A(state[3]), .B(n386), .C(n393), .Y(n93) );
  NAND4X1 U142 ( .A(n391), .B(n364), .C(n109), .D(n110), .Y(n202) );
  AOI211X1 U143 ( .A0(state[3]), .A1(state[4]), .B0(n111), .C0(n112), .Y(n110)
         );
  NAND4X1 U144 ( .A(n81), .B(n51), .C(n77), .D(n82), .Y(n226) );
  NAND2X1 U145 ( .A(state[1]), .B(n394), .Y(n81) );
  OAI2BB2XL U146 ( .B0(n369), .B1(n106), .A0N(N180), .A1N(n107), .Y(n204) );
  OAI2BB2XL U147 ( .B0(n368), .B1(n106), .A0N(N188), .A1N(n107), .Y(n211) );
  OAI2BB2XL U148 ( .B0(n383), .B1(n102), .A0N(N164), .A1N(n101), .Y(n214) );
  OAI2BB2XL U149 ( .B0(n103), .B1(n104), .A0N(F_REN_A), .A1N(n103), .Y(n212)
         );
  NOR2X1 U150 ( .A(n75), .B(n93), .Y(n104) );
  NOR2BX1 U151 ( .AN(n105), .B(n231), .Y(n103) );
  AO21X1 U152 ( .A0(n75), .A1(n233), .B0(n100), .Y(n105) );
  OAI2BB2XL U154 ( .B0(n97), .B1(n98), .A0N(F_WEN_A), .A1N(n97), .Y(n223) );
  AOI32X1 U155 ( .A0(n363), .A1(n397), .A2(state[1]), .B0(n74), .B1(n387), .Y(
        n98) );
  OAI2BB2XL U156 ( .B0(n97), .B1(n99), .A0N(F_CLE_A), .A1N(n97), .Y(n222) );
  NOR2X1 U157 ( .A(state[3]), .B(n78), .Y(n99) );
  OAI2BB2XL U158 ( .B0(n127), .B1(n128), .A0N(n363), .A1N(n129), .Y(n200) );
  OA21XL U159 ( .A0(n121), .A1(n385), .B0(n132), .Y(n128) );
  OAI21XL U160 ( .A0(rst), .A1(n130), .B0(n114), .Y(n129) );
  NAND3X1 U161 ( .A(n396), .B(n394), .C(state[3]), .Y(n74) );
  NOR3X1 U162 ( .A(n89), .B(n376), .C(n378), .Y(n87) );
  NAND3X1 U163 ( .A(page[4]), .B(page[6]), .C(page[5]), .Y(n89) );
  NAND2X1 U164 ( .A(state[0]), .B(n396), .Y(n138) );
  AOI222XL U165 ( .A0(n400), .A1(n386), .B0(n131), .B1(n397), .C0(n119), .C1(
        n392), .Y(n130) );
  NAND2X1 U166 ( .A(state[1]), .B(n82), .Y(n131) );
  OAI31XL U167 ( .A0(n70), .A1(n401), .A2(n398), .B0(n364), .Y(n232) );
  NAND3X1 U168 ( .A(KEY[0]), .B(n69), .C(KEY[1]), .Y(n70) );
  CLKINVX1 U169 ( .A(page[8]), .Y(n368) );
  NAND2BX1 U170 ( .AN(n78), .B(n79), .Y(n227) );
  OAI21XL U171 ( .A0(F_RB_B), .A1(n80), .B0(state[3]), .Y(n79) );
  AO22X1 U172 ( .A0(counter[8]), .A1(n366), .B0(N172), .B1(n101), .Y(n221) );
  AO22X1 U173 ( .A0(counter[2]), .A1(n366), .B0(N166), .B1(n101), .Y(n215) );
  AO22X1 U174 ( .A0(counter[7]), .A1(n366), .B0(N171), .B1(n101), .Y(n220) );
  AO22X1 U175 ( .A0(counter[5]), .A1(n366), .B0(N169), .B1(n101), .Y(n218) );
  AO22X1 U176 ( .A0(counter[4]), .A1(n366), .B0(N168), .B1(n101), .Y(n217) );
  AO22X1 U177 ( .A0(counter[6]), .A1(n366), .B0(N170), .B1(n101), .Y(n219) );
  AO22X1 U178 ( .A0(counter[3]), .A1(n366), .B0(N167), .B1(n101), .Y(n216) );
  AOI33X1 U179 ( .A0(n126), .A1(KEY[3]), .A2(n133), .B0(n390), .B1(n395), .B2(
        n393), .Y(n132) );
  NOR3X1 U180 ( .A(n402), .B(KEY[2]), .C(KEY[1]), .Y(n133) );
  OAI32X1 U181 ( .A0(n365), .A1(state[4]), .A2(state[3]), .B0(n244), .B1(n92), 
        .Y(n224) );
  CLKINVX1 U182 ( .A(n92), .Y(n365) );
  OAI211X1 U183 ( .A0(n93), .A1(n94), .B0(n95), .C0(n96), .Y(n92) );
  NAND3X1 U184 ( .A(n395), .B(n397), .C(n388), .Y(n95) );
  OAI31XL U185 ( .A0(n395), .A1(rst), .A2(n83), .B0(n84), .Y(n225) );
  NAND2X1 U186 ( .A(done), .B(n83), .Y(n84) );
  AOI211X1 U187 ( .A0(n69), .A1(n399), .B0(n85), .C0(rst), .Y(n83) );
  NOR4BBX1 U188 ( .AN(n86), .BN(n87), .C(n88), .D(n369), .Y(n85) );
  OAI31XL U189 ( .A0(n395), .A1(F_RB_B), .A2(n396), .B0(n73), .Y(n229) );
  OAI21XL U190 ( .A0(n74), .A1(n75), .B0(n387), .Y(n73) );
  OAI211X1 U191 ( .A0(n390), .A1(n394), .B0(n76), .C0(n77), .Y(n228) );
  NAND3X1 U192 ( .A(n394), .B(n395), .C(state[1]), .Y(n76) );
  OAI21XL U193 ( .A0(KEY[1]), .A1(KEY[2]), .B0(n126), .Y(n124) );
  NOR4X1 U194 ( .A(KEY[0]), .B(KEY[1]), .C(KEY[2]), .D(KEY[3]), .Y(n119) );
  NOR3X1 U195 ( .A(KEY[1]), .B(KEY[3]), .C(n401), .Y(n141) );
  NAND2X1 U198 ( .A(n141), .B(KEY[0]), .Y(n137) );
  CLKINVX1 U199 ( .A(KEY[0]), .Y(n402) );
  CLKINVX1 U200 ( .A(KEY[2]), .Y(n401) );
  CLKINVX1 U201 ( .A(KEY[3]), .Y(n398) );
endmodule


module TMR_Simplex ( data_out, TMR_error, dataA_in, dataB_in, dataC_in, 
        A_error_ctrl, B_error_ctrl, C_error_ctrl, clk, reset );
  output [26:0] data_out;
  input [26:0] dataA_in;
  input [26:0] dataB_in;
  input [26:0] dataC_in;
  input A_error_ctrl, B_error_ctrl, C_error_ctrl, clk, reset;
  output TMR_error;
  wire   n196, n197, n199, n200, n23, n24, n25, n26, n30, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n198, n201, n202, n225, n226, n227, n228, n229, n230, n231;

  DFFRX1 C_fault_reg ( .D(n197), .CK(clk), .RN(n227), .Q(n202) );
  DFFRX1 B_fault_reg ( .D(n199), .CK(clk), .RN(n227), .QN(n225) );
  DFFRX1 A_fault_reg ( .D(n196), .CK(clk), .RN(n227), .Q(n226), .QN(n200) );
  OAI21XL U3 ( .A0(n25), .A1(n226), .B0(n196), .Y(n40) );
  CLKINVX1 U4 ( .A(B_error_ctrl), .Y(n230) );
  CLKINVX1 U5 ( .A(n86), .Y(n30) );
  CLKINVX1 U6 ( .A(n41), .Y(n26) );
  NAND2X1 U7 ( .A(n91), .B(n36), .Y(n86) );
  CLKINVX1 U8 ( .A(n84), .Y(n25) );
  CLKINVX1 U9 ( .A(n53), .Y(n23) );
  AOI2BB1X1 U10 ( .A0N(n84), .A1N(n35), .B0(n85), .Y(n41) );
  NAND2X1 U11 ( .A(n91), .B(n37), .Y(n35) );
  CLKINVX1 U12 ( .A(n40), .Y(n24) );
  XNOR2X1 U13 ( .A(n81), .B(n80), .Y(n144) );
  XNOR2X1 U14 ( .A(n80), .B(n82), .Y(n102) );
  OAI211X1 U15 ( .A0(n87), .A1(n88), .B0(n89), .C0(n90), .Y(n53) );
  NAND3X1 U16 ( .A(n35), .B(n86), .C(n25), .Y(n89) );
  NAND4X1 U17 ( .A(n128), .B(n129), .C(n130), .D(n131), .Y(n91) );
  NOR4X1 U18 ( .A(n148), .B(n149), .C(n150), .D(n151), .Y(n129) );
  NOR4X1 U19 ( .A(n156), .B(n157), .C(n158), .D(n159), .Y(n128) );
  NOR4X1 U20 ( .A(n132), .B(n133), .C(n134), .D(n135), .Y(n131) );
  NAND4X1 U21 ( .A(n101), .B(n102), .C(n103), .D(n104), .Y(n97) );
  XNOR2X1 U22 ( .A(n74), .B(n76), .Y(n103) );
  XNOR2X1 U23 ( .A(n48), .B(n46), .Y(n104) );
  XNOR2X1 U24 ( .A(n73), .B(n71), .Y(n101) );
  NAND4X1 U25 ( .A(n93), .B(n94), .C(n95), .D(n96), .Y(n36) );
  NOR4X1 U26 ( .A(n105), .B(n106), .C(n107), .D(n108), .Y(n95) );
  NOR4X1 U27 ( .A(n113), .B(n114), .C(n115), .D(n116), .Y(n94) );
  NOR4X1 U28 ( .A(n121), .B(n122), .C(n123), .D(n124), .Y(n93) );
  OAI2BB1X1 U29 ( .A0N(n37), .A1N(n30), .B0(n87), .Y(n84) );
  OAI222XL U30 ( .A0(n23), .A1(n71), .B0(n72), .B1(n40), .C0(n73), .C1(n41), 
        .Y(data_out[13]) );
  OAI222XL U31 ( .A0(n74), .A1(n23), .B0(n75), .B1(n40), .C0(n41), .C1(n76), 
        .Y(data_out[12]) );
  OAI222XL U32 ( .A0(n23), .A1(n77), .B0(n78), .B1(n40), .C0(n41), .C1(n79), 
        .Y(data_out[11]) );
  OAI222XL U33 ( .A0(n80), .A1(n23), .B0(n81), .B1(n40), .C0(n41), .C1(n82), 
        .Y(data_out[10]) );
  OAI222XL U34 ( .A0(n23), .A1(n38), .B0(n39), .B1(n40), .C0(n41), .C1(n42), 
        .Y(data_out[9]) );
  OAI222XL U35 ( .A0(n43), .A1(n23), .B0(n44), .B1(n40), .C0(n45), .C1(n41), 
        .Y(data_out[8]) );
  OAI222XL U36 ( .A0(n23), .A1(n46), .B0(n47), .B1(n40), .C0(n48), .C1(n41), 
        .Y(data_out[7]) );
  OAI222XL U37 ( .A0(n49), .A1(n23), .B0(n50), .B1(n40), .C0(n51), .C1(n41), 
        .Y(data_out[6]) );
  XNOR2X1 U38 ( .A(n79), .B(n77), .Y(n117) );
  XNOR2X1 U39 ( .A(n75), .B(n74), .Y(n155) );
  XNOR2X1 U40 ( .A(n49), .B(n50), .Y(n139) );
  XNOR2X1 U41 ( .A(n81), .B(n82), .Y(n174) );
  NAND4X1 U42 ( .A(n163), .B(n164), .C(n165), .D(n166), .Y(n37) );
  NOR4X1 U43 ( .A(n183), .B(n184), .C(n185), .D(n186), .Y(n164) );
  NOR4X1 U44 ( .A(n175), .B(n176), .C(n177), .D(n178), .Y(n165) );
  NOR4X1 U45 ( .A(n191), .B(n192), .C(n193), .D(n194), .Y(n163) );
  NAND4X1 U46 ( .A(n171), .B(n172), .C(n173), .D(n174), .Y(n167) );
  XNOR2X1 U47 ( .A(n75), .B(n76), .Y(n171) );
  XNOR2X1 U48 ( .A(n48), .B(n47), .Y(n173) );
  XNOR2X1 U49 ( .A(n73), .B(n72), .Y(n172) );
  XOR2X1 U50 ( .A(n49), .B(n51), .Y(n124) );
  XOR2X1 U51 ( .A(n77), .B(n78), .Y(n135) );
  XOR2X1 U52 ( .A(n39), .B(n42), .Y(n178) );
  XOR2X1 U53 ( .A(n43), .B(n44), .Y(n158) );
  XOR2X1 U54 ( .A(n78), .B(n79), .Y(n193) );
  XOR2X1 U55 ( .A(n45), .B(n44), .Y(n176) );
  NAND3X1 U56 ( .A(n30), .B(n37), .C(n87), .Y(n90) );
  NAND2X1 U57 ( .A(n225), .B(n35), .Y(n199) );
  NOR2X1 U58 ( .A(n225), .B(n226), .Y(n85) );
  OAI21XL U59 ( .A0(n87), .A1(n92), .B0(n90), .Y(TMR_error) );
  AOI222XL U60 ( .A0(n37), .A1(n226), .B0(n228), .B1(n91), .C0(n85), .C1(n36), 
        .Y(n92) );
  CLKINVX1 U61 ( .A(n88), .Y(n228) );
  NOR4X1 U62 ( .A(n97), .B(n98), .C(n99), .D(n100), .Y(n96) );
  XOR2X1 U63 ( .A(dataC_in[1]), .B(dataA_in[1]), .Y(n99) );
  XOR2X1 U64 ( .A(dataC_in[18]), .B(dataA_in[18]), .Y(n98) );
  XOR2X1 U65 ( .A(dataC_in[20]), .B(dataA_in[20]), .Y(n100) );
  NOR4X1 U66 ( .A(n140), .B(n141), .C(n142), .D(n143), .Y(n130) );
  XOR2X1 U67 ( .A(dataB_in[26]), .B(dataA_in[26]), .Y(n141) );
  XOR2X1 U68 ( .A(dataB_in[2]), .B(dataA_in[2]), .Y(n142) );
  XOR2X1 U69 ( .A(dataB_in[20]), .B(dataA_in[20]), .Y(n143) );
  NAND4X1 U70 ( .A(n144), .B(n145), .C(n146), .D(n147), .Y(n140) );
  XNOR2X1 U71 ( .A(dataA_in[15]), .B(dataB_in[15]), .Y(n145) );
  XNOR2X1 U72 ( .A(dataA_in[22]), .B(dataB_in[22]), .Y(n146) );
  XNOR2X1 U73 ( .A(n72), .B(n71), .Y(n147) );
  NOR2X1 U74 ( .A(dataA_in[10]), .B(A_error_ctrl), .Y(n80) );
  NAND2X1 U75 ( .A(dataC_in[10]), .B(n231), .Y(n82) );
  XNOR2X1 U76 ( .A(dataB_in[24]), .B(dataC_in[24]), .Y(n187) );
  XNOR2X1 U77 ( .A(dataA_in[23]), .B(dataC_in[23]), .Y(n112) );
  XNOR2X1 U78 ( .A(dataB_in[23]), .B(dataC_in[23]), .Y(n182) );
  NOR4X1 U79 ( .A(n167), .B(n168), .C(n169), .D(n170), .Y(n166) );
  XOR2X1 U80 ( .A(dataC_in[21]), .B(dataB_in[21]), .Y(n168) );
  XOR2X1 U81 ( .A(dataC_in[22]), .B(dataB_in[22]), .Y(n170) );
  XOR2X1 U82 ( .A(n51), .B(n50), .Y(n169) );
  NAND4X1 U83 ( .A(n117), .B(n118), .C(n119), .D(n120), .Y(n113) );
  XNOR2X1 U84 ( .A(dataA_in[25]), .B(dataC_in[25]), .Y(n120) );
  XNOR2X1 U85 ( .A(n42), .B(n38), .Y(n119) );
  XNOR2X1 U86 ( .A(n45), .B(n43), .Y(n118) );
  NAND4X1 U87 ( .A(n109), .B(n110), .C(n111), .D(n112), .Y(n105) );
  XNOR2X1 U88 ( .A(dataA_in[17]), .B(dataC_in[17]), .Y(n111) );
  XNOR2X1 U89 ( .A(dataA_in[26]), .B(dataC_in[26]), .Y(n109) );
  XNOR2X1 U90 ( .A(dataA_in[24]), .B(dataC_in[24]), .Y(n110) );
  NAND4X1 U91 ( .A(n179), .B(n180), .C(n181), .D(n182), .Y(n175) );
  XNOR2X1 U92 ( .A(dataB_in[14]), .B(dataC_in[14]), .Y(n180) );
  XNOR2X1 U93 ( .A(dataB_in[17]), .B(dataC_in[17]), .Y(n181) );
  XNOR2X1 U94 ( .A(dataB_in[16]), .B(dataC_in[16]), .Y(n179) );
  NAND4X1 U95 ( .A(n187), .B(n188), .C(n189), .D(n190), .Y(n183) );
  XNOR2X1 U96 ( .A(dataB_in[3]), .B(dataC_in[3]), .Y(n189) );
  XNOR2X1 U97 ( .A(dataB_in[26]), .B(dataC_in[26]), .Y(n190) );
  XNOR2X1 U98 ( .A(dataB_in[2]), .B(dataC_in[2]), .Y(n188) );
  NAND4X1 U99 ( .A(n136), .B(n137), .C(n138), .D(n139), .Y(n132) );
  XNOR2X1 U100 ( .A(dataA_in[17]), .B(dataB_in[17]), .Y(n136) );
  XNOR2X1 U101 ( .A(dataA_in[14]), .B(dataB_in[14]), .Y(n137) );
  XNOR2X1 U102 ( .A(dataA_in[16]), .B(dataB_in[16]), .Y(n138) );
  NAND4X1 U103 ( .A(n152), .B(n153), .C(n154), .D(n155), .Y(n148) );
  XNOR2X1 U104 ( .A(dataA_in[1]), .B(dataB_in[1]), .Y(n154) );
  XNOR2X1 U105 ( .A(n39), .B(n38), .Y(n153) );
  XNOR2X1 U106 ( .A(n47), .B(n46), .Y(n152) );
  NAND3X1 U107 ( .A(n160), .B(n161), .C(n162), .Y(n156) );
  XNOR2X1 U108 ( .A(dataA_in[5]), .B(dataB_in[5]), .Y(n161) );
  XNOR2X1 U109 ( .A(dataA_in[21]), .B(dataB_in[21]), .Y(n160) );
  XNOR2X1 U110 ( .A(dataA_in[23]), .B(dataB_in[23]), .Y(n162) );
  NOR2X1 U111 ( .A(dataC_in[6]), .B(C_error_ctrl), .Y(n51) );
  NOR2X1 U112 ( .A(dataB_in[8]), .B(B_error_ctrl), .Y(n44) );
  NOR2X1 U113 ( .A(dataA_in[8]), .B(A_error_ctrl), .Y(n43) );
  NOR2X1 U114 ( .A(dataC_in[8]), .B(C_error_ctrl), .Y(n45) );
  NOR2X1 U115 ( .A(dataA_in[6]), .B(A_error_ctrl), .Y(n49) );
  NOR2X1 U116 ( .A(dataA_in[12]), .B(A_error_ctrl), .Y(n74) );
  XOR2X1 U117 ( .A(dataB_in[18]), .B(dataA_in[18]), .Y(n151) );
  XOR2X1 U118 ( .A(dataC_in[19]), .B(dataA_in[19]), .Y(n116) );
  XOR2X1 U119 ( .A(dataC_in[19]), .B(dataB_in[19]), .Y(n194) );
  XOR2X1 U120 ( .A(dataC_in[20]), .B(dataB_in[20]), .Y(n186) );
  XOR2X1 U121 ( .A(dataC_in[25]), .B(dataB_in[25]), .Y(n185) );
  XOR2X1 U122 ( .A(dataB_in[19]), .B(dataA_in[19]), .Y(n134) );
  XOR2X1 U123 ( .A(dataC_in[21]), .B(dataA_in[21]), .Y(n115) );
  XOR2X1 U124 ( .A(dataC_in[22]), .B(dataA_in[22]), .Y(n114) );
  XOR2X1 U125 ( .A(dataB_in[25]), .B(dataA_in[25]), .Y(n157) );
  XOR2X1 U126 ( .A(dataC_in[18]), .B(dataB_in[18]), .Y(n184) );
  XOR2X1 U127 ( .A(dataB_in[24]), .B(dataA_in[24]), .Y(n149) );
  NOR2X1 U128 ( .A(dataC_in[13]), .B(C_error_ctrl), .Y(n73) );
  NOR2X1 U129 ( .A(dataC_in[7]), .B(C_error_ctrl), .Y(n48) );
  NOR2X1 U130 ( .A(dataB_in[10]), .B(B_error_ctrl), .Y(n81) );
  NOR2X1 U131 ( .A(dataB_in[12]), .B(B_error_ctrl), .Y(n75) );
  CLKINVX1 U132 ( .A(n64), .Y(data_out[1]) );
  AOI222XL U133 ( .A0(n53), .A1(dataA_in[1]), .B0(dataB_in[1]), .B1(n24), .C0(
        n26), .C1(dataC_in[1]), .Y(n64) );
  NAND2X1 U134 ( .A(dataB_in[11]), .B(n230), .Y(n78) );
  NAND2X1 U135 ( .A(dataA_in[11]), .B(n229), .Y(n77) );
  NAND2X1 U136 ( .A(dataB_in[6]), .B(n230), .Y(n50) );
  NAND2X1 U137 ( .A(dataC_in[12]), .B(n231), .Y(n76) );
  NAND2X1 U138 ( .A(dataA_in[13]), .B(n229), .Y(n71) );
  NAND2X1 U139 ( .A(dataA_in[7]), .B(n229), .Y(n46) );
  NAND2X1 U140 ( .A(dataA_in[9]), .B(n229), .Y(n38) );
  NAND2X1 U141 ( .A(dataB_in[9]), .B(n230), .Y(n39) );
  NAND2X1 U142 ( .A(dataC_in[11]), .B(n231), .Y(n79) );
  NAND2X1 U143 ( .A(dataC_in[9]), .B(n231), .Y(n42) );
  NAND2X1 U144 ( .A(dataB_in[13]), .B(n230), .Y(n72) );
  NAND2X1 U145 ( .A(dataB_in[7]), .B(n230), .Y(n47) );
  NAND2X1 U146 ( .A(n200), .B(n86), .Y(n196) );
  CLKINVX1 U147 ( .A(n58), .Y(data_out[25]) );
  AOI222XL U148 ( .A0(n53), .A1(dataA_in[25]), .B0(dataB_in[25]), .B1(n24), 
        .C0(n26), .C1(dataC_in[25]), .Y(n58) );
  CLKINVX1 U149 ( .A(n59), .Y(data_out[24]) );
  AOI222XL U150 ( .A0(n53), .A1(dataA_in[24]), .B0(dataB_in[24]), .B1(n24), 
        .C0(n26), .C1(dataC_in[24]), .Y(n59) );
  CLKINVX1 U151 ( .A(n60), .Y(data_out[23]) );
  AOI222XL U152 ( .A0(n53), .A1(dataA_in[23]), .B0(dataB_in[23]), .B1(n24), 
        .C0(n26), .C1(dataC_in[23]), .Y(n60) );
  CLKINVX1 U153 ( .A(n61), .Y(data_out[22]) );
  AOI222XL U154 ( .A0(n53), .A1(dataA_in[22]), .B0(dataB_in[22]), .B1(n24), 
        .C0(n26), .C1(dataC_in[22]), .Y(n61) );
  CLKINVX1 U155 ( .A(n62), .Y(data_out[21]) );
  AOI222XL U156 ( .A0(n53), .A1(dataA_in[21]), .B0(dataB_in[21]), .B1(n24), 
        .C0(n26), .C1(dataC_in[21]), .Y(n62) );
  CLKINVX1 U157 ( .A(n63), .Y(data_out[20]) );
  AOI222XL U158 ( .A0(n53), .A1(dataA_in[20]), .B0(dataB_in[20]), .B1(n24), 
        .C0(n26), .C1(dataC_in[20]), .Y(n63) );
  CLKINVX1 U159 ( .A(n65), .Y(data_out[19]) );
  AOI222XL U160 ( .A0(n53), .A1(dataA_in[19]), .B0(dataB_in[19]), .B1(n24), 
        .C0(n26), .C1(dataC_in[19]), .Y(n65) );
  CLKINVX1 U161 ( .A(n66), .Y(data_out[18]) );
  AOI222XL U162 ( .A0(n53), .A1(dataA_in[18]), .B0(dataB_in[18]), .B1(n24), 
        .C0(n26), .C1(dataC_in[18]), .Y(n66) );
  CLKINVX1 U163 ( .A(n56), .Y(data_out[2]) );
  AOI222XL U164 ( .A0(n53), .A1(dataA_in[2]), .B0(dataB_in[2]), .B1(n24), .C0(
        n26), .C1(dataC_in[2]), .Y(n56) );
  CLKINVX1 U165 ( .A(n55), .Y(data_out[3]) );
  AOI222XL U166 ( .A0(n53), .A1(dataA_in[3]), .B0(dataB_in[3]), .B1(n24), .C0(
        n26), .C1(dataC_in[3]), .Y(n55) );
  CLKINVX1 U167 ( .A(n70), .Y(data_out[14]) );
  AOI222XL U168 ( .A0(n53), .A1(dataA_in[14]), .B0(dataB_in[14]), .B1(n24), 
        .C0(n26), .C1(dataC_in[14]), .Y(n70) );
  CLKINVX1 U169 ( .A(n69), .Y(data_out[15]) );
  AOI222XL U170 ( .A0(n53), .A1(dataA_in[15]), .B0(dataB_in[15]), .B1(n24), 
        .C0(n26), .C1(dataC_in[15]), .Y(n69) );
  CLKINVX1 U171 ( .A(n57), .Y(data_out[26]) );
  AOI222XL U172 ( .A0(n53), .A1(dataA_in[26]), .B0(dataB_in[26]), .B1(n24), 
        .C0(n26), .C1(dataC_in[26]), .Y(n57) );
  AO21X1 U173 ( .A0(n36), .A1(n37), .B0(n202), .Y(n197) );
  NAND3X1 U174 ( .A(n125), .B(n126), .C(n127), .Y(n121) );
  XNOR2X1 U175 ( .A(dataA_in[14]), .B(dataC_in[14]), .Y(n125) );
  XNOR2X1 U176 ( .A(dataA_in[15]), .B(dataC_in[15]), .Y(n127) );
  XNOR2X1 U177 ( .A(dataA_in[16]), .B(dataC_in[16]), .Y(n126) );
  NAND3X1 U178 ( .A(n195), .B(n198), .C(n201), .Y(n191) );
  XNOR2X1 U179 ( .A(dataB_in[0]), .B(dataC_in[0]), .Y(n198) );
  XNOR2X1 U180 ( .A(dataB_in[5]), .B(dataC_in[5]), .Y(n195) );
  XNOR2X1 U181 ( .A(dataB_in[1]), .B(dataC_in[1]), .Y(n201) );
  XOR2X1 U182 ( .A(dataC_in[2]), .B(dataA_in[2]), .Y(n107) );
  XOR2X1 U183 ( .A(dataC_in[15]), .B(dataB_in[15]), .Y(n177) );
  XOR2X1 U184 ( .A(dataC_in[4]), .B(dataA_in[4]), .Y(n123) );
  XOR2X1 U185 ( .A(dataC_in[5]), .B(dataA_in[5]), .Y(n122) );
  XOR2X1 U186 ( .A(dataB_in[4]), .B(dataA_in[4]), .Y(n133) );
  XOR2X1 U187 ( .A(dataC_in[4]), .B(dataB_in[4]), .Y(n192) );
  NOR2X1 U188 ( .A(n88), .B(n202), .Y(n87) );
  NAND2X1 U189 ( .A(n200), .B(n225), .Y(n88) );
  CLKINVX1 U190 ( .A(C_error_ctrl), .Y(n231) );
  CLKINVX1 U191 ( .A(A_error_ctrl), .Y(n229) );
  CLKINVX1 U192 ( .A(n83), .Y(data_out[0]) );
  AOI222XL U193 ( .A0(n53), .A1(dataA_in[0]), .B0(dataB_in[0]), .B1(n24), .C0(
        n26), .C1(dataC_in[0]), .Y(n83) );
  CLKINVX1 U194 ( .A(n54), .Y(data_out[4]) );
  AOI222XL U195 ( .A0(n53), .A1(dataA_in[4]), .B0(dataB_in[4]), .B1(n24), .C0(
        n26), .C1(dataC_in[4]), .Y(n54) );
  CLKINVX1 U196 ( .A(n52), .Y(data_out[5]) );
  AOI222XL U197 ( .A0(n53), .A1(dataA_in[5]), .B0(dataB_in[5]), .B1(n24), .C0(
        n26), .C1(dataC_in[5]), .Y(n52) );
  CLKINVX1 U198 ( .A(n68), .Y(data_out[16]) );
  AOI222XL U199 ( .A0(n53), .A1(dataA_in[16]), .B0(dataB_in[16]), .B1(n24), 
        .C0(n26), .C1(dataC_in[16]), .Y(n68) );
  CLKINVX1 U200 ( .A(n67), .Y(data_out[17]) );
  AOI222XL U201 ( .A0(n53), .A1(dataA_in[17]), .B0(dataB_in[17]), .B1(n24), 
        .C0(n26), .C1(dataC_in[17]), .Y(n67) );
  CLKINVX1 U202 ( .A(reset), .Y(n227) );
  XOR2X1 U203 ( .A(dataC_in[0]), .B(dataA_in[0]), .Y(n108) );
  XOR2X1 U204 ( .A(dataB_in[0]), .B(dataA_in[0]), .Y(n159) );
  XOR2X1 U205 ( .A(dataB_in[3]), .B(dataA_in[3]), .Y(n150) );
  XOR2X1 U206 ( .A(dataC_in[3]), .B(dataA_in[3]), .Y(n106) );
endmodule


module NFC_TMR ( clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, 
        F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, KEY, 
        A_ERROR_CTRL, B_ERROR_CTRL, C_ERROR_CTRL, TMR_ERROR );
  inout [7:0] F_IO_A;
  inout [7:0] F_IO_B;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B, A_ERROR_CTRL, B_ERROR_CTRL, C_ERROR_CTRL;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B, TMR_ERROR;
  wire   data_A_26, data_A_17, data_A_16, data_A_15, data_A_14, data_B_26,
         data_B_17, data_B_16, data_B_15, data_B_14, data_C_26, data_C_17,
         data_C_16, data_C_15, data_C_14, data_out_13, data_out_12,
         data_out_11, data_out_10, data_out_9, data_out_8, data_out_7,
         data_out_6, data_out_1, data_out_0, n3, n4;
  wire   [7:0] OA_F_IO_A_input;
  wire   [7:0] OA_F_IO_B_input;
  wire   [7:0] OB_F_IO_A_input;
  wire   [7:0] OB_F_IO_B_input;
  wire   [7:0] OC_F_IO_A_input;
  wire   [7:0] OC_F_IO_B_input;
  wire   [5:0] data_A;
  wire   [5:0] data_B;
  wire   [5:0] data_C;
  wire   [25:18] data_out;

  NFC_0 OriNFC_A ( .clk(clk), .rst(rst), .done(data_A_26), .F_IO_A(
        OA_F_IO_A_input), .F_CLE_A(data_A_17), .F_ALE_A(data_A_16), .F_REN_A(
        data_A_15), .F_WEN_A(data_A_14), .F_RB_A(F_RB_A), .F_IO_B(
        OA_F_IO_B_input), .F_CLE_B(data_A[5]), .F_ALE_B(data_A[4]), .F_WEN_B(
        data_A[2]), .F_RB_B(F_RB_B), .F_IO_A_READING(data_A[1]), .KEY(KEY) );
  NFC_2 OriNFC_B ( .clk(clk), .rst(rst), .done(data_B_26), .F_IO_A(
        OB_F_IO_A_input), .F_CLE_A(data_B_17), .F_ALE_A(data_B_16), .F_REN_A(
        data_B_15), .F_WEN_A(data_B_14), .F_RB_A(F_RB_A), .F_IO_B(
        OB_F_IO_B_input), .F_CLE_B(data_B[5]), .F_ALE_B(data_B[4]), .F_WEN_B(
        data_B[2]), .F_RB_B(F_RB_B), .F_IO_A_READING(data_B[1]), .KEY(KEY) );
  NFC_1 OriNFC_C ( .clk(clk), .rst(rst), .done(data_C_26), .F_IO_A(
        OC_F_IO_A_input), .F_CLE_A(data_C_17), .F_ALE_A(data_C_16), .F_REN_A(
        data_C_15), .F_WEN_A(data_C_14), .F_RB_A(F_RB_A), .F_IO_B(
        OC_F_IO_B_input), .F_CLE_B(data_C[5]), .F_ALE_B(data_C[4]), .F_WEN_B(
        data_C[2]), .F_RB_B(F_RB_B), .F_IO_A_READING(data_C[1]), .KEY(KEY) );
  TMR_Simplex TMR ( .data_out({done, data_out, F_CLE_A, F_ALE_A, F_REN_A, 
        F_WEN_A, data_out_13, data_out_12, data_out_11, data_out_10, 
        data_out_9, data_out_8, data_out_7, data_out_6, F_CLE_B, F_ALE_B, 
        F_REN_B, F_WEN_B, data_out_1, data_out_0}), .TMR_error(TMR_ERROR), 
        .dataA_in({data_A_26, OA_F_IO_A_input, data_A_17, data_A_16, data_A_15, 
        data_A_14, OA_F_IO_B_input, data_A[5:4], 1'b1, data_A[2:1], 1'b0}), 
        .dataB_in({data_B_26, OB_F_IO_A_input, data_B_17, data_B_16, data_B_15, 
        data_B_14, OB_F_IO_B_input, data_B[5:4], 1'b1, data_B[2:1], 1'b0}), 
        .dataC_in({data_C_26, OC_F_IO_A_input, data_C_17, data_C_16, data_C_15, 
        data_C_14, OC_F_IO_B_input, data_C[5:4], 1'b1, data_C[2:1], 1'b0}), 
        .A_error_ctrl(A_ERROR_CTRL), .B_error_ctrl(B_ERROR_CTRL), 
        .C_error_ctrl(C_ERROR_CTRL), .clk(clk), .reset(rst) );
  TBUFXL \OB_F_IO_B_tri[7]  ( .A(F_IO_B[7]), .OE(1'b0), .Y(OB_F_IO_B_input[7])
         );
  TBUFXL \OA_F_IO_B_tri[7]  ( .A(F_IO_B[7]), .OE(1'b0), .Y(OA_F_IO_B_input[7])
         );
  TBUFXL \OC_F_IO_B_tri[4]  ( .A(F_IO_B[4]), .OE(1'b0), .Y(OC_F_IO_B_input[4])
         );
  TBUFXL \OB_F_IO_B_tri[1]  ( .A(F_IO_B[1]), .OE(1'b0), .Y(OB_F_IO_B_input[1])
         );
  TBUFXL \OA_F_IO_B_tri[1]  ( .A(F_IO_B[1]), .OE(1'b0), .Y(OA_F_IO_B_input[1])
         );
  TBUFXL \OC_F_IO_B_tri[6]  ( .A(F_IO_B[6]), .OE(1'b0), .Y(OC_F_IO_B_input[6])
         );
  TBUFXL \OC_F_IO_B_tri[3]  ( .A(F_IO_B[3]), .OE(1'b0), .Y(OC_F_IO_B_input[3])
         );
  TBUFXL \OB_F_IO_B_tri[0]  ( .A(F_IO_B[0]), .OE(1'b0), .Y(OB_F_IO_B_input[0])
         );
  TBUFXL \OB_F_IO_B_tri[3]  ( .A(F_IO_B[3]), .OE(1'b0), .Y(OB_F_IO_B_input[3])
         );
  TBUFXL \OA_F_IO_B_tri[3]  ( .A(F_IO_B[3]), .OE(1'b0), .Y(OA_F_IO_B_input[3])
         );
  TBUFXL \OC_F_IO_B_tri[5]  ( .A(F_IO_B[5]), .OE(1'b0), .Y(OC_F_IO_B_input[5])
         );
  TBUFXL \OB_F_IO_B_tri[5]  ( .A(F_IO_B[5]), .OE(1'b0), .Y(OB_F_IO_B_input[5])
         );
  TBUFXL \OA_F_IO_B_tri[5]  ( .A(F_IO_B[5]), .OE(1'b0), .Y(OA_F_IO_B_input[5])
         );
  TBUFXL \OC_F_IO_B_tri[7]  ( .A(F_IO_B[7]), .OE(1'b0), .Y(OC_F_IO_B_input[7])
         );
  TBUFXL \OB_F_IO_B_tri[4]  ( .A(F_IO_B[4]), .OE(1'b0), .Y(OB_F_IO_B_input[4])
         );
  TBUFXL \OA_F_IO_B_tri[4]  ( .A(F_IO_B[4]), .OE(1'b0), .Y(OA_F_IO_B_input[4])
         );
  TBUFXL \OC_F_IO_B_tri[1]  ( .A(F_IO_B[1]), .OE(1'b0), .Y(OC_F_IO_B_input[1])
         );
  TBUFXL \OC_F_IO_B_tri[2]  ( .A(F_IO_B[2]), .OE(1'b0), .Y(OC_F_IO_B_input[2])
         );
  TBUFXL \OB_F_IO_B_tri[2]  ( .A(F_IO_B[2]), .OE(1'b0), .Y(OB_F_IO_B_input[2])
         );
  TBUFXL \OA_F_IO_B_tri[2]  ( .A(F_IO_B[2]), .OE(1'b0), .Y(OA_F_IO_B_input[2])
         );
  TBUFXL \OB_F_IO_B_tri[6]  ( .A(F_IO_B[6]), .OE(1'b0), .Y(OB_F_IO_B_input[6])
         );
  TBUFXL \OA_F_IO_B_tri[6]  ( .A(F_IO_B[6]), .OE(1'b0), .Y(OA_F_IO_B_input[6])
         );
  TBUFXL \OC_F_IO_B_tri[0]  ( .A(F_IO_B[0]), .OE(1'b0), .Y(OC_F_IO_B_input[0])
         );
  TBUFXL \OA_F_IO_B_tri[0]  ( .A(F_IO_B[0]), .OE(1'b0), .Y(OA_F_IO_B_input[0])
         );
  TBUFXL \OA_F_IO_A_tri[7]  ( .A(F_IO_A[7]), .OE(data_A[1]), .Y(
        OA_F_IO_A_input[7]) );
  TBUFXL \OB_F_IO_A_tri[4]  ( .A(F_IO_A[4]), .OE(data_B[1]), .Y(
        OB_F_IO_A_input[4]) );
  TBUFXL \OC_F_IO_A_tri[7]  ( .A(F_IO_A[7]), .OE(data_C[1]), .Y(
        OC_F_IO_A_input[7]) );
  TBUFXL \OA_F_IO_A_tri[0]  ( .A(F_IO_A[0]), .OE(data_A[1]), .Y(
        OA_F_IO_A_input[0]) );
  TBUFXL \OB_F_IO_A_tri[7]  ( .A(F_IO_A[7]), .OE(data_B[1]), .Y(
        OB_F_IO_A_input[7]) );
  TBUFXL \OB_F_IO_A_tri[0]  ( .A(F_IO_A[0]), .OE(data_B[1]), .Y(
        OB_F_IO_A_input[0]) );
  TBUFXL \OC_F_IO_A_tri[0]  ( .A(F_IO_A[0]), .OE(data_C[1]), .Y(
        OC_F_IO_A_input[0]) );
  TBUFXL \OA_F_IO_A_tri[2]  ( .A(F_IO_A[2]), .OE(data_A[1]), .Y(
        OA_F_IO_A_input[2]) );
  TBUFXL \OA_F_IO_A_tri[1]  ( .A(F_IO_A[1]), .OE(data_A[1]), .Y(
        OA_F_IO_A_input[1]) );
  TBUFXL \OB_F_IO_A_tri[1]  ( .A(F_IO_A[1]), .OE(data_B[1]), .Y(
        OB_F_IO_A_input[1]) );
  TBUFXL \OB_F_IO_A_tri[2]  ( .A(F_IO_A[2]), .OE(data_B[1]), .Y(
        OB_F_IO_A_input[2]) );
  TBUFXL \OC_F_IO_A_tri[2]  ( .A(F_IO_A[2]), .OE(data_C[1]), .Y(
        OC_F_IO_A_input[2]) );
  TBUFXL \OC_F_IO_A_tri[1]  ( .A(F_IO_A[1]), .OE(data_C[1]), .Y(
        OC_F_IO_A_input[1]) );
  TBUFXL \OA_F_IO_A_tri[5]  ( .A(F_IO_A[5]), .OE(data_A[1]), .Y(
        OA_F_IO_A_input[5]) );
  TBUFXL \OB_F_IO_A_tri[5]  ( .A(F_IO_A[5]), .OE(data_B[1]), .Y(
        OB_F_IO_A_input[5]) );
  TBUFXL \OC_F_IO_A_tri[5]  ( .A(F_IO_A[5]), .OE(data_C[1]), .Y(
        OC_F_IO_A_input[5]) );
  TBUFXL \OA_F_IO_A_tri[4]  ( .A(F_IO_A[4]), .OE(data_A[1]), .Y(
        OA_F_IO_A_input[4]) );
  TBUFXL \OC_F_IO_A_tri[4]  ( .A(F_IO_A[4]), .OE(data_C[1]), .Y(
        OC_F_IO_A_input[4]) );
  TBUFXL \F_IO_A_tri[0]  ( .A(data_out[18]), .OE(n4), .Y(F_IO_A[0]) );
  TBUFXL \F_IO_A_tri[1]  ( .A(data_out[19]), .OE(n4), .Y(F_IO_A[1]) );
  TBUFXL \F_IO_A_tri[2]  ( .A(data_out[20]), .OE(n4), .Y(F_IO_A[2]) );
  TBUFXL \F_IO_A_tri[3]  ( .A(data_out[21]), .OE(n4), .Y(F_IO_A[3]) );
  TBUFXL \F_IO_A_tri[4]  ( .A(data_out[22]), .OE(n4), .Y(F_IO_A[4]) );
  TBUFXL \F_IO_A_tri[5]  ( .A(data_out[23]), .OE(n4), .Y(F_IO_A[5]) );
  TBUFXL \F_IO_A_tri[6]  ( .A(data_out[24]), .OE(n4), .Y(F_IO_A[6]) );
  TBUFXL \F_IO_A_tri[7]  ( .A(data_out[25]), .OE(n4), .Y(F_IO_A[7]) );
  TBUFXL \F_IO_B_tri[0]  ( .A(data_out_6), .OE(n3), .Y(F_IO_B[0]) );
  TBUFXL \F_IO_B_tri[1]  ( .A(data_out_7), .OE(n3), .Y(F_IO_B[1]) );
  TBUFXL \F_IO_B_tri[2]  ( .A(data_out_8), .OE(n3), .Y(F_IO_B[2]) );
  TBUFXL \F_IO_B_tri[3]  ( .A(data_out_9), .OE(n3), .Y(F_IO_B[3]) );
  TBUFXL \F_IO_B_tri[4]  ( .A(data_out_10), .OE(n3), .Y(F_IO_B[4]) );
  TBUFXL \F_IO_B_tri[5]  ( .A(data_out_11), .OE(n3), .Y(F_IO_B[5]) );
  TBUFXL \F_IO_B_tri[6]  ( .A(data_out_12), .OE(n3), .Y(F_IO_B[6]) );
  TBUFXL \F_IO_B_tri[7]  ( .A(data_out_13), .OE(n3), .Y(F_IO_B[7]) );
  TBUFXL \OB_F_IO_A_tri[3]  ( .A(F_IO_A[3]), .OE(data_B[1]), .Y(
        OB_F_IO_A_input[3]) );
  TBUFXL \OC_F_IO_A_tri[6]  ( .A(F_IO_A[6]), .OE(data_C[1]), .Y(
        OC_F_IO_A_input[6]) );
  TBUFXL \OC_F_IO_A_tri[3]  ( .A(F_IO_A[3]), .OE(data_C[1]), .Y(
        OC_F_IO_A_input[3]) );
  TBUFXL \OA_F_IO_A_tri[3]  ( .A(F_IO_A[3]), .OE(data_A[1]), .Y(
        OA_F_IO_A_input[3]) );
  TBUFXL \OA_F_IO_A_tri[6]  ( .A(F_IO_A[6]), .OE(data_A[1]), .Y(
        OA_F_IO_A_input[6]) );
  TBUFXL \OB_F_IO_A_tri[6]  ( .A(F_IO_A[6]), .OE(data_B[1]), .Y(
        OB_F_IO_A_input[6]) );
  CLKINVX1 U11 ( .A(data_out_1), .Y(n4) );
  CLKINVX1 U12 ( .A(data_out_0), .Y(n3) );
endmodule

