/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sat Sep  9 12:58:29 2023
/////////////////////////////////////////////////////////////


module NFC_0_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  XOR2X1 U1 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
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
  XOR2X1 U1 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module NFC_0 ( clk, rst, done, F_IO_A_IN, F_IO_A_OUT, F_CLE_A, F_ALE_A, 
        F_REN_A, F_WEN_A, F_RB_A, F_IO_B_IN, F_IO_B_OUT, F_CLE_B, F_ALE_B, 
        F_REN_B, F_WEN_B, F_RB_B, F_IO_A_READING, F_IO_B_READING, KEY );
  input [7:0] F_IO_A_IN;
  output [7:0] F_IO_A_OUT;
  input [7:0] F_IO_B_IN;
  output [7:0] F_IO_B_OUT;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B, F_IO_A_READING, F_IO_B_READING;
  wire   WTMK_ACTIVE, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N162, N163, N164, N165, N166, N167, N168, N169, N170, N227, N233, n8,
         n30, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n5, n6, n7, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n31, n32, n33, n34, n185, n186, n187;
  wire   [4:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;

  NFC_0_DW01_inc_0 add_585 ( .A(page), .SUM({N170, N169, N168, N167, N166, 
        N165, N164, N163, N162}) );
  NFC_0_DW01_inc_1 add_531 ( .A(counter), .SUM({N154, N153, N152, N151, N150, 
        N149, N148, N147, N146}) );
  EDFFX1 F_ALE_A_reg ( .D(n75), .E(n56), .CK(clk), .Q(F_ALE_A) );
  EDFFX1 F_ALE_B_reg ( .D(n69), .E(N233), .CK(clk), .Q(F_ALE_B) );
  EDFFX1 F_CLE_B_reg ( .D(n72), .E(N233), .CK(clk), .Q(F_CLE_B) );
  EDFFX1 WTMK_ACTIVE_reg ( .D(n34), .E(n35), .CK(clk), .Q(WTMK_ACTIVE), .QN(
        n30) );
  DFFQX1 F_CLE_A_reg ( .D(n160), .CK(clk), .Q(F_CLE_A) );
  DFFQX1 F_WEN_A_reg ( .D(n159), .CK(clk), .Q(F_WEN_A) );
  DFFQX1 F_IO_A_READING_reg ( .D(n158), .CK(clk), .Q(F_IO_A_READING) );
  DFFQX1 done_reg ( .D(n157), .CK(clk), .Q(done) );
  DFFQX1 \counter_reg[8]  ( .D(n161), .CK(clk), .Q(counter[8]) );
  DFFQX1 \page_reg[0]  ( .D(n178), .CK(clk), .Q(page[0]) );
  DFFQX1 F_REN_A_reg ( .D(n170), .CK(clk), .Q(F_REN_A) );
  DFFQX1 \counter_reg[6]  ( .D(n163), .CK(clk), .Q(counter[6]) );
  DFFQX1 \counter_reg[5]  ( .D(n164), .CK(clk), .Q(counter[5]) );
  DFFQX1 \counter_reg[7]  ( .D(n162), .CK(clk), .Q(counter[7]) );
  DFFQX1 \page_reg[8]  ( .D(n171), .CK(clk), .Q(page[8]) );
  EDFFX1 F_WEN_B_reg ( .D(n65), .E(n64), .CK(clk), .Q(F_WEN_B), .QN(n8) );
  DFFQX1 \counter_reg[3]  ( .D(n166), .CK(clk), .Q(counter[3]) );
  DFFQX1 \counter_reg[4]  ( .D(n165), .CK(clk), .Q(counter[4]) );
  DFFQX1 \page_reg[6]  ( .D(n173), .CK(clk), .Q(page[6]) );
  DFFQX1 \page_reg[4]  ( .D(n175), .CK(clk), .Q(page[4]) );
  DFFQX1 \page_reg[5]  ( .D(n174), .CK(clk), .Q(page[5]) );
  DFFQX1 \page_reg[3]  ( .D(n176), .CK(clk), .Q(page[3]) );
  DFFQX1 \page_reg[1]  ( .D(n179), .CK(clk), .Q(page[1]) );
  DFFQX1 \page_reg[2]  ( .D(n177), .CK(clk), .Q(page[2]) );
  DFFQX1 \page_reg[7]  ( .D(n172), .CK(clk), .Q(page[7]) );
  DFFQX1 \counter_reg[1]  ( .D(n169), .CK(clk), .Q(counter[1]) );
  DFFQX1 \counter_reg[0]  ( .D(n168), .CK(clk), .Q(counter[0]) );
  DFFQX1 \counter_reg[2]  ( .D(n167), .CK(clk), .Q(counter[2]) );
  DFFQX1 \state_reg[2]  ( .D(n182), .CK(clk), .Q(state[2]) );
  DFFQX1 \state_reg[4]  ( .D(n180), .CK(clk), .Q(state[4]) );
  DFFQX1 \state_reg[0]  ( .D(n184), .CK(clk), .Q(state[0]) );
  DFFQX1 \state_reg[1]  ( .D(n183), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[3]  ( .D(n181), .CK(clk), .Q(state[3]) );
  CLKINVX1 U5 ( .A(1'b0), .Y(F_REN_B) );
  CLKINVX1 U7 ( .A(1'b1), .Y(F_IO_B_READING) );
  OAI31XL U9 ( .A0(n49), .A1(n20), .A2(n8), .B0(n59), .Y(n58) );
  CLKINVX1 U10 ( .A(state[3]), .Y(n25) );
  CLKINVX1 U11 ( .A(state[2]), .Y(n27) );
  CLKINVX1 U12 ( .A(n68), .Y(n26) );
  CLKINVX1 U13 ( .A(n89), .Y(n17) );
  CLKINVX1 U14 ( .A(n97), .Y(n7) );
  NAND2X1 U15 ( .A(n13), .B(n21), .Y(n128) );
  CLKINVX1 U16 ( .A(n135), .Y(n13) );
  AOI2BB1X1 U17 ( .A0N(n101), .A1N(n111), .B0(n98), .Y(n89) );
  NOR3X1 U18 ( .A(n23), .B(n124), .C(n28), .Y(n83) );
  OA21XL U19 ( .A0(n15), .A1(n45), .B0(n59), .Y(n77) );
  CLKINVX1 U20 ( .A(n46), .Y(n15) );
  NOR3X1 U21 ( .A(n28), .B(n27), .C(n109), .Y(n84) );
  NAND2X1 U22 ( .A(n27), .B(n28), .Y(n68) );
  NOR2X1 U23 ( .A(n25), .B(n77), .Y(n78) );
  NOR2X1 U24 ( .A(n25), .B(n5), .Y(n57) );
  NOR2X1 U25 ( .A(n185), .B(n76), .Y(n46) );
  AOI31X1 U26 ( .A0(n19), .A1(n23), .A2(n26), .B0(n56), .Y(n51) );
  NAND2X1 U27 ( .A(n86), .B(n34), .Y(n97) );
  NAND3X1 U28 ( .A(n26), .B(n10), .C(n21), .Y(n49) );
  OAI21XL U29 ( .A0(n36), .A1(n37), .B0(n34), .Y(n35) );
  OAI2BB2XL U30 ( .B0(n29), .B1(n58), .A0N(N147), .A1N(n57), .Y(n169) );
  NAND2X1 U31 ( .A(n83), .B(n25), .Y(n36) );
  OAI21XL U32 ( .A0(n11), .A1(n23), .B0(n71), .Y(n75) );
  NAND2X1 U33 ( .A(n74), .B(n25), .Y(n111) );
  AOI21X1 U34 ( .A0(n83), .A1(n37), .B0(n84), .Y(n93) );
  NOR2X1 U35 ( .A(n103), .B(n101), .Y(n98) );
  NAND2X1 U36 ( .A(n21), .B(n27), .Y(n53) );
  CLKINVX1 U37 ( .A(n92), .Y(n21) );
  CLKINVX1 U38 ( .A(n58), .Y(n5) );
  NAND2X1 U39 ( .A(n85), .B(n86), .Y(n181) );
  OAI31XL U40 ( .A0(n87), .A1(n73), .A2(n88), .B0(n7), .Y(n85) );
  OAI221XL U41 ( .A0(n186), .A1(n93), .B0(n187), .B1(n79), .C0(n94), .Y(n87)
         );
  OAI2BB2XL U42 ( .B0(n89), .B1(n90), .A0N(n82), .A1N(n91), .Y(n88) );
  CLKINVX1 U43 ( .A(n103), .Y(n22) );
  OAI211X1 U44 ( .A0(n23), .A1(n68), .B0(n76), .C0(n67), .Y(N233) );
  NAND2X1 U45 ( .A(n67), .B(n68), .Y(n64) );
  CLKINVX1 U46 ( .A(n62), .Y(n20) );
  CLKINVX1 U47 ( .A(n124), .Y(n11) );
  CLKINVX1 U48 ( .A(n109), .Y(n9) );
  OAI211X1 U49 ( .A0(n25), .A1(n185), .B0(n55), .C0(n18), .Y(n72) );
  CLKINVX1 U50 ( .A(n73), .Y(n18) );
  CLKINVX1 U51 ( .A(n50), .Y(n19) );
  NOR2BX1 U52 ( .AN(n126), .B(n128), .Y(n147) );
  NOR2X1 U53 ( .A(n135), .B(n103), .Y(n155) );
  NAND2X1 U54 ( .A(n34), .B(n36), .Y(n135) );
  NAND2X1 U55 ( .A(n32), .B(n29), .Y(n133) );
  OAI21XL U56 ( .A0(n127), .A1(n128), .B0(n129), .Y(F_IO_B_OUT[6]) );
  NOR2BX1 U57 ( .AN(n155), .B(n33), .Y(F_IO_A_OUT[7]) );
  CLKINVX1 U58 ( .A(n40), .Y(n186) );
  NAND2BX1 U59 ( .AN(n128), .B(n130), .Y(n144) );
  CLKINVX1 U60 ( .A(n129), .Y(F_IO_A_OUT[6]) );
  CLKINVX1 U61 ( .A(n95), .Y(n187) );
  CLKINVX1 U62 ( .A(n141), .Y(F_IO_A_OUT[4]) );
  CLKINVX1 U63 ( .A(n146), .Y(F_IO_A_OUT[3]) );
  CLKINVX1 U64 ( .A(n150), .Y(F_IO_A_OUT[2]) );
  CLKINVX1 U65 ( .A(n152), .Y(F_IO_A_OUT[1]) );
  OAI21XL U66 ( .A0(state[0]), .A1(n25), .B0(n92), .Y(n73) );
  AOI2BB1X1 U67 ( .A0N(state[3]), .A1N(n122), .B0(rst), .Y(n67) );
  NOR2BX1 U68 ( .AN(n83), .B(n186), .Y(n122) );
  OAI22XL U69 ( .A0(n27), .A1(n86), .B0(n96), .B1(n97), .Y(n182) );
  AOI211X1 U70 ( .A0(n98), .A1(n90), .B0(n99), .C0(n100), .Y(n96) );
  OAI32X1 U71 ( .A0(n76), .A1(state[3]), .A2(n23), .B0(n79), .B1(n95), .Y(n100) );
  OAI221XL U72 ( .A0(n91), .A1(n102), .B0(state[4]), .B1(n103), .C0(n104), .Y(
        n99) );
  OAI22XL U73 ( .A0(n23), .A1(n86), .B0(n105), .B1(n97), .Y(n183) );
  AOI211X1 U74 ( .A0(n90), .A1(n17), .B0(n106), .C0(n107), .Y(n105) );
  OAI32X1 U75 ( .A0(n10), .A1(state[4]), .A2(state[1]), .B0(n108), .B1(n109), 
        .Y(n107) );
  OAI21XL U76 ( .A0(n91), .A1(n110), .B0(n104), .Y(n106) );
  OAI22XL U77 ( .A0(state[0]), .A1(n66), .B0(F_RB_B), .B1(n45), .Y(n65) );
  NOR2X1 U78 ( .A(n62), .B(n53), .Y(n66) );
  OAI21XL U79 ( .A0(state[1]), .A1(n76), .B0(n67), .Y(n56) );
  NAND4X1 U80 ( .A(counter[4]), .B(counter[3]), .C(n119), .D(n120), .Y(n50) );
  AND4X1 U81 ( .A(counter[5]), .B(counter[6]), .C(counter[7]), .D(counter[8]), 
        .Y(n120) );
  NOR3X1 U82 ( .A(n8), .B(n20), .C(n121), .Y(n119) );
  NAND2X1 U83 ( .A(state[2]), .B(n23), .Y(n103) );
  NAND2X1 U84 ( .A(F_REN_A), .B(F_RB_A), .Y(n62) );
  NAND3X1 U85 ( .A(state[1]), .B(n27), .C(n16), .Y(n79) );
  CLKINVX1 U86 ( .A(n101), .Y(n16) );
  NOR2X1 U87 ( .A(state[1]), .B(state[2]), .Y(n74) );
  OAI2BB2XL U88 ( .B0(n60), .B1(n61), .A0N(F_REN_A), .A1N(n60), .Y(n170) );
  NOR2X1 U89 ( .A(n49), .B(n62), .Y(n61) );
  NOR2BX1 U90 ( .AN(n63), .B(n56), .Y(n60) );
  OAI211X1 U91 ( .A0(n20), .A1(F_WEN_B), .B0(n23), .C0(n26), .Y(n63) );
  NAND2X1 U92 ( .A(state[4]), .B(state[0]), .Y(n101) );
  NAND2X1 U93 ( .A(state[2]), .B(state[0]), .Y(n124) );
  CLKINVX1 U94 ( .A(state[0]), .Y(n10) );
  AOI2BB1X1 U95 ( .A0N(n28), .A1N(n123), .B0(rst), .Y(n59) );
  OAI31XL U96 ( .A0(n23), .A1(n186), .A2(n124), .B0(n25), .Y(n123) );
  NAND2X1 U97 ( .A(state[1]), .B(n10), .Y(n109) );
  OAI211X1 U98 ( .A0(n111), .A1(n115), .B0(n102), .C0(n110), .Y(n82) );
  NAND2X1 U99 ( .A(state[4]), .B(n10), .Y(n115) );
  CLKINVX1 U100 ( .A(state[4]), .Y(n28) );
  NAND3X1 U101 ( .A(counter[1]), .B(counter[0]), .C(counter[2]), .Y(n121) );
  AOI21X1 U102 ( .A0(n10), .A1(n74), .B0(state[4]), .Y(n55) );
  CLKINVX1 U103 ( .A(state[1]), .Y(n23) );
  OAI2BB2XL U104 ( .B0(n10), .B1(n86), .A0N(n7), .A1N(n113), .Y(n184) );
  OAI211X1 U105 ( .A0(n6), .A1(n91), .B0(n114), .C0(n104), .Y(n113) );
  AO21X1 U106 ( .A0(state[4]), .A1(n108), .B0(state[0]), .Y(n114) );
  CLKINVX1 U107 ( .A(n82), .Y(n6) );
  NAND4BX1 U108 ( .AN(n42), .B(page[8]), .C(page[7]), .D(n43), .Y(n41) );
  AND3X2 U109 ( .A(page[6]), .B(page[4]), .C(page[5]), .Y(n43) );
  NAND4BX1 U110 ( .AN(n44), .B(page[3]), .C(page[1]), .D(page[2]), .Y(n42) );
  NAND3BX1 U111 ( .AN(n45), .B(n46), .C(page[0]), .Y(n44) );
  NAND2X1 U112 ( .A(n26), .B(state[0]), .Y(n76) );
  NAND2X1 U113 ( .A(state[3]), .B(n23), .Y(n92) );
  NAND4X1 U114 ( .A(n79), .B(n34), .C(n80), .D(n81), .Y(n180) );
  AOI21X1 U115 ( .A0(n83), .A1(n40), .B0(n84), .Y(n80) );
  AOI211X1 U116 ( .A0(state[3]), .A1(state[4]), .B0(n82), .C0(n17), .Y(n81) );
  NAND3X1 U117 ( .A(n11), .B(n28), .C(state[1]), .Y(n94) );
  OAI2BB2XL U118 ( .B0(n32), .B1(n58), .A0N(N146), .A1N(n57), .Y(n168) );
  OAI2BB2XL U119 ( .B0(n51), .B1(n52), .A0N(F_WEN_A), .A1N(n51), .Y(n159) );
  AOI32X1 U120 ( .A0(state[2]), .A1(n28), .A2(state[1]), .B0(n53), .B1(n10), 
        .Y(n52) );
  OAI2BB2XL U121 ( .B0(n51), .B1(n54), .A0N(F_CLE_A), .A1N(n51), .Y(n160) );
  NOR2BX1 U122 ( .AN(n55), .B(state[3]), .Y(n54) );
  NAND3X1 U123 ( .A(state[4]), .B(n27), .C(n9), .Y(n110) );
  NAND2X1 U124 ( .A(state[3]), .B(state[1]), .Y(n45) );
  NAND3X1 U125 ( .A(state[4]), .B(n10), .C(n22), .Y(n102) );
  NOR2X1 U126 ( .A(state[3]), .B(n26), .Y(n108) );
  NAND3X1 U127 ( .A(state[3]), .B(n116), .C(n117), .Y(n86) );
  OAI31XL U128 ( .A0(n19), .A1(state[4]), .A2(state[0]), .B0(n74), .Y(n116) );
  AOI211X1 U129 ( .A0(n118), .A1(n9), .B0(rst), .C0(n46), .Y(n117) );
  NOR2X1 U130 ( .A(F_RB_B), .B(n68), .Y(n118) );
  AOI32X1 U131 ( .A0(n9), .A1(n28), .A2(state[2]), .B0(n186), .B1(n84), .Y(
        n104) );
  AOI31X1 U132 ( .A0(state[0]), .A1(n25), .A2(n23), .B0(n22), .Y(n71) );
  AO22X1 U133 ( .A0(page[8]), .A1(n77), .B0(N170), .B1(n78), .Y(n171) );
  AO22X1 U134 ( .A0(counter[8]), .A1(n5), .B0(N154), .B1(n57), .Y(n161) );
  AO22X1 U135 ( .A0(page[0]), .A1(n77), .B0(N162), .B1(n78), .Y(n178) );
  AO22X1 U136 ( .A0(counter[7]), .A1(n5), .B0(N153), .B1(n57), .Y(n162) );
  AO22X1 U137 ( .A0(counter[6]), .A1(n5), .B0(N152), .B1(n57), .Y(n163) );
  AO22X1 U138 ( .A0(counter[5]), .A1(n5), .B0(N151), .B1(n57), .Y(n164) );
  AO22X1 U139 ( .A0(counter[4]), .A1(n5), .B0(N150), .B1(n57), .Y(n165) );
  AO22X1 U140 ( .A0(counter[3]), .A1(n5), .B0(N149), .B1(n57), .Y(n166) );
  AO22X1 U141 ( .A0(counter[2]), .A1(n5), .B0(N148), .B1(n57), .Y(n167) );
  AO22X1 U142 ( .A0(page[7]), .A1(n77), .B0(N169), .B1(n78), .Y(n172) );
  AO22X1 U143 ( .A0(page[6]), .A1(n77), .B0(N168), .B1(n78), .Y(n173) );
  AO22X1 U144 ( .A0(page[5]), .A1(n77), .B0(N167), .B1(n78), .Y(n174) );
  AO22X1 U145 ( .A0(page[4]), .A1(n77), .B0(N166), .B1(n78), .Y(n175) );
  AO22X1 U146 ( .A0(page[3]), .A1(n77), .B0(N165), .B1(n78), .Y(n176) );
  AO22X1 U147 ( .A0(page[2]), .A1(n77), .B0(N164), .B1(n78), .Y(n177) );
  AO22X1 U148 ( .A0(page[1]), .A1(n77), .B0(N163), .B1(n78), .Y(n179) );
  OAI31XL U149 ( .A0(n47), .A1(state[4]), .A2(state[3]), .B0(n48), .Y(n158) );
  NAND2X1 U150 ( .A(F_IO_A_READING), .B(n47), .Y(n48) );
  AOI2BB1X1 U151 ( .A0N(n49), .A1N(n50), .B0(N227), .Y(n47) );
  OAI21XL U152 ( .A0(state[3]), .A1(n94), .B0(n59), .Y(N227) );
  OAI211X1 U153 ( .A0(state[0]), .A1(n27), .B0(n70), .C0(n71), .Y(n69) );
  NAND3X1 U154 ( .A(n27), .B(n25), .C(state[1]), .Y(n70) );
  OAI31XL U155 ( .A0(n25), .A1(rst), .A2(n14), .B0(n38), .Y(n157) );
  NAND2X1 U156 ( .A(done), .B(n14), .Y(n38) );
  CLKINVX1 U157 ( .A(n39), .Y(n14) );
  OAI211X1 U158 ( .A0(n36), .A1(n40), .B0(n41), .C0(n34), .Y(n39) );
  CLKINVX1 U159 ( .A(counter[1]), .Y(n29) );
  CLKINVX1 U160 ( .A(counter[0]), .Y(n32) );
  NAND3BX1 U161 ( .AN(KEY[0]), .B(n112), .C(KEY[2]), .Y(n40) );
  NOR2BX1 U162 ( .AN(n143), .B(counter[0]), .Y(n132) );
  NAND4BBXL U163 ( .AN(KEY[1]), .BN(KEY[2]), .C(KEY[3]), .D(KEY[0]), .Y(n95)
         );
  AOI22X1 U164 ( .A0(n130), .A1(n131), .B0(F_IO_A_IN[6]), .B1(n126), .Y(n127)
         );
  NAND2X1 U165 ( .A(n132), .B(n133), .Y(n131) );
  NOR3BXL U166 ( .AN(n112), .B(KEY[0]), .C(KEY[2]), .Y(n90) );
  OAI2BB1X1 U167 ( .A0N(page[0]), .A1N(n155), .B0(n156), .Y(F_IO_A_OUT[0]) );
  NAND4X1 U168 ( .A(n13), .B(page[8]), .C(state[1]), .D(state[2]), .Y(n156) );
  NOR2X1 U169 ( .A(n30), .B(state[0]), .Y(n130) );
  NAND4X1 U170 ( .A(KEY[3]), .B(KEY[2]), .C(KEY[1]), .D(KEY[0]), .Y(n37) );
  OAI31XL U171 ( .A0(n32), .A1(counter[2]), .A2(counter[1]), .B0(n121), .Y(
        n148) );
  NOR2X1 U172 ( .A(WTMK_ACTIVE), .B(state[0]), .Y(n126) );
  NOR2X1 U173 ( .A(KEY[3]), .B(KEY[1]), .Y(n112) );
  NAND2BX1 U174 ( .AN(n133), .B(counter[2]), .Y(n139) );
  NAND2X1 U175 ( .A(n155), .B(page[6]), .Y(n129) );
  NAND2X1 U176 ( .A(n155), .B(page[4]), .Y(n141) );
  NAND2X1 U177 ( .A(n155), .B(page[3]), .Y(n146) );
  NAND2X1 U178 ( .A(n155), .B(page[2]), .Y(n150) );
  NAND2X1 U179 ( .A(n155), .B(page[1]), .Y(n152) );
  NAND3X1 U180 ( .A(KEY[2]), .B(KEY[0]), .C(n112), .Y(n91) );
  NAND3X1 U181 ( .A(counter[0]), .B(n29), .C(counter[2]), .Y(n138) );
  CLKINVX1 U182 ( .A(rst), .Y(n34) );
  NOR2X1 U183 ( .A(n134), .B(n135), .Y(F_IO_B_OUT[5]) );
  AOI2BB2X1 U184 ( .B0(n22), .B1(page[5]), .A0N(n136), .A1N(n92), .Y(n134) );
  AOI22X1 U185 ( .A0(n130), .A1(n137), .B0(F_IO_A_IN[5]), .B1(n126), .Y(n136)
         );
  NAND3X1 U186 ( .A(n138), .B(n29), .C(n139), .Y(n137) );
  OAI221XL U187 ( .A0(n140), .A1(n128), .B0(n45), .B1(n135), .C0(n141), .Y(
        F_IO_B_OUT[4]) );
  AOI221XL U188 ( .A0(F_IO_A_IN[4]), .A1(n126), .B0(n130), .B1(n142), .C0(
        state[0]), .Y(n140) );
  OAI21XL U189 ( .A0(counter[2]), .A1(n133), .B0(n132), .Y(n142) );
  NAND3X1 U190 ( .A(counter[1]), .B(n32), .C(counter[2]), .Y(n143) );
  OAI211X1 U191 ( .A0(n33), .A1(n103), .B0(n13), .C0(n125), .Y(F_IO_B_OUT[7])
         );
  AOI31X1 U192 ( .A0(n126), .A1(n21), .A2(F_IO_A_IN[7]), .B0(n24), .Y(n125) );
  CLKINVX1 U193 ( .A(n111), .Y(n24) );
  OAI211X1 U194 ( .A0(n31), .A1(n144), .B0(n145), .C0(n146), .Y(F_IO_B_OUT[3])
         );
  CLKINVX1 U195 ( .A(n148), .Y(n31) );
  NAND2X1 U196 ( .A(F_IO_A_IN[3]), .B(n147), .Y(n145) );
  OAI211X1 U197 ( .A0(n144), .A1(n143), .B0(n149), .C0(n150), .Y(F_IO_B_OUT[2]) );
  NAND2X1 U198 ( .A(F_IO_A_IN[2]), .B(n147), .Y(n149) );
  OAI211X1 U199 ( .A0(n144), .A1(n138), .B0(n151), .C0(n152), .Y(F_IO_B_OUT[1]) );
  NAND2X1 U200 ( .A(F_IO_A_IN[1]), .B(n147), .Y(n151) );
  OAI211X1 U201 ( .A0(n153), .A1(n144), .B0(n12), .C0(n154), .Y(F_IO_B_OUT[0])
         );
  CLKINVX1 U202 ( .A(F_IO_A_OUT[0]), .Y(n12) );
  NOR2BX1 U203 ( .AN(n139), .B(n148), .Y(n153) );
  NAND2X1 U204 ( .A(F_IO_A_IN[0]), .B(n147), .Y(n154) );
  AND2X2 U205 ( .A(page[5]), .B(n155), .Y(F_IO_A_OUT[5]) );
  CLKINVX1 U206 ( .A(page[7]), .Y(n33) );
  CLKINVX1 U207 ( .A(F_RB_B), .Y(n185) );
endmodule


module NFC_2_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  XOR2X1 U1 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
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
  XOR2X1 U1 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module NFC_2 ( clk, rst, done, F_IO_A_IN, F_IO_A_OUT, F_CLE_A, F_ALE_A, 
        F_REN_A, F_WEN_A, F_RB_A, F_IO_B_IN, F_IO_B_OUT, F_CLE_B, F_ALE_B, 
        F_REN_B, F_WEN_B, F_RB_B, F_IO_A_READING, F_IO_B_READING, KEY );
  input [7:0] F_IO_A_IN;
  output [7:0] F_IO_A_OUT;
  input [7:0] F_IO_B_IN;
  output [7:0] F_IO_B_OUT;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B, F_IO_A_READING, F_IO_B_READING;
  wire   WTMK_ACTIVE, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N162, N163, N164, N165, N166, N167, N168, N169, N170, N227, N233, n5,
         n6, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n31, n32, n33, n34, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339;
  wire   [4:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;

  NFC_2_DW01_inc_0 add_585 ( .A(page), .SUM({N170, N169, N168, N167, N166, 
        N165, N164, N163, N162}) );
  NFC_2_DW01_inc_1 add_531 ( .A(counter), .SUM({N154, N153, N152, N151, N150, 
        N149, N148, N147, N146}) );
  EDFFX1 F_ALE_A_reg ( .D(n297), .E(n316), .CK(clk), .Q(F_ALE_A) );
  EDFFX1 F_ALE_B_reg ( .D(n303), .E(N233), .CK(clk), .Q(F_ALE_B) );
  EDFFX1 F_CLE_B_reg ( .D(n300), .E(N233), .CK(clk), .Q(F_CLE_B) );
  EDFFX1 WTMK_ACTIVE_reg ( .D(n34), .E(n337), .CK(clk), .Q(WTMK_ACTIVE), .QN(
        n338) );
  DFFQX1 F_CLE_A_reg ( .D(n212), .CK(clk), .Q(F_CLE_A) );
  DFFQX1 F_WEN_A_reg ( .D(n213), .CK(clk), .Q(F_WEN_A) );
  DFFQX1 F_IO_A_READING_reg ( .D(n214), .CK(clk), .Q(F_IO_A_READING) );
  DFFQX1 done_reg ( .D(n215), .CK(clk), .Q(done) );
  DFFQX1 \counter_reg[8]  ( .D(n211), .CK(clk), .Q(counter[8]) );
  DFFQX1 \page_reg[0]  ( .D(n194), .CK(clk), .Q(page[0]) );
  DFFQX1 F_REN_A_reg ( .D(n202), .CK(clk), .Q(F_REN_A) );
  DFFQX1 \counter_reg[6]  ( .D(n209), .CK(clk), .Q(counter[6]) );
  DFFQX1 \counter_reg[5]  ( .D(n208), .CK(clk), .Q(counter[5]) );
  DFFQX1 \counter_reg[7]  ( .D(n210), .CK(clk), .Q(counter[7]) );
  DFFQX1 \page_reg[8]  ( .D(n201), .CK(clk), .Q(page[8]) );
  EDFFX1 F_WEN_B_reg ( .D(n307), .E(n308), .CK(clk), .Q(F_WEN_B), .QN(n339) );
  DFFQX1 \counter_reg[3]  ( .D(n206), .CK(clk), .Q(counter[3]) );
  DFFQX1 \counter_reg[4]  ( .D(n207), .CK(clk), .Q(counter[4]) );
  DFFQX1 \page_reg[6]  ( .D(n199), .CK(clk), .Q(page[6]) );
  DFFQX1 \page_reg[4]  ( .D(n197), .CK(clk), .Q(page[4]) );
  DFFQX1 \page_reg[5]  ( .D(n198), .CK(clk), .Q(page[5]) );
  DFFQX1 \page_reg[3]  ( .D(n196), .CK(clk), .Q(page[3]) );
  DFFQX1 \page_reg[1]  ( .D(n193), .CK(clk), .Q(page[1]) );
  DFFQX1 \page_reg[2]  ( .D(n195), .CK(clk), .Q(page[2]) );
  DFFQX1 \page_reg[7]  ( .D(n200), .CK(clk), .Q(page[7]) );
  DFFQX1 \counter_reg[1]  ( .D(n203), .CK(clk), .Q(counter[1]) );
  DFFQX1 \counter_reg[0]  ( .D(n204), .CK(clk), .Q(counter[0]) );
  DFFQX1 \counter_reg[2]  ( .D(n205), .CK(clk), .Q(counter[2]) );
  DFFQX1 \state_reg[2]  ( .D(n190), .CK(clk), .Q(state[2]) );
  DFFQX1 \state_reg[4]  ( .D(n192), .CK(clk), .Q(state[4]) );
  DFFQX1 \state_reg[0]  ( .D(n188), .CK(clk), .Q(state[0]) );
  DFFQX1 \state_reg[1]  ( .D(n189), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[3]  ( .D(n191), .CK(clk), .Q(state[3]) );
  CLKINVX1 U5 ( .A(1'b0), .Y(F_REN_B) );
  CLKINVX1 U7 ( .A(1'b1), .Y(F_IO_B_READING) );
  OAI31XL U9 ( .A0(n323), .A1(n20), .A2(n339), .B0(n313), .Y(n314) );
  CLKINVX1 U10 ( .A(state[3]), .Y(n25) );
  CLKINVX1 U11 ( .A(state[2]), .Y(n27) );
  OAI31XL U12 ( .A0(n32), .A1(counter[2]), .A2(counter[1]), .B0(n251), .Y(n224) );
  CLKINVX1 U13 ( .A(n304), .Y(n26) );
  CLKINVX1 U14 ( .A(n283), .Y(n17) );
  CLKINVX1 U15 ( .A(n275), .Y(n7) );
  NAND2X1 U16 ( .A(n13), .B(n21), .Y(n244) );
  CLKINVX1 U17 ( .A(n237), .Y(n13) );
  AOI2BB1X1 U18 ( .A0N(n271), .A1N(n261), .B0(n274), .Y(n283) );
  NOR3X1 U19 ( .A(n23), .B(n248), .C(n28), .Y(n289) );
  OA21XL U20 ( .A0(n15), .A1(n327), .B0(n313), .Y(n295) );
  CLKINVX1 U21 ( .A(n326), .Y(n15) );
  NOR3X1 U22 ( .A(n28), .B(n27), .C(n263), .Y(n288) );
  NAND2X1 U23 ( .A(n27), .B(n28), .Y(n304) );
  NOR2X1 U24 ( .A(n25), .B(n295), .Y(n294) );
  NOR2X1 U25 ( .A(n25), .B(n5), .Y(n315) );
  NOR2X1 U26 ( .A(n185), .B(n296), .Y(n326) );
  AOI31X1 U27 ( .A0(n19), .A1(n23), .A2(n26), .B0(n316), .Y(n321) );
  NAND2X1 U28 ( .A(n286), .B(n34), .Y(n275) );
  NAND3X1 U29 ( .A(n26), .B(n10), .C(n21), .Y(n323) );
  OAI21XL U30 ( .A0(n336), .A1(n335), .B0(n34), .Y(n337) );
  OAI2BB2XL U31 ( .B0(n29), .B1(n314), .A0N(N147), .A1N(n315), .Y(n203) );
  NAND2X1 U32 ( .A(n289), .B(n25), .Y(n336) );
  OAI21XL U33 ( .A0(n11), .A1(n23), .B0(n301), .Y(n297) );
  NAND2X1 U34 ( .A(n298), .B(n25), .Y(n261) );
  AOI21X1 U35 ( .A0(n289), .A1(n335), .B0(n288), .Y(n279) );
  NOR2X1 U36 ( .A(n269), .B(n271), .Y(n274) );
  NAND2X1 U37 ( .A(n21), .B(n27), .Y(n319) );
  CLKINVX1 U38 ( .A(n280), .Y(n21) );
  CLKINVX1 U39 ( .A(n314), .Y(n5) );
  NAND2X1 U40 ( .A(n287), .B(n286), .Y(n191) );
  OAI31XL U41 ( .A0(n285), .A1(n299), .A2(n284), .B0(n7), .Y(n287) );
  OAI221XL U42 ( .A0(n186), .A1(n279), .B0(n187), .B1(n293), .C0(n278), .Y(
        n285) );
  OAI2BB2XL U43 ( .B0(n283), .B1(n282), .A0N(n290), .A1N(n281), .Y(n284) );
  CLKINVX1 U44 ( .A(n269), .Y(n22) );
  OAI211X1 U45 ( .A0(n23), .A1(n304), .B0(n296), .C0(n305), .Y(N233) );
  NAND2X1 U46 ( .A(n305), .B(n304), .Y(n308) );
  CLKINVX1 U47 ( .A(n310), .Y(n20) );
  CLKINVX1 U48 ( .A(n248), .Y(n11) );
  CLKINVX1 U49 ( .A(n263), .Y(n9) );
  OAI211X1 U50 ( .A0(n25), .A1(n185), .B0(n317), .C0(n18), .Y(n300) );
  CLKINVX1 U51 ( .A(n299), .Y(n18) );
  CLKINVX1 U52 ( .A(n322), .Y(n19) );
  NOR2BX1 U53 ( .AN(n246), .B(n244), .Y(n225) );
  NOR2X1 U54 ( .A(n237), .B(n269), .Y(n217) );
  NAND2X1 U55 ( .A(n34), .B(n336), .Y(n237) );
  NOR2BX1 U56 ( .AN(n217), .B(n33), .Y(F_IO_A_OUT[7]) );
  NAND2X1 U57 ( .A(n32), .B(n29), .Y(n239) );
  OAI21XL U58 ( .A0(n245), .A1(n244), .B0(n243), .Y(F_IO_B_OUT[6]) );
  NOR2X1 U59 ( .A(n238), .B(n237), .Y(F_IO_B_OUT[5]) );
  OAI221XL U60 ( .A0(n232), .A1(n244), .B0(n327), .B1(n237), .C0(n231), .Y(
        F_IO_B_OUT[4]) );
  OAI211X1 U61 ( .A0(n33), .A1(n269), .B0(n13), .C0(n247), .Y(F_IO_B_OUT[7])
         );
  OAI211X1 U62 ( .A0(n31), .A1(n228), .B0(n227), .C0(n226), .Y(F_IO_B_OUT[3])
         );
  OAI211X1 U63 ( .A0(n228), .A1(n229), .B0(n223), .C0(n222), .Y(F_IO_B_OUT[2])
         );
  OAI211X1 U64 ( .A0(n228), .A1(n234), .B0(n221), .C0(n220), .Y(F_IO_B_OUT[1])
         );
  OAI211X1 U65 ( .A0(n219), .A1(n228), .B0(n12), .C0(n218), .Y(F_IO_B_OUT[0])
         );
  CLKINVX1 U66 ( .A(n243), .Y(F_IO_A_OUT[6]) );
  CLKINVX1 U67 ( .A(n231), .Y(F_IO_A_OUT[4]) );
  CLKINVX1 U68 ( .A(n226), .Y(F_IO_A_OUT[3]) );
  CLKINVX1 U69 ( .A(n222), .Y(F_IO_A_OUT[2]) );
  CLKINVX1 U70 ( .A(n220), .Y(F_IO_A_OUT[1]) );
  CLKINVX1 U71 ( .A(n332), .Y(n186) );
  NOR2BX1 U72 ( .AN(n233), .B(n224), .Y(n219) );
  NAND2BX1 U73 ( .AN(n244), .B(n242), .Y(n228) );
  CLKINVX1 U74 ( .A(n277), .Y(n187) );
  CLKINVX1 U75 ( .A(F_IO_A_OUT[0]), .Y(n12) );
  CLKINVX1 U76 ( .A(n224), .Y(n31) );
  OAI21XL U77 ( .A0(state[0]), .A1(n25), .B0(n280), .Y(n299) );
  AOI2BB1X1 U78 ( .A0N(state[3]), .A1N(n250), .B0(rst), .Y(n305) );
  NOR2BX1 U79 ( .AN(n289), .B(n186), .Y(n250) );
  OAI22XL U80 ( .A0(n27), .A1(n286), .B0(n276), .B1(n275), .Y(n190) );
  AOI211X1 U81 ( .A0(n274), .A1(n282), .B0(n273), .C0(n272), .Y(n276) );
  OAI32X1 U82 ( .A0(n296), .A1(state[3]), .A2(n23), .B0(n293), .B1(n277), .Y(
        n272) );
  OAI221XL U83 ( .A0(n281), .A1(n270), .B0(state[4]), .B1(n269), .C0(n268), 
        .Y(n273) );
  OAI22XL U84 ( .A0(n23), .A1(n286), .B0(n267), .B1(n275), .Y(n189) );
  AOI211X1 U85 ( .A0(n282), .A1(n17), .B0(n266), .C0(n265), .Y(n267) );
  OAI32X1 U86 ( .A0(n10), .A1(state[4]), .A2(state[1]), .B0(n264), .B1(n263), 
        .Y(n265) );
  OAI21XL U87 ( .A0(n281), .A1(n262), .B0(n268), .Y(n266) );
  OAI22XL U88 ( .A0(state[0]), .A1(n306), .B0(F_RB_B), .B1(n327), .Y(n307) );
  NOR2X1 U89 ( .A(n310), .B(n319), .Y(n306) );
  OAI21XL U90 ( .A0(state[1]), .A1(n296), .B0(n305), .Y(n316) );
  NAND4X1 U91 ( .A(counter[4]), .B(counter[3]), .C(n253), .D(n252), .Y(n322)
         );
  AND4X1 U92 ( .A(counter[5]), .B(counter[6]), .C(counter[7]), .D(counter[8]), 
        .Y(n252) );
  NOR3X1 U93 ( .A(n339), .B(n20), .C(n251), .Y(n253) );
  NAND2X1 U94 ( .A(state[2]), .B(n23), .Y(n269) );
  NAND2X1 U95 ( .A(F_REN_A), .B(F_RB_A), .Y(n310) );
  NAND3X1 U96 ( .A(state[1]), .B(n27), .C(n16), .Y(n293) );
  CLKINVX1 U97 ( .A(n271), .Y(n16) );
  NOR2X1 U98 ( .A(state[1]), .B(state[2]), .Y(n298) );
  OAI2BB2XL U99 ( .B0(n312), .B1(n311), .A0N(F_REN_A), .A1N(n312), .Y(n202) );
  NOR2X1 U100 ( .A(n323), .B(n310), .Y(n311) );
  NOR2BX1 U101 ( .AN(n309), .B(n316), .Y(n312) );
  OAI211X1 U102 ( .A0(n20), .A1(F_WEN_B), .B0(n23), .C0(n26), .Y(n309) );
  NAND2X1 U103 ( .A(state[4]), .B(state[0]), .Y(n271) );
  NAND2X1 U104 ( .A(state[2]), .B(state[0]), .Y(n248) );
  CLKINVX1 U105 ( .A(state[0]), .Y(n10) );
  AOI2BB1X1 U106 ( .A0N(n28), .A1N(n249), .B0(rst), .Y(n313) );
  OAI31XL U107 ( .A0(n23), .A1(n186), .A2(n248), .B0(n25), .Y(n249) );
  NAND2X1 U108 ( .A(state[1]), .B(n10), .Y(n263) );
  OAI211X1 U109 ( .A0(n261), .A1(n257), .B0(n270), .C0(n262), .Y(n290) );
  NAND2X1 U110 ( .A(state[4]), .B(n10), .Y(n257) );
  CLKINVX1 U111 ( .A(state[4]), .Y(n28) );
  NAND3X1 U112 ( .A(counter[1]), .B(counter[0]), .C(counter[2]), .Y(n251) );
  AOI21X1 U113 ( .A0(n10), .A1(n298), .B0(state[4]), .Y(n317) );
  CLKINVX1 U114 ( .A(state[1]), .Y(n23) );
  OAI2BB2XL U115 ( .B0(n10), .B1(n286), .A0N(n7), .A1N(n259), .Y(n188) );
  OAI211X1 U116 ( .A0(n6), .A1(n281), .B0(n258), .C0(n268), .Y(n259) );
  AO21X1 U117 ( .A0(state[4]), .A1(n264), .B0(state[0]), .Y(n258) );
  CLKINVX1 U118 ( .A(n290), .Y(n6) );
  NAND4BX1 U119 ( .AN(n330), .B(page[8]), .C(page[7]), .D(n329), .Y(n331) );
  AND3X2 U120 ( .A(page[6]), .B(page[4]), .C(page[5]), .Y(n329) );
  NAND4BX1 U121 ( .AN(n328), .B(page[3]), .C(page[1]), .D(page[2]), .Y(n330)
         );
  NAND3BX1 U122 ( .AN(n327), .B(n326), .C(page[0]), .Y(n328) );
  NAND2X1 U123 ( .A(n26), .B(state[0]), .Y(n296) );
  NAND2X1 U124 ( .A(state[3]), .B(n23), .Y(n280) );
  NAND4X1 U125 ( .A(n293), .B(n34), .C(n292), .D(n291), .Y(n192) );
  AOI21X1 U126 ( .A0(n289), .A1(n332), .B0(n288), .Y(n292) );
  AOI211X1 U127 ( .A0(state[3]), .A1(state[4]), .B0(n290), .C0(n17), .Y(n291)
         );
  NAND3X1 U128 ( .A(n11), .B(n28), .C(state[1]), .Y(n278) );
  OAI2BB2XL U129 ( .B0(n32), .B1(n314), .A0N(N146), .A1N(n315), .Y(n204) );
  OAI2BB2XL U130 ( .B0(n321), .B1(n320), .A0N(F_WEN_A), .A1N(n321), .Y(n213)
         );
  AOI32X1 U131 ( .A0(state[2]), .A1(n28), .A2(state[1]), .B0(n319), .B1(n10), 
        .Y(n320) );
  OAI2BB2XL U132 ( .B0(n321), .B1(n318), .A0N(F_CLE_A), .A1N(n321), .Y(n212)
         );
  NOR2BX1 U133 ( .AN(n317), .B(state[3]), .Y(n318) );
  NAND3X1 U134 ( .A(state[4]), .B(n27), .C(n9), .Y(n262) );
  NAND2X1 U135 ( .A(state[3]), .B(state[1]), .Y(n327) );
  NAND3X1 U136 ( .A(state[4]), .B(n10), .C(n22), .Y(n270) );
  NOR2X1 U137 ( .A(state[3]), .B(n26), .Y(n264) );
  NAND3X1 U138 ( .A(state[3]), .B(n256), .C(n255), .Y(n286) );
  OAI31XL U139 ( .A0(n19), .A1(state[4]), .A2(state[0]), .B0(n298), .Y(n256)
         );
  AOI211X1 U140 ( .A0(n254), .A1(n9), .B0(rst), .C0(n326), .Y(n255) );
  NOR2X1 U141 ( .A(F_RB_B), .B(n304), .Y(n254) );
  AOI32X1 U142 ( .A0(n9), .A1(n28), .A2(state[2]), .B0(n186), .B1(n288), .Y(
        n268) );
  AOI31X1 U143 ( .A0(state[0]), .A1(n25), .A2(n23), .B0(n22), .Y(n301) );
  AO22X1 U144 ( .A0(page[8]), .A1(n295), .B0(N170), .B1(n294), .Y(n201) );
  AO22X1 U145 ( .A0(counter[8]), .A1(n5), .B0(N154), .B1(n315), .Y(n211) );
  AO22X1 U146 ( .A0(page[0]), .A1(n295), .B0(N162), .B1(n294), .Y(n194) );
  AO22X1 U147 ( .A0(counter[7]), .A1(n5), .B0(N153), .B1(n315), .Y(n210) );
  AO22X1 U148 ( .A0(counter[6]), .A1(n5), .B0(N152), .B1(n315), .Y(n209) );
  AO22X1 U149 ( .A0(counter[5]), .A1(n5), .B0(N151), .B1(n315), .Y(n208) );
  AO22X1 U150 ( .A0(counter[4]), .A1(n5), .B0(N150), .B1(n315), .Y(n207) );
  AO22X1 U151 ( .A0(counter[3]), .A1(n5), .B0(N149), .B1(n315), .Y(n206) );
  AO22X1 U152 ( .A0(counter[2]), .A1(n5), .B0(N148), .B1(n315), .Y(n205) );
  AO22X1 U153 ( .A0(page[7]), .A1(n295), .B0(N169), .B1(n294), .Y(n200) );
  AO22X1 U154 ( .A0(page[6]), .A1(n295), .B0(N168), .B1(n294), .Y(n199) );
  AO22X1 U155 ( .A0(page[5]), .A1(n295), .B0(N167), .B1(n294), .Y(n198) );
  AO22X1 U156 ( .A0(page[4]), .A1(n295), .B0(N166), .B1(n294), .Y(n197) );
  AO22X1 U157 ( .A0(page[3]), .A1(n295), .B0(N165), .B1(n294), .Y(n196) );
  AO22X1 U158 ( .A0(page[2]), .A1(n295), .B0(N164), .B1(n294), .Y(n195) );
  AO22X1 U159 ( .A0(page[1]), .A1(n295), .B0(N163), .B1(n294), .Y(n193) );
  OAI31XL U160 ( .A0(n325), .A1(state[4]), .A2(state[3]), .B0(n324), .Y(n214)
         );
  NAND2X1 U161 ( .A(F_IO_A_READING), .B(n325), .Y(n324) );
  AOI2BB1X1 U162 ( .A0N(n323), .A1N(n322), .B0(N227), .Y(n325) );
  OAI21XL U163 ( .A0(state[3]), .A1(n278), .B0(n313), .Y(N227) );
  OAI211X1 U164 ( .A0(state[0]), .A1(n27), .B0(n302), .C0(n301), .Y(n303) );
  NAND3X1 U165 ( .A(n27), .B(n25), .C(state[1]), .Y(n302) );
  OAI31XL U166 ( .A0(n25), .A1(rst), .A2(n14), .B0(n334), .Y(n215) );
  NAND2X1 U167 ( .A(done), .B(n14), .Y(n334) );
  CLKINVX1 U168 ( .A(n333), .Y(n14) );
  OAI211X1 U169 ( .A0(n336), .A1(n332), .B0(n331), .C0(n34), .Y(n333) );
  CLKINVX1 U170 ( .A(counter[1]), .Y(n29) );
  CLKINVX1 U171 ( .A(counter[0]), .Y(n32) );
  NAND3BX1 U172 ( .AN(KEY[0]), .B(n260), .C(KEY[2]), .Y(n332) );
  NOR2BX1 U173 ( .AN(n229), .B(counter[0]), .Y(n240) );
  NAND4BBXL U174 ( .AN(KEY[1]), .BN(KEY[2]), .C(KEY[3]), .D(KEY[0]), .Y(n277)
         );
  AOI2BB2X1 U175 ( .B0(n22), .B1(page[5]), .A0N(n236), .A1N(n280), .Y(n238) );
  AOI22X1 U176 ( .A0(n242), .A1(n235), .B0(F_IO_A_IN[5]), .B1(n246), .Y(n236)
         );
  NAND3X1 U177 ( .A(n234), .B(n29), .C(n233), .Y(n235) );
  AOI22X1 U178 ( .A0(n242), .A1(n241), .B0(F_IO_A_IN[6]), .B1(n246), .Y(n245)
         );
  NAND2X1 U179 ( .A(n240), .B(n239), .Y(n241) );
  NOR3BXL U180 ( .AN(n260), .B(KEY[0]), .C(KEY[2]), .Y(n282) );
  OAI2BB1X1 U181 ( .A0N(page[0]), .A1N(n217), .B0(n216), .Y(F_IO_A_OUT[0]) );
  NAND4X1 U182 ( .A(n13), .B(page[8]), .C(state[1]), .D(state[2]), .Y(n216) );
  NOR2X1 U183 ( .A(n338), .B(state[0]), .Y(n242) );
  NAND4X1 U184 ( .A(KEY[3]), .B(KEY[2]), .C(KEY[1]), .D(KEY[0]), .Y(n335) );
  NOR2X1 U185 ( .A(WTMK_ACTIVE), .B(state[0]), .Y(n246) );
  NOR2X1 U186 ( .A(KEY[3]), .B(KEY[1]), .Y(n260) );
  NAND2BX1 U187 ( .AN(n239), .B(counter[2]), .Y(n233) );
  NAND2X1 U188 ( .A(n217), .B(page[6]), .Y(n243) );
  NAND2X1 U189 ( .A(n217), .B(page[4]), .Y(n231) );
  NAND2X1 U190 ( .A(n217), .B(page[3]), .Y(n226) );
  NAND2X1 U191 ( .A(n217), .B(page[2]), .Y(n222) );
  NAND2X1 U192 ( .A(n217), .B(page[1]), .Y(n220) );
  NAND3X1 U193 ( .A(KEY[2]), .B(KEY[0]), .C(n260), .Y(n281) );
  NAND3X1 U194 ( .A(counter[0]), .B(n29), .C(counter[2]), .Y(n234) );
  CLKINVX1 U195 ( .A(rst), .Y(n34) );
  AND2X2 U196 ( .A(page[5]), .B(n217), .Y(F_IO_A_OUT[5]) );
  NAND3X1 U197 ( .A(counter[1]), .B(n32), .C(counter[2]), .Y(n229) );
  NAND2X1 U198 ( .A(F_IO_A_IN[3]), .B(n225), .Y(n227) );
  NAND2X1 U199 ( .A(F_IO_A_IN[2]), .B(n225), .Y(n223) );
  NAND2X1 U200 ( .A(F_IO_A_IN[1]), .B(n225), .Y(n221) );
  NAND2X1 U201 ( .A(F_IO_A_IN[0]), .B(n225), .Y(n218) );
  AOI221XL U202 ( .A0(F_IO_A_IN[4]), .A1(n246), .B0(n242), .B1(n230), .C0(
        state[0]), .Y(n232) );
  OAI21XL U203 ( .A0(counter[2]), .A1(n239), .B0(n240), .Y(n230) );
  CLKINVX1 U204 ( .A(page[7]), .Y(n33) );
  AOI31X1 U205 ( .A0(n246), .A1(n21), .A2(F_IO_A_IN[7]), .B0(n24), .Y(n247) );
  CLKINVX1 U206 ( .A(n261), .Y(n24) );
  CLKINVX1 U207 ( .A(F_RB_B), .Y(n185) );
endmodule


module NFC_1_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  XOR2X1 U1 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
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
  XOR2X1 U1 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module NFC_1 ( clk, rst, done, F_IO_A_IN, F_IO_A_OUT, F_CLE_A, F_ALE_A, 
        F_REN_A, F_WEN_A, F_RB_A, F_IO_B_IN, F_IO_B_OUT, F_CLE_B, F_ALE_B, 
        F_REN_B, F_WEN_B, F_RB_B, F_IO_A_READING, F_IO_B_READING, KEY );
  input [7:0] F_IO_A_IN;
  output [7:0] F_IO_A_OUT;
  input [7:0] F_IO_B_IN;
  output [7:0] F_IO_B_OUT;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B, F_IO_A_READING, F_IO_B_READING;
  wire   WTMK_ACTIVE, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N162, N163, N164, N165, N166, N167, N168, N169, N170, N227, N233, n5,
         n6, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n31, n32, n33, n34, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339;
  wire   [4:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;

  NFC_1_DW01_inc_0 add_585 ( .A(page), .SUM({N170, N169, N168, N167, N166, 
        N165, N164, N163, N162}) );
  NFC_1_DW01_inc_1 add_531 ( .A(counter), .SUM({N154, N153, N152, N151, N150, 
        N149, N148, N147, N146}) );
  EDFFX1 F_ALE_A_reg ( .D(n297), .E(n316), .CK(clk), .Q(F_ALE_A) );
  EDFFX1 F_ALE_B_reg ( .D(n303), .E(N233), .CK(clk), .Q(F_ALE_B) );
  EDFFX1 F_CLE_B_reg ( .D(n300), .E(N233), .CK(clk), .Q(F_CLE_B) );
  EDFFX1 WTMK_ACTIVE_reg ( .D(n34), .E(n337), .CK(clk), .Q(WTMK_ACTIVE), .QN(
        n338) );
  DFFQX1 F_CLE_A_reg ( .D(n212), .CK(clk), .Q(F_CLE_A) );
  DFFQX1 F_WEN_A_reg ( .D(n213), .CK(clk), .Q(F_WEN_A) );
  DFFQX1 F_IO_A_READING_reg ( .D(n214), .CK(clk), .Q(F_IO_A_READING) );
  DFFQX1 done_reg ( .D(n215), .CK(clk), .Q(done) );
  DFFQX1 \counter_reg[8]  ( .D(n211), .CK(clk), .Q(counter[8]) );
  DFFQX1 F_REN_A_reg ( .D(n202), .CK(clk), .Q(F_REN_A) );
  DFFQX1 \page_reg[0]  ( .D(n194), .CK(clk), .Q(page[0]) );
  DFFQX1 \counter_reg[6]  ( .D(n209), .CK(clk), .Q(counter[6]) );
  DFFQX1 \counter_reg[5]  ( .D(n208), .CK(clk), .Q(counter[5]) );
  DFFQX1 \counter_reg[7]  ( .D(n210), .CK(clk), .Q(counter[7]) );
  DFFQX1 \page_reg[8]  ( .D(n201), .CK(clk), .Q(page[8]) );
  EDFFX1 F_WEN_B_reg ( .D(n307), .E(n308), .CK(clk), .Q(F_WEN_B), .QN(n339) );
  DFFQX1 \counter_reg[3]  ( .D(n206), .CK(clk), .Q(counter[3]) );
  DFFQX1 \counter_reg[4]  ( .D(n207), .CK(clk), .Q(counter[4]) );
  DFFQX1 \page_reg[6]  ( .D(n199), .CK(clk), .Q(page[6]) );
  DFFQX1 \page_reg[4]  ( .D(n197), .CK(clk), .Q(page[4]) );
  DFFQX1 \page_reg[5]  ( .D(n198), .CK(clk), .Q(page[5]) );
  DFFQX1 \page_reg[3]  ( .D(n196), .CK(clk), .Q(page[3]) );
  DFFQX1 \page_reg[1]  ( .D(n193), .CK(clk), .Q(page[1]) );
  DFFQX1 \page_reg[2]  ( .D(n195), .CK(clk), .Q(page[2]) );
  DFFQX1 \page_reg[7]  ( .D(n200), .CK(clk), .Q(page[7]) );
  DFFQX1 \counter_reg[1]  ( .D(n203), .CK(clk), .Q(counter[1]) );
  DFFQX1 \counter_reg[0]  ( .D(n204), .CK(clk), .Q(counter[0]) );
  DFFQX1 \counter_reg[2]  ( .D(n205), .CK(clk), .Q(counter[2]) );
  DFFQX1 \state_reg[2]  ( .D(n190), .CK(clk), .Q(state[2]) );
  DFFQX1 \state_reg[4]  ( .D(n192), .CK(clk), .Q(state[4]) );
  DFFQX1 \state_reg[0]  ( .D(n188), .CK(clk), .Q(state[0]) );
  DFFQX1 \state_reg[1]  ( .D(n189), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[3]  ( .D(n191), .CK(clk), .Q(state[3]) );
  CLKINVX1 U5 ( .A(1'b0), .Y(F_REN_B) );
  CLKINVX1 U7 ( .A(1'b1), .Y(F_IO_B_READING) );
  OAI31XL U9 ( .A0(n323), .A1(n20), .A2(n339), .B0(n313), .Y(n314) );
  CLKINVX1 U10 ( .A(state[3]), .Y(n25) );
  CLKINVX1 U11 ( .A(state[2]), .Y(n27) );
  OAI31XL U12 ( .A0(n32), .A1(counter[2]), .A2(counter[1]), .B0(n251), .Y(n224) );
  CLKINVX1 U13 ( .A(n304), .Y(n26) );
  CLKINVX1 U14 ( .A(n283), .Y(n17) );
  CLKINVX1 U15 ( .A(n275), .Y(n7) );
  NAND2X1 U16 ( .A(n13), .B(n21), .Y(n244) );
  CLKINVX1 U17 ( .A(n237), .Y(n13) );
  AOI2BB1X1 U18 ( .A0N(n271), .A1N(n261), .B0(n274), .Y(n283) );
  NOR3X1 U19 ( .A(n23), .B(n248), .C(n28), .Y(n289) );
  OA21XL U20 ( .A0(n15), .A1(n327), .B0(n313), .Y(n295) );
  CLKINVX1 U21 ( .A(n326), .Y(n15) );
  NOR3X1 U22 ( .A(n28), .B(n27), .C(n263), .Y(n288) );
  NAND2X1 U23 ( .A(n27), .B(n28), .Y(n304) );
  NOR2X1 U24 ( .A(n25), .B(n295), .Y(n294) );
  NOR2X1 U25 ( .A(n25), .B(n5), .Y(n315) );
  NOR2X1 U26 ( .A(n185), .B(n296), .Y(n326) );
  AOI31X1 U27 ( .A0(n19), .A1(n23), .A2(n26), .B0(n316), .Y(n321) );
  NAND2X1 U28 ( .A(n286), .B(n34), .Y(n275) );
  NAND3X1 U29 ( .A(n26), .B(n10), .C(n21), .Y(n323) );
  OAI21XL U30 ( .A0(n336), .A1(n335), .B0(n34), .Y(n337) );
  OAI2BB2XL U31 ( .B0(n29), .B1(n314), .A0N(N147), .A1N(n315), .Y(n203) );
  NAND2X1 U32 ( .A(n289), .B(n25), .Y(n336) );
  OAI21XL U33 ( .A0(n11), .A1(n23), .B0(n301), .Y(n297) );
  NAND2X1 U34 ( .A(n298), .B(n25), .Y(n261) );
  AOI21X1 U35 ( .A0(n289), .A1(n335), .B0(n288), .Y(n279) );
  NOR2X1 U36 ( .A(n269), .B(n271), .Y(n274) );
  NAND2X1 U37 ( .A(n21), .B(n27), .Y(n319) );
  CLKINVX1 U38 ( .A(n280), .Y(n21) );
  CLKINVX1 U39 ( .A(n314), .Y(n5) );
  NAND2X1 U40 ( .A(n287), .B(n286), .Y(n191) );
  OAI31XL U41 ( .A0(n285), .A1(n299), .A2(n284), .B0(n7), .Y(n287) );
  OAI221XL U42 ( .A0(n186), .A1(n279), .B0(n187), .B1(n293), .C0(n278), .Y(
        n285) );
  OAI2BB2XL U43 ( .B0(n283), .B1(n282), .A0N(n290), .A1N(n281), .Y(n284) );
  CLKINVX1 U44 ( .A(n269), .Y(n22) );
  OAI211X1 U45 ( .A0(n23), .A1(n304), .B0(n296), .C0(n305), .Y(N233) );
  NAND2X1 U46 ( .A(n305), .B(n304), .Y(n308) );
  CLKINVX1 U47 ( .A(n310), .Y(n20) );
  CLKINVX1 U48 ( .A(n248), .Y(n11) );
  CLKINVX1 U49 ( .A(n263), .Y(n9) );
  OAI211X1 U50 ( .A0(n25), .A1(n185), .B0(n317), .C0(n18), .Y(n300) );
  CLKINVX1 U51 ( .A(n299), .Y(n18) );
  CLKINVX1 U52 ( .A(n322), .Y(n19) );
  NOR2BX1 U53 ( .AN(n246), .B(n244), .Y(n225) );
  NOR2X1 U54 ( .A(n237), .B(n269), .Y(n217) );
  NAND2X1 U55 ( .A(n34), .B(n336), .Y(n237) );
  NAND2X1 U56 ( .A(n32), .B(n29), .Y(n239) );
  NOR2BX1 U57 ( .AN(n217), .B(n33), .Y(F_IO_A_OUT[7]) );
  NOR2X1 U58 ( .A(n238), .B(n237), .Y(F_IO_B_OUT[5]) );
  OAI221XL U59 ( .A0(n232), .A1(n244), .B0(n327), .B1(n237), .C0(n231), .Y(
        F_IO_B_OUT[4]) );
  OAI211X1 U60 ( .A0(n33), .A1(n269), .B0(n13), .C0(n247), .Y(F_IO_B_OUT[7])
         );
  OAI211X1 U61 ( .A0(n31), .A1(n228), .B0(n227), .C0(n226), .Y(F_IO_B_OUT[3])
         );
  OAI211X1 U62 ( .A0(n228), .A1(n229), .B0(n223), .C0(n222), .Y(F_IO_B_OUT[2])
         );
  OAI211X1 U63 ( .A0(n228), .A1(n234), .B0(n221), .C0(n220), .Y(F_IO_B_OUT[1])
         );
  OAI211X1 U64 ( .A0(n219), .A1(n228), .B0(n12), .C0(n218), .Y(F_IO_B_OUT[0])
         );
  CLKINVX1 U65 ( .A(n243), .Y(F_IO_A_OUT[6]) );
  CLKINVX1 U66 ( .A(n231), .Y(F_IO_A_OUT[4]) );
  CLKINVX1 U67 ( .A(n226), .Y(F_IO_A_OUT[3]) );
  CLKINVX1 U68 ( .A(n222), .Y(F_IO_A_OUT[2]) );
  CLKINVX1 U69 ( .A(n220), .Y(F_IO_A_OUT[1]) );
  CLKINVX1 U70 ( .A(n332), .Y(n186) );
  NOR2BX1 U71 ( .AN(n233), .B(n224), .Y(n219) );
  NAND2BX1 U72 ( .AN(n244), .B(n242), .Y(n228) );
  CLKINVX1 U73 ( .A(n277), .Y(n187) );
  CLKINVX1 U74 ( .A(F_IO_A_OUT[0]), .Y(n12) );
  CLKINVX1 U75 ( .A(n224), .Y(n31) );
  OAI21XL U76 ( .A0(state[0]), .A1(n25), .B0(n280), .Y(n299) );
  AOI2BB1X1 U77 ( .A0N(state[3]), .A1N(n250), .B0(rst), .Y(n305) );
  NOR2BX1 U78 ( .AN(n289), .B(n186), .Y(n250) );
  OAI22XL U79 ( .A0(n27), .A1(n286), .B0(n276), .B1(n275), .Y(n190) );
  AOI211X1 U80 ( .A0(n274), .A1(n282), .B0(n273), .C0(n272), .Y(n276) );
  OAI32X1 U81 ( .A0(n296), .A1(state[3]), .A2(n23), .B0(n293), .B1(n277), .Y(
        n272) );
  OAI221XL U82 ( .A0(n281), .A1(n270), .B0(state[4]), .B1(n269), .C0(n268), 
        .Y(n273) );
  OAI22XL U83 ( .A0(n23), .A1(n286), .B0(n267), .B1(n275), .Y(n189) );
  AOI211X1 U84 ( .A0(n282), .A1(n17), .B0(n266), .C0(n265), .Y(n267) );
  OAI32X1 U85 ( .A0(n10), .A1(state[4]), .A2(state[1]), .B0(n264), .B1(n263), 
        .Y(n265) );
  OAI21XL U86 ( .A0(n281), .A1(n262), .B0(n268), .Y(n266) );
  OAI22XL U87 ( .A0(state[0]), .A1(n306), .B0(F_RB_B), .B1(n327), .Y(n307) );
  NOR2X1 U88 ( .A(n310), .B(n319), .Y(n306) );
  OAI21XL U89 ( .A0(state[1]), .A1(n296), .B0(n305), .Y(n316) );
  NAND4X1 U90 ( .A(counter[4]), .B(counter[3]), .C(n253), .D(n252), .Y(n322)
         );
  AND4X1 U91 ( .A(counter[5]), .B(counter[6]), .C(counter[7]), .D(counter[8]), 
        .Y(n252) );
  NOR3X1 U92 ( .A(n339), .B(n20), .C(n251), .Y(n253) );
  NAND2X1 U93 ( .A(state[2]), .B(n23), .Y(n269) );
  NAND2X1 U94 ( .A(F_REN_A), .B(F_RB_A), .Y(n310) );
  NAND3X1 U95 ( .A(state[1]), .B(n27), .C(n16), .Y(n293) );
  CLKINVX1 U96 ( .A(n271), .Y(n16) );
  NOR2X1 U97 ( .A(state[1]), .B(state[2]), .Y(n298) );
  OAI2BB2XL U98 ( .B0(n312), .B1(n311), .A0N(F_REN_A), .A1N(n312), .Y(n202) );
  NOR2X1 U99 ( .A(n323), .B(n310), .Y(n311) );
  NOR2BX1 U100 ( .AN(n309), .B(n316), .Y(n312) );
  OAI211X1 U101 ( .A0(n20), .A1(F_WEN_B), .B0(n23), .C0(n26), .Y(n309) );
  NAND2X1 U102 ( .A(state[4]), .B(state[0]), .Y(n271) );
  NAND2X1 U103 ( .A(state[2]), .B(state[0]), .Y(n248) );
  CLKINVX1 U104 ( .A(state[0]), .Y(n10) );
  AOI2BB1X1 U105 ( .A0N(n28), .A1N(n249), .B0(rst), .Y(n313) );
  OAI31XL U106 ( .A0(n23), .A1(n186), .A2(n248), .B0(n25), .Y(n249) );
  NAND2X1 U107 ( .A(state[1]), .B(n10), .Y(n263) );
  OAI211X1 U108 ( .A0(n261), .A1(n257), .B0(n270), .C0(n262), .Y(n290) );
  NAND2X1 U109 ( .A(state[4]), .B(n10), .Y(n257) );
  CLKINVX1 U110 ( .A(state[4]), .Y(n28) );
  NAND3X1 U111 ( .A(counter[1]), .B(counter[0]), .C(counter[2]), .Y(n251) );
  AOI21X1 U112 ( .A0(n10), .A1(n298), .B0(state[4]), .Y(n317) );
  CLKINVX1 U113 ( .A(state[1]), .Y(n23) );
  OAI2BB2XL U114 ( .B0(n10), .B1(n286), .A0N(n7), .A1N(n259), .Y(n188) );
  OAI211X1 U115 ( .A0(n6), .A1(n281), .B0(n258), .C0(n268), .Y(n259) );
  AO21X1 U116 ( .A0(state[4]), .A1(n264), .B0(state[0]), .Y(n258) );
  CLKINVX1 U117 ( .A(n290), .Y(n6) );
  NAND4BX1 U118 ( .AN(n330), .B(page[8]), .C(page[7]), .D(n329), .Y(n331) );
  AND3X2 U119 ( .A(page[6]), .B(page[4]), .C(page[5]), .Y(n329) );
  NAND4BX1 U120 ( .AN(n328), .B(page[3]), .C(page[1]), .D(page[2]), .Y(n330)
         );
  NAND3BX1 U121 ( .AN(n327), .B(n326), .C(page[0]), .Y(n328) );
  NAND2X1 U122 ( .A(n26), .B(state[0]), .Y(n296) );
  NAND2X1 U123 ( .A(state[3]), .B(n23), .Y(n280) );
  NAND4X1 U124 ( .A(n293), .B(n34), .C(n292), .D(n291), .Y(n192) );
  AOI21X1 U125 ( .A0(n289), .A1(n332), .B0(n288), .Y(n292) );
  AOI211X1 U126 ( .A0(state[3]), .A1(state[4]), .B0(n290), .C0(n17), .Y(n291)
         );
  NAND3X1 U127 ( .A(n11), .B(n28), .C(state[1]), .Y(n278) );
  OAI2BB2XL U128 ( .B0(n32), .B1(n314), .A0N(N146), .A1N(n315), .Y(n204) );
  OAI2BB2XL U129 ( .B0(n321), .B1(n320), .A0N(F_WEN_A), .A1N(n321), .Y(n213)
         );
  AOI32X1 U130 ( .A0(state[2]), .A1(n28), .A2(state[1]), .B0(n319), .B1(n10), 
        .Y(n320) );
  OAI2BB2XL U131 ( .B0(n321), .B1(n318), .A0N(F_CLE_A), .A1N(n321), .Y(n212)
         );
  NOR2BX1 U132 ( .AN(n317), .B(state[3]), .Y(n318) );
  NAND3X1 U133 ( .A(state[4]), .B(n27), .C(n9), .Y(n262) );
  NAND2X1 U134 ( .A(state[3]), .B(state[1]), .Y(n327) );
  NAND3X1 U135 ( .A(state[4]), .B(n10), .C(n22), .Y(n270) );
  NOR2X1 U136 ( .A(state[3]), .B(n26), .Y(n264) );
  NAND3X1 U137 ( .A(state[3]), .B(n256), .C(n255), .Y(n286) );
  OAI31XL U138 ( .A0(n19), .A1(state[4]), .A2(state[0]), .B0(n298), .Y(n256)
         );
  AOI211X1 U139 ( .A0(n254), .A1(n9), .B0(rst), .C0(n326), .Y(n255) );
  NOR2X1 U140 ( .A(F_RB_B), .B(n304), .Y(n254) );
  AOI32X1 U141 ( .A0(n9), .A1(n28), .A2(state[2]), .B0(n186), .B1(n288), .Y(
        n268) );
  AOI31X1 U142 ( .A0(state[0]), .A1(n25), .A2(n23), .B0(n22), .Y(n301) );
  AO22X1 U143 ( .A0(page[8]), .A1(n295), .B0(N170), .B1(n294), .Y(n201) );
  AO22X1 U144 ( .A0(counter[8]), .A1(n5), .B0(N154), .B1(n315), .Y(n211) );
  AO22X1 U145 ( .A0(page[0]), .A1(n295), .B0(N162), .B1(n294), .Y(n194) );
  AO22X1 U146 ( .A0(counter[7]), .A1(n5), .B0(N153), .B1(n315), .Y(n210) );
  AO22X1 U147 ( .A0(counter[6]), .A1(n5), .B0(N152), .B1(n315), .Y(n209) );
  AO22X1 U148 ( .A0(counter[5]), .A1(n5), .B0(N151), .B1(n315), .Y(n208) );
  AO22X1 U149 ( .A0(counter[4]), .A1(n5), .B0(N150), .B1(n315), .Y(n207) );
  AO22X1 U150 ( .A0(counter[3]), .A1(n5), .B0(N149), .B1(n315), .Y(n206) );
  AO22X1 U151 ( .A0(counter[2]), .A1(n5), .B0(N148), .B1(n315), .Y(n205) );
  AO22X1 U152 ( .A0(page[7]), .A1(n295), .B0(N169), .B1(n294), .Y(n200) );
  AO22X1 U153 ( .A0(page[6]), .A1(n295), .B0(N168), .B1(n294), .Y(n199) );
  AO22X1 U154 ( .A0(page[5]), .A1(n295), .B0(N167), .B1(n294), .Y(n198) );
  AO22X1 U155 ( .A0(page[4]), .A1(n295), .B0(N166), .B1(n294), .Y(n197) );
  AO22X1 U156 ( .A0(page[3]), .A1(n295), .B0(N165), .B1(n294), .Y(n196) );
  AO22X1 U157 ( .A0(page[2]), .A1(n295), .B0(N164), .B1(n294), .Y(n195) );
  AO22X1 U158 ( .A0(page[1]), .A1(n295), .B0(N163), .B1(n294), .Y(n193) );
  OAI31XL U159 ( .A0(n325), .A1(state[4]), .A2(state[3]), .B0(n324), .Y(n214)
         );
  NAND2X1 U160 ( .A(F_IO_A_READING), .B(n325), .Y(n324) );
  AOI2BB1X1 U161 ( .A0N(n323), .A1N(n322), .B0(N227), .Y(n325) );
  OAI21XL U162 ( .A0(state[3]), .A1(n278), .B0(n313), .Y(N227) );
  OAI211X1 U163 ( .A0(state[0]), .A1(n27), .B0(n302), .C0(n301), .Y(n303) );
  NAND3X1 U164 ( .A(n27), .B(n25), .C(state[1]), .Y(n302) );
  OAI31XL U165 ( .A0(n25), .A1(rst), .A2(n14), .B0(n334), .Y(n215) );
  NAND2X1 U166 ( .A(done), .B(n14), .Y(n334) );
  CLKINVX1 U167 ( .A(n333), .Y(n14) );
  OAI211X1 U168 ( .A0(n336), .A1(n332), .B0(n331), .C0(n34), .Y(n333) );
  CLKINVX1 U169 ( .A(counter[1]), .Y(n29) );
  CLKINVX1 U170 ( .A(counter[0]), .Y(n32) );
  NAND3BX1 U171 ( .AN(KEY[0]), .B(n260), .C(KEY[2]), .Y(n332) );
  NOR2BX1 U172 ( .AN(n229), .B(counter[0]), .Y(n240) );
  NAND4BBXL U173 ( .AN(KEY[1]), .BN(KEY[2]), .C(KEY[3]), .D(KEY[0]), .Y(n277)
         );
  AOI2BB2X1 U174 ( .B0(n22), .B1(page[5]), .A0N(n236), .A1N(n280), .Y(n238) );
  AOI22X1 U175 ( .A0(n242), .A1(n235), .B0(F_IO_A_IN[5]), .B1(n246), .Y(n236)
         );
  NAND3X1 U176 ( .A(n234), .B(n29), .C(n233), .Y(n235) );
  NOR3BXL U177 ( .AN(n260), .B(KEY[0]), .C(KEY[2]), .Y(n282) );
  NOR2X1 U178 ( .A(n338), .B(state[0]), .Y(n242) );
  OAI2BB1X1 U179 ( .A0N(page[0]), .A1N(n217), .B0(n216), .Y(F_IO_A_OUT[0]) );
  NAND4X1 U180 ( .A(n13), .B(page[8]), .C(state[1]), .D(state[2]), .Y(n216) );
  NAND4X1 U181 ( .A(KEY[3]), .B(KEY[2]), .C(KEY[1]), .D(KEY[0]), .Y(n335) );
  OAI21XL U182 ( .A0(n245), .A1(n244), .B0(n243), .Y(F_IO_B_OUT[6]) );
  AOI22X1 U183 ( .A0(n242), .A1(n241), .B0(F_IO_A_IN[6]), .B1(n246), .Y(n245)
         );
  NAND2X1 U184 ( .A(n240), .B(n239), .Y(n241) );
  NOR2X1 U185 ( .A(WTMK_ACTIVE), .B(state[0]), .Y(n246) );
  NOR2X1 U186 ( .A(KEY[3]), .B(KEY[1]), .Y(n260) );
  NAND2BX1 U187 ( .AN(n239), .B(counter[2]), .Y(n233) );
  NAND2X1 U188 ( .A(n217), .B(page[6]), .Y(n243) );
  NAND2X1 U189 ( .A(n217), .B(page[4]), .Y(n231) );
  NAND2X1 U190 ( .A(n217), .B(page[3]), .Y(n226) );
  NAND2X1 U191 ( .A(n217), .B(page[2]), .Y(n222) );
  NAND2X1 U192 ( .A(n217), .B(page[1]), .Y(n220) );
  NAND3X1 U193 ( .A(KEY[2]), .B(KEY[0]), .C(n260), .Y(n281) );
  NAND3X1 U194 ( .A(counter[0]), .B(n29), .C(counter[2]), .Y(n234) );
  CLKINVX1 U195 ( .A(rst), .Y(n34) );
  AND2X2 U196 ( .A(page[5]), .B(n217), .Y(F_IO_A_OUT[5]) );
  NAND3X1 U197 ( .A(counter[1]), .B(n32), .C(counter[2]), .Y(n229) );
  NAND2X1 U198 ( .A(F_IO_A_IN[3]), .B(n225), .Y(n227) );
  NAND2X1 U199 ( .A(F_IO_A_IN[2]), .B(n225), .Y(n223) );
  NAND2X1 U200 ( .A(F_IO_A_IN[1]), .B(n225), .Y(n221) );
  NAND2X1 U201 ( .A(F_IO_A_IN[0]), .B(n225), .Y(n218) );
  AOI221XL U202 ( .A0(F_IO_A_IN[4]), .A1(n246), .B0(n242), .B1(n230), .C0(
        state[0]), .Y(n232) );
  OAI21XL U203 ( .A0(counter[2]), .A1(n239), .B0(n240), .Y(n230) );
  CLKINVX1 U204 ( .A(page[7]), .Y(n33) );
  AOI31X1 U205 ( .A0(n246), .A1(n21), .A2(F_IO_A_IN[7]), .B0(n24), .Y(n247) );
  CLKINVX1 U206 ( .A(n261), .Y(n24) );
  CLKINVX1 U207 ( .A(F_RB_B), .Y(n185) );
endmodule


module TMR_1bit_0 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;
  wire   n1;

  OAI2BB1X1 U1 ( .A0N(dataA_in), .A1N(dataB_in), .B0(n1), .Y(data_out) );
  OAI21XL U2 ( .A0(dataA_in), .A1(dataB_in), .B0(dataC_in), .Y(n1) );
endmodule


module TMR_8bit_0 ( data_out, dataA_in, dataB_in, dataC_in );
  output [7:0] data_out;
  input [7:0] dataA_in;
  input [7:0] dataB_in;
  input [7:0] dataC_in;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  OAI2BB1X1 U1 ( .A0N(dataA_in[0]), .A1N(dataB_in[0]), .B0(n8), .Y(data_out[0]) );
  OAI21XL U2 ( .A0(dataA_in[0]), .A1(dataB_in[0]), .B0(dataC_in[0]), .Y(n8) );
  OAI2BB1X1 U3 ( .A0N(dataA_in[7]), .A1N(dataB_in[7]), .B0(n1), .Y(data_out[7]) );
  OAI21XL U4 ( .A0(dataA_in[7]), .A1(dataB_in[7]), .B0(dataC_in[7]), .Y(n1) );
  OAI2BB1X1 U5 ( .A0N(dataA_in[6]), .A1N(dataB_in[6]), .B0(n2), .Y(data_out[6]) );
  OAI21XL U6 ( .A0(dataA_in[6]), .A1(dataB_in[6]), .B0(dataC_in[6]), .Y(n2) );
  OAI2BB1X1 U7 ( .A0N(dataA_in[4]), .A1N(dataB_in[4]), .B0(n4), .Y(data_out[4]) );
  OAI21XL U8 ( .A0(dataA_in[4]), .A1(dataB_in[4]), .B0(dataC_in[4]), .Y(n4) );
  OAI2BB1X1 U9 ( .A0N(dataA_in[3]), .A1N(dataB_in[3]), .B0(n5), .Y(data_out[3]) );
  OAI21XL U10 ( .A0(dataA_in[3]), .A1(dataB_in[3]), .B0(dataC_in[3]), .Y(n5)
         );
  OAI2BB1X1 U11 ( .A0N(dataA_in[2]), .A1N(dataB_in[2]), .B0(n6), .Y(
        data_out[2]) );
  OAI21XL U12 ( .A0(dataA_in[2]), .A1(dataB_in[2]), .B0(dataC_in[2]), .Y(n6)
         );
  OAI2BB1X1 U13 ( .A0N(dataA_in[1]), .A1N(dataB_in[1]), .B0(n7), .Y(
        data_out[1]) );
  OAI21XL U14 ( .A0(dataA_in[1]), .A1(dataB_in[1]), .B0(dataC_in[1]), .Y(n7)
         );
  OAI2BB1X1 U15 ( .A0N(dataA_in[5]), .A1N(dataB_in[5]), .B0(n3), .Y(
        data_out[5]) );
  OAI21XL U16 ( .A0(dataA_in[5]), .A1(dataB_in[5]), .B0(dataC_in[5]), .Y(n3)
         );
endmodule


module TMR_1bit_10 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;
  wire   n2;

  OAI2BB1X1 U1 ( .A0N(dataA_in), .A1N(dataB_in), .B0(n2), .Y(data_out) );
  OAI21XL U2 ( .A0(dataA_in), .A1(dataB_in), .B0(dataC_in), .Y(n2) );
endmodule


module TMR_1bit_9 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;
  wire   n2;

  OAI2BB1X1 U1 ( .A0N(dataA_in), .A1N(dataB_in), .B0(n2), .Y(data_out) );
  OAI21XL U2 ( .A0(dataA_in), .A1(dataB_in), .B0(dataC_in), .Y(n2) );
endmodule


module TMR_1bit_8 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;
  wire   n2;

  OAI2BB1X1 U1 ( .A0N(dataA_in), .A1N(dataB_in), .B0(n2), .Y(data_out) );
  OAI21XL U2 ( .A0(dataA_in), .A1(dataB_in), .B0(dataC_in), .Y(n2) );
endmodule


module TMR_1bit_7 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;
  wire   n2;

  OAI2BB1X1 U1 ( .A0N(dataA_in), .A1N(dataB_in), .B0(n2), .Y(data_out) );
  OAI21XL U2 ( .A0(dataA_in), .A1(dataB_in), .B0(dataC_in), .Y(n2) );
endmodule


module TMR_8bit_1 ( data_out, dataA_in, dataB_in, dataC_in );
  output [7:0] data_out;
  input [7:0] dataA_in;
  input [7:0] dataB_in;
  input [7:0] dataC_in;
  wire   n9, n10, n11, n12, n13, n14, n15, n16;

  OAI2BB1X1 U1 ( .A0N(dataA_in[6]), .A1N(dataB_in[6]), .B0(n15), .Y(
        data_out[6]) );
  OAI21XL U2 ( .A0(dataA_in[6]), .A1(dataB_in[6]), .B0(dataC_in[6]), .Y(n15)
         );
  OAI2BB1X1 U3 ( .A0N(dataA_in[5]), .A1N(dataB_in[5]), .B0(n14), .Y(
        data_out[5]) );
  OAI21XL U4 ( .A0(dataA_in[5]), .A1(dataB_in[5]), .B0(dataC_in[5]), .Y(n14)
         );
  OAI2BB1X1 U5 ( .A0N(dataA_in[4]), .A1N(dataB_in[4]), .B0(n13), .Y(
        data_out[4]) );
  OAI21XL U6 ( .A0(dataA_in[4]), .A1(dataB_in[4]), .B0(dataC_in[4]), .Y(n13)
         );
  OAI2BB1X1 U7 ( .A0N(dataA_in[7]), .A1N(dataB_in[7]), .B0(n16), .Y(
        data_out[7]) );
  OAI21XL U8 ( .A0(dataA_in[7]), .A1(dataB_in[7]), .B0(dataC_in[7]), .Y(n16)
         );
  OAI2BB1X1 U9 ( .A0N(dataA_in[3]), .A1N(dataB_in[3]), .B0(n12), .Y(
        data_out[3]) );
  OAI21XL U10 ( .A0(dataA_in[3]), .A1(dataB_in[3]), .B0(dataC_in[3]), .Y(n12)
         );
  OAI2BB1X1 U11 ( .A0N(dataA_in[2]), .A1N(dataB_in[2]), .B0(n11), .Y(
        data_out[2]) );
  OAI21XL U12 ( .A0(dataA_in[2]), .A1(dataB_in[2]), .B0(dataC_in[2]), .Y(n11)
         );
  OAI2BB1X1 U13 ( .A0N(dataA_in[1]), .A1N(dataB_in[1]), .B0(n10), .Y(
        data_out[1]) );
  OAI21XL U14 ( .A0(dataA_in[1]), .A1(dataB_in[1]), .B0(dataC_in[1]), .Y(n10)
         );
  OAI2BB1X1 U15 ( .A0N(dataA_in[0]), .A1N(dataB_in[0]), .B0(n9), .Y(
        data_out[0]) );
  OAI21XL U16 ( .A0(dataA_in[0]), .A1(dataB_in[0]), .B0(dataC_in[0]), .Y(n9)
         );
endmodule


module TMR_1bit_6 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;
  wire   n2;

  OAI2BB1X1 U1 ( .A0N(dataA_in), .A1N(dataB_in), .B0(n2), .Y(data_out) );
  OAI21XL U2 ( .A0(dataA_in), .A1(dataB_in), .B0(dataC_in), .Y(n2) );
endmodule


module TMR_1bit_5 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;
  wire   n2;

  OAI2BB1X1 U1 ( .A0N(dataA_in), .A1N(dataB_in), .B0(n2), .Y(data_out) );
  OAI21XL U2 ( .A0(dataA_in), .A1(dataB_in), .B0(dataC_in), .Y(n2) );
endmodule


module TMR_1bit_4 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;
  wire   n2;

  OAI2BB1X1 U1 ( .A0N(dataA_in), .A1N(dataB_in), .B0(n2), .Y(data_out) );
  OAI21XL U2 ( .A0(dataA_in), .A1(dataB_in), .B0(dataC_in), .Y(n2) );
endmodule


module TMR_1bit_3 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;
  wire   n2;

  OAI2BB1X1 U1 ( .A0N(dataA_in), .A1N(dataB_in), .B0(n2), .Y(data_out) );
  OAI21XL U2 ( .A0(dataA_in), .A1(dataB_in), .B0(dataC_in), .Y(n2) );
endmodule


module TMR_1bit_2 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;
  wire   n2;

  OAI2BB1X1 U1 ( .A0N(dataA_in), .A1N(dataB_in), .B0(n2), .Y(data_out) );
  OAI21XL U2 ( .A0(dataA_in), .A1(dataB_in), .B0(dataC_in), .Y(n2) );
endmodule


module TMR_1bit_1 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;
  wire   n2;

  OAI2BB1X1 U1 ( .A0N(dataA_in), .A1N(dataB_in), .B0(n2), .Y(data_out) );
  OAI21XL U2 ( .A0(dataA_in), .A1(dataB_in), .B0(dataC_in), .Y(n2) );
endmodule


module NFC_TMR ( clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, 
        F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, KEY );
  inout [7:0] F_IO_A;
  inout [7:0] F_IO_B;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B;
  wire   F_IO_A_READING, F_IO_B_READING, OA_done, OA_F_CLE_A, OA_F_ALE_A,
         OA_F_REN_A, OA_F_WEN_A, OA_F_CLE_B, OA_F_ALE_B, OA_F_WEN_B,
         OA_F_IO_A_READING, OB_done, OB_F_CLE_A, OB_F_ALE_A, OB_F_REN_A,
         OB_F_WEN_A, OB_F_CLE_B, OB_F_ALE_B, OB_F_WEN_B, OB_F_IO_A_READING,
         OC_done, OC_F_CLE_A, OC_F_ALE_A, OC_F_REN_A, OC_F_WEN_A, OC_F_CLE_B,
         OC_F_ALE_B, OC_F_WEN_B, OC_F_IO_A_READING, n3, n4;
  wire   [7:0] F_IO_A_OUT;
  wire   [7:0] F_IO_B_OUT;
  wire   [7:0] OA_F_IO_A_OUT;
  wire   [7:0] OA_F_IO_B_OUT;
  wire   [7:0] OB_F_IO_A_OUT;
  wire   [7:0] OB_F_IO_B_OUT;
  wire   [7:0] OC_F_IO_A_OUT;
  wire   [7:0] OC_F_IO_B_OUT;

  NFC_0 OriNFC_A ( .clk(clk), .rst(rst), .done(OA_done), .F_IO_A_IN(F_IO_A), 
        .F_IO_A_OUT(OA_F_IO_A_OUT), .F_CLE_A(OA_F_CLE_A), .F_ALE_A(OA_F_ALE_A), 
        .F_REN_A(OA_F_REN_A), .F_WEN_A(OA_F_WEN_A), .F_RB_A(F_RB_A), 
        .F_IO_B_IN(F_IO_B), .F_IO_B_OUT(OA_F_IO_B_OUT), .F_CLE_B(OA_F_CLE_B), 
        .F_ALE_B(OA_F_ALE_B), .F_WEN_B(OA_F_WEN_B), .F_RB_B(F_RB_B), 
        .F_IO_A_READING(OA_F_IO_A_READING), .KEY(KEY) );
  NFC_2 OriNFC_B ( .clk(clk), .rst(rst), .done(OB_done), .F_IO_A_IN(F_IO_A), 
        .F_IO_A_OUT(OB_F_IO_A_OUT), .F_CLE_A(OB_F_CLE_A), .F_ALE_A(OB_F_ALE_A), 
        .F_REN_A(OB_F_REN_A), .F_WEN_A(OB_F_WEN_A), .F_RB_A(F_RB_A), 
        .F_IO_B_IN(F_IO_B), .F_IO_B_OUT(OB_F_IO_B_OUT), .F_CLE_B(OB_F_CLE_B), 
        .F_ALE_B(OB_F_ALE_B), .F_WEN_B(OB_F_WEN_B), .F_RB_B(F_RB_B), 
        .F_IO_A_READING(OB_F_IO_A_READING), .KEY(KEY) );
  NFC_1 OriNFC_C ( .clk(clk), .rst(rst), .done(OC_done), .F_IO_A_IN(F_IO_A), 
        .F_IO_A_OUT(OC_F_IO_A_OUT), .F_CLE_A(OC_F_CLE_A), .F_ALE_A(OC_F_ALE_A), 
        .F_REN_A(OC_F_REN_A), .F_WEN_A(OC_F_WEN_A), .F_RB_A(F_RB_A), 
        .F_IO_B_IN(F_IO_B), .F_IO_B_OUT(OC_F_IO_B_OUT), .F_CLE_B(OC_F_CLE_B), 
        .F_ALE_B(OC_F_ALE_B), .F_WEN_B(OC_F_WEN_B), .F_RB_B(F_RB_B), 
        .F_IO_A_READING(OC_F_IO_A_READING), .KEY(KEY) );
  TMR_1bit_0 TMR_done ( .data_out(done), .dataA_in(OA_done), .dataB_in(OB_done), .dataC_in(OC_done) );
  TMR_8bit_0 TMR_F_IO_A_OUT ( .data_out(F_IO_A_OUT), .dataA_in(OA_F_IO_A_OUT), 
        .dataB_in(OB_F_IO_A_OUT), .dataC_in(OC_F_IO_A_OUT) );
  TMR_1bit_10 TMR_F_CLE_A ( .data_out(F_CLE_A), .dataA_in(OA_F_CLE_A), 
        .dataB_in(OB_F_CLE_A), .dataC_in(OC_F_CLE_A) );
  TMR_1bit_9 TMR_F_ALE_A ( .data_out(F_ALE_A), .dataA_in(OA_F_ALE_A), 
        .dataB_in(OB_F_ALE_A), .dataC_in(OC_F_ALE_A) );
  TMR_1bit_8 TMR_F_REN_A ( .data_out(F_REN_A), .dataA_in(OA_F_REN_A), 
        .dataB_in(OB_F_REN_A), .dataC_in(OC_F_REN_A) );
  TMR_1bit_7 TMR_F_WEN_A ( .data_out(F_WEN_A), .dataA_in(OA_F_WEN_A), 
        .dataB_in(OB_F_WEN_A), .dataC_in(OC_F_WEN_A) );
  TMR_8bit_1 TMR_F_IO_B_OUT ( .data_out(F_IO_B_OUT), .dataA_in(OA_F_IO_B_OUT), 
        .dataB_in(OB_F_IO_B_OUT), .dataC_in(OC_F_IO_B_OUT) );
  TMR_1bit_6 TMR_F_CLE_B ( .data_out(F_CLE_B), .dataA_in(OA_F_CLE_B), 
        .dataB_in(OB_F_CLE_B), .dataC_in(OC_F_CLE_B) );
  TMR_1bit_5 TMR_F_ALE_B ( .data_out(F_ALE_B), .dataA_in(OA_F_ALE_B), 
        .dataB_in(OB_F_ALE_B), .dataC_in(OC_F_ALE_B) );
  TMR_1bit_4 TMR_F_REN_B ( .data_out(F_REN_B), .dataA_in(1'b1), .dataB_in(1'b1), .dataC_in(1'b1) );
  TMR_1bit_3 TMR_F_WEN_B ( .data_out(F_WEN_B), .dataA_in(OA_F_WEN_B), 
        .dataB_in(OB_F_WEN_B), .dataC_in(OC_F_WEN_B) );
  TMR_1bit_2 TMR_F_IO_A_READING ( .data_out(F_IO_A_READING), .dataA_in(
        OA_F_IO_A_READING), .dataB_in(OB_F_IO_A_READING), .dataC_in(
        OC_F_IO_A_READING) );
  TMR_1bit_1 TMR_F_IO_B_READING ( .data_out(F_IO_B_READING), .dataA_in(1'b0), 
        .dataB_in(1'b0), .dataC_in(1'b0) );
  TBUFXL \F_IO_A_tri[7]  ( .A(F_IO_A_OUT[7]), .OE(n3), .Y(F_IO_A[7]) );
  TBUFXL \F_IO_A_tri[4]  ( .A(F_IO_A_OUT[4]), .OE(n3), .Y(F_IO_A[4]) );
  TBUFXL \F_IO_A_tri[5]  ( .A(F_IO_A_OUT[5]), .OE(n3), .Y(F_IO_A[5]) );
  TBUFXL \F_IO_A_tri[6]  ( .A(F_IO_A_OUT[6]), .OE(n3), .Y(F_IO_A[6]) );
  TBUFXL \F_IO_B_tri[0]  ( .A(F_IO_B_OUT[0]), .OE(n4), .Y(F_IO_B[0]) );
  TBUFXL \F_IO_B_tri[1]  ( .A(F_IO_B_OUT[1]), .OE(n4), .Y(F_IO_B[1]) );
  TBUFXL \F_IO_B_tri[2]  ( .A(F_IO_B_OUT[2]), .OE(n4), .Y(F_IO_B[2]) );
  TBUFXL \F_IO_B_tri[3]  ( .A(F_IO_B_OUT[3]), .OE(n4), .Y(F_IO_B[3]) );
  TBUFXL \F_IO_B_tri[4]  ( .A(F_IO_B_OUT[4]), .OE(n4), .Y(F_IO_B[4]) );
  TBUFXL \F_IO_B_tri[5]  ( .A(F_IO_B_OUT[5]), .OE(n4), .Y(F_IO_B[5]) );
  TBUFXL \F_IO_B_tri[6]  ( .A(F_IO_B_OUT[6]), .OE(n4), .Y(F_IO_B[6]) );
  TBUFXL \F_IO_B_tri[7]  ( .A(F_IO_B_OUT[7]), .OE(n4), .Y(F_IO_B[7]) );
  TBUFXL \F_IO_A_tri[0]  ( .A(F_IO_A_OUT[0]), .OE(n3), .Y(F_IO_A[0]) );
  TBUFXL \F_IO_A_tri[1]  ( .A(F_IO_A_OUT[1]), .OE(n3), .Y(F_IO_A[1]) );
  TBUFXL \F_IO_A_tri[2]  ( .A(F_IO_A_OUT[2]), .OE(n3), .Y(F_IO_A[2]) );
  TBUFXL \F_IO_A_tri[3]  ( .A(F_IO_A_OUT[3]), .OE(n3), .Y(F_IO_A[3]) );
  CLKINVX1 U3 ( .A(F_IO_A_READING), .Y(n3) );
  CLKINVX1 U4 ( .A(F_IO_B_READING), .Y(n4) );
endmodule

