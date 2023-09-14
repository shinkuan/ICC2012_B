/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Thu Sep 14 23:42:39 2023
/////////////////////////////////////////////////////////////


module NFC_0_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  HA1 U1_1_7 ( .A(A[7]), .B(carry[7]), .C(carry[8]), .S(SUM[7]) );
  HA1 U1_1_6 ( .A(A[6]), .B(carry[6]), .C(carry[7]), .S(SUM[6]) );
  HA1 U1_1_5 ( .A(A[5]), .B(carry[5]), .C(carry[6]), .S(SUM[5]) );
  HA1 U1_1_4 ( .A(A[4]), .B(carry[4]), .C(carry[5]), .S(SUM[4]) );
  HA1 U1_1_3 ( .A(A[3]), .B(carry[3]), .C(carry[4]), .S(SUM[3]) );
  HA1 U1_1_2 ( .A(A[2]), .B(carry[2]), .C(carry[3]), .S(SUM[2]) );
  HA1 U1_1_1 ( .A(A[1]), .B(A[0]), .C(carry[2]), .S(SUM[1]) );
  XOR2HS U1 ( .I1(carry[8]), .I2(A[8]), .O(SUM[8]) );
  INV1S U2 ( .I(A[0]), .O(SUM[0]) );
endmodule


module NFC_0_DW01_inc_1 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  HA1 U1_1_7 ( .A(A[7]), .B(carry[7]), .C(carry[8]), .S(SUM[7]) );
  HA1 U1_1_6 ( .A(A[6]), .B(carry[6]), .C(carry[7]), .S(SUM[6]) );
  HA1 U1_1_5 ( .A(A[5]), .B(carry[5]), .C(carry[6]), .S(SUM[5]) );
  HA1 U1_1_4 ( .A(A[4]), .B(carry[4]), .C(carry[5]), .S(SUM[4]) );
  HA1 U1_1_3 ( .A(A[3]), .B(carry[3]), .C(carry[4]), .S(SUM[3]) );
  HA1 U1_1_2 ( .A(A[2]), .B(carry[2]), .C(carry[3]), .S(SUM[2]) );
  HA1 U1_1_1 ( .A(A[1]), .B(A[0]), .C(carry[2]), .S(SUM[1]) );
  XOR2HS U1 ( .I1(carry[8]), .I2(A[8]), .O(SUM[8]) );
  INV1S U2 ( .I(A[0]), .O(SUM[0]) );
endmodule


module NFC_0 ( clk, rst, done, F_IO_A_IN, F_IO_A_OUT, F_CLE_A, F_ALE_A, 
        F_REN_A, F_WEN_A, F_RB_A, F_IO_B_OUT, F_CLE_B, F_ALE_B, F_REN_B, 
        F_WEN_B, F_RB_B, F_IO_A_READING, F_IO_B_READING, KEY );
  input [7:0] F_IO_A_IN;
  output [7:0] F_IO_A_OUT;
  output [7:0] F_IO_B_OUT;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B, F_IO_A_READING, F_IO_B_READING;
  wire   WTMK_ACTIVE, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N162, N163, N164, N165, N166, N167, N168, N169, N170, n4, n5, n6, n26,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n2, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n214,
         n215, n216, n217, n218, n219, n220;
  wire   [4:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;

  ND2 U178 ( .I1(n55), .I2(n217), .O(n54) );
  ND2 U179 ( .I1(n36), .I2(n37), .O(n64) );
  AN2 U180 ( .I1(n36), .I2(n73), .O(n72) );
  OA13S U181 ( .B1(n38), .B2(n10), .B3(n66), .A1(n74), .O(n68) );
  AO22 U182 ( .A1(counter[8]), .A2(n75), .B1(N154), .B2(n76), .O(n186) );
  AO22 U183 ( .A1(counter[7]), .A2(n75), .B1(N153), .B2(n76), .O(n187) );
  AO22 U184 ( .A1(counter[5]), .A2(n75), .B1(N151), .B2(n76), .O(n189) );
  OA13S U185 ( .B1(n40), .B2(n41), .B3(n65), .A1(n77), .O(n75) );
  AN2 U186 ( .I1(n74), .I2(n83), .O(n78) );
  ND2 U187 ( .I1(n82), .I2(n39), .O(n70) );
  OA112 U188 ( .C1(n11), .C2(n39), .A1(n89), .B1(n90), .O(n88) );
  OA112 U189 ( .C1(n36), .C2(n218), .A1(n73), .B1(n92), .O(n91) );
  ND2 U191 ( .I1(n104), .I2(n56), .O(n102) );
  AN3B2S U192 ( .I1(n92), .B1(n109), .B2(n110), .O(n106) );
  AN2 U193 ( .I1(n53), .I2(n104), .O(n116) );
  AN2 U194 ( .I1(KEY[0]), .I2(KEY[1]), .O(n118) );
  OA222 U195 ( .A1(n219), .A2(n123), .B1(n97), .B2(n124), .C1(n103), .C2(n119), 
        .O(n122) );
  ND2 U196 ( .I1(n10), .I2(n36), .O(n124) );
  OA222 U197 ( .A1(n105), .A2(n219), .B1(n25), .B2(n131), .C1(n132), .C2(n28), 
        .O(n130) );
  ND2 U198 ( .I1(n33), .I2(n37), .O(n131) );
  AN3B2S U199 ( .I1(n133), .B1(KEY[0]), .B2(KEY[2]), .O(n111) );
  ND2 U200 ( .I1(n96), .I2(n126), .O(n123) );
  ND2 U201 ( .I1(n108), .I2(n217), .O(n107) );
  AN2 U202 ( .I1(n9), .I2(n132), .O(n138) );
  ND2 U203 ( .I1(state[2]), .I2(n37), .O(n141) );
  OR3 U204 ( .I1(n142), .I2(n36), .I3(n143), .O(n108) );
  AN3 U205 ( .I1(n148), .I2(F_WEN_B), .I3(n80), .O(n146) );
  ND2 U206 ( .I1(F_REN_A), .I2(F_RB_A), .O(n80) );
  ND2 U207 ( .I1(n217), .I2(n149), .O(n87) );
  AO12 U208 ( .B1(n104), .B2(n56), .A1(state[3]), .O(n149) );
  ND2 U209 ( .I1(n81), .I2(n11), .O(n97) );
  OR3B2 U210 ( .I1(KEY[0]), .B1(KEY[2]), .B2(n133), .O(n56) );
  ND2 U211 ( .I1(n33), .I2(n39), .O(n93) );
  AO12 U212 ( .B1(n153), .B2(n154), .A1(F_IO_A_OUT[6]), .O(F_IO_B_OUT[6]) );
  AN2 U213 ( .I1(n157), .I2(n158), .O(n156) );
  ND2 U214 ( .I1(n154), .I2(n166), .O(n165) );
  ND2 U215 ( .I1(F_IO_A_IN[4]), .I2(n152), .O(n168) );
  AN2 U216 ( .I1(n169), .I2(n43), .O(n157) );
  ND2 U217 ( .I1(F_IO_A_IN[3]), .I2(n173), .O(n172) );
  ND2 U218 ( .I1(F_IO_A_IN[2]), .I2(n173), .O(n174) );
  ND2 U219 ( .I1(F_IO_A_IN[1]), .I2(n173), .O(n175) );
  ND2 U220 ( .I1(F_IO_A_IN[0]), .I2(n173), .O(n177) );
  AN2 U221 ( .I1(n154), .I2(n152), .O(n173) );
  ND2 U222 ( .I1(n154), .I2(n12), .O(n171) );
  ND2 U223 ( .I1(WTMK_ACTIVE), .I2(n25), .O(n155) );
  AN2 U224 ( .I1(n164), .I2(n170), .O(n176) );
  ND2 U225 ( .I1(n43), .I2(n42), .O(n158) );
  ND2 U226 ( .I1(n18), .I2(page[8]), .O(n180) );
  ND2 U227 ( .I1(n217), .I2(n52), .O(n160) );
  ND2 U228 ( .I1(n104), .I2(n36), .O(n52) );
  AN3 U229 ( .I1(n95), .I2(n10), .I3(n9), .O(n104) );
  ND2 U230 ( .I1(n10), .I2(state[2]), .O(n179) );
  NFC_0_DW01_inc_0 add_585 ( .A(page), .SUM({N170, N169, N168, N167, N166, 
        N165, N164, N163, N162}) );
  NFC_0_DW01_inc_1 add_531 ( .A(counter), .SUM({N154, N153, N152, N151, N150, 
        N149, N148, N147, N146}) );
  QDFFN \counter_reg[7]  ( .D(n187), .CK(clk), .Q(counter[7]) );
  QDFFN \counter_reg[5]  ( .D(n189), .CK(clk), .Q(counter[5]) );
  QDFFN \counter_reg[8]  ( .D(n186), .CK(clk), .Q(counter[8]) );
  DFFN \counter_reg[6]  ( .D(n188), .CK(clk), .Q(counter[6]), .QB(n4) );
  DFFN \counter_reg[4]  ( .D(n190), .CK(clk), .Q(counter[4]), .QB(n5) );
  DFFN \counter_reg[3]  ( .D(n191), .CK(clk), .Q(counter[3]), .QB(n6) );
  DFFN done_reg ( .D(n182), .CK(clk), .Q(done), .QB(n26) );
  QDFFN F_ALE_A_reg ( .D(n199), .CK(clk), .Q(F_ALE_A) );
  QDFFN F_ALE_B_reg ( .D(n197), .CK(clk), .Q(F_ALE_B) );
  QDFFN F_CLE_B_reg ( .D(n198), .CK(clk), .Q(F_CLE_B) );
  QDFFN F_WEN_A_reg ( .D(n184), .CK(clk), .Q(F_WEN_A) );
  QDFFN F_CLE_A_reg ( .D(n185), .CK(clk), .Q(F_CLE_A) );
  QDFFN F_REN_A_reg ( .D(n195), .CK(clk), .Q(F_REN_A) );
  QDFFN F_WEN_B_reg ( .D(n196), .CK(clk), .Q(F_WEN_B) );
  QDFFN F_IO_A_READING_reg ( .D(n183), .CK(clk), .Q(F_IO_A_READING) );
  QDFFN \state_reg[1]  ( .D(n212), .CK(clk), .Q(state[1]) );
  QDFFN \state_reg[4]  ( .D(n209), .CK(clk), .Q(state[4]) );
  QDFFN \page_reg[7]  ( .D(n201), .CK(clk), .Q(page[7]) );
  QDFFN WTMK_ACTIVE_reg ( .D(n181), .CK(clk), .Q(WTMK_ACTIVE) );
  QDFFN \counter_reg[1]  ( .D(n194), .CK(clk), .Q(counter[1]) );
  QDFFN \page_reg[2]  ( .D(n206), .CK(clk), .Q(page[2]) );
  QDFFN \page_reg[5]  ( .D(n203), .CK(clk), .Q(page[5]) );
  QDFFN \page_reg[1]  ( .D(n208), .CK(clk), .Q(page[1]) );
  QDFFN \page_reg[4]  ( .D(n204), .CK(clk), .Q(page[4]) );
  QDFFN \page_reg[3]  ( .D(n205), .CK(clk), .Q(page[3]) );
  QDFFN \page_reg[6]  ( .D(n202), .CK(clk), .Q(page[6]) );
  QDFFN \page_reg[8]  ( .D(n200), .CK(clk), .Q(page[8]) );
  QDFFN \page_reg[0]  ( .D(n207), .CK(clk), .Q(page[0]) );
  QDFFN \counter_reg[0]  ( .D(n193), .CK(clk), .Q(counter[0]) );
  QDFFN \counter_reg[2]  ( .D(n192), .CK(clk), .Q(counter[2]) );
  QDFFN \state_reg[3]  ( .D(n210), .CK(clk), .Q(state[3]) );
  QDFFN \state_reg[0]  ( .D(n213), .CK(clk), .Q(state[0]) );
  QDFFN \state_reg[2]  ( .D(n211), .CK(clk), .Q(state[2]) );
  TIE1 U3 ( .O(n7) );
  TIE0 U4 ( .O(n2) );
  INV1S U5 ( .I(n2), .O(F_REN_B) );
  INV1S U6 ( .I(n7), .O(F_IO_B_READING) );
  INV1S U7 ( .I(n178), .O(n23) );
  NR2 U8 ( .I1(n160), .I2(n35), .O(n154) );
  NR2 U9 ( .I1(n160), .I2(n34), .O(n178) );
  INV1S U10 ( .I(n160), .O(n18) );
  INV1S U11 ( .I(n107), .O(n16) );
  INV1S U12 ( .I(F_IO_A_OUT[4]), .O(n19) );
  INV1S U13 ( .I(F_IO_A_OUT[3]), .O(n20) );
  INV1S U14 ( .I(F_IO_A_OUT[2]), .O(n21) );
  INV1S U15 ( .I(F_IO_A_OUT[1]), .O(n22) );
  INV1S U16 ( .I(n96), .O(n34) );
  INV1S U17 ( .I(n60), .O(n32) );
  INV1S U18 ( .I(n82), .O(n35) );
  OAI12HS U19 ( .B1(n30), .B2(n32), .A1(n77), .O(n98) );
  NR2 U20 ( .I1(n37), .I2(n25), .O(n126) );
  OAI12HS U21 ( .B1(n116), .B2(n29), .A1(n56), .O(n114) );
  OAI12HS U22 ( .B1(n106), .B2(n107), .A1(n108), .O(n210) );
  MOAI1S U23 ( .A1(n105), .A2(n111), .B1(n112), .B2(n113), .O(n110) );
  OAI112HS U24 ( .C1(n220), .C2(n103), .A1(n114), .B1(n115), .O(n109) );
  OA112 U25 ( .C1(n33), .C2(n38), .A1(n97), .B1(n24), .O(n8) );
  INV1S U26 ( .I(n61), .O(n30) );
  INV1S U27 ( .I(n111), .O(n219) );
  INV1S U28 ( .I(n119), .O(n220) );
  INV1S U29 ( .I(n112), .O(n15) );
  INV1S U30 ( .I(n140), .O(n28) );
  OAI112HS U31 ( .C1(n215), .C2(n34), .A1(n18), .B1(n151), .O(F_IO_B_OUT[7])
         );
  NR2 U32 ( .I1(n159), .I2(n160), .O(F_IO_B_OUT[5]) );
  OAI112HS U33 ( .C1(n32), .C2(n160), .A1(n165), .B1(n19), .O(F_IO_B_OUT[4])
         );
  OAI112HS U34 ( .C1(n170), .C2(n171), .A1(n172), .B1(n20), .O(F_IO_B_OUT[3])
         );
  OAI112HS U35 ( .C1(n176), .C2(n171), .A1(n17), .B1(n177), .O(F_IO_B_OUT[0])
         );
  OAI112HS U36 ( .C1(n171), .C2(n169), .A1(n174), .B1(n21), .O(F_IO_B_OUT[2])
         );
  OAI112HS U37 ( .C1(n171), .C2(n163), .A1(n175), .B1(n22), .O(F_IO_B_OUT[1])
         );
  INV1S U38 ( .I(rst), .O(n217) );
  NR2 U39 ( .I1(n39), .I2(n25), .O(n95) );
  INV1S U40 ( .I(n11), .O(n25) );
  NR2 U41 ( .I1(n23), .I2(n49), .O(F_IO_A_OUT[4]) );
  NR2 U42 ( .I1(n23), .I2(n48), .O(F_IO_A_OUT[3]) );
  NR2 U43 ( .I1(n23), .I2(n47), .O(F_IO_A_OUT[2]) );
  NR2 U44 ( .I1(n23), .I2(n45), .O(F_IO_A_OUT[1]) );
  NR2 U45 ( .I1(n23), .I2(n214), .O(F_IO_A_OUT[6]) );
  NR2 U46 ( .I1(n215), .I2(n23), .O(F_IO_A_OUT[7]) );
  NR2 U47 ( .I1(n50), .I2(n23), .O(F_IO_A_OUT[5]) );
  INV1S U48 ( .I(F_IO_A_OUT[0]), .O(n17) );
  NR2 U49 ( .I1(n36), .I2(n10), .O(n82) );
  NR2 U50 ( .I1(n39), .I2(n10), .O(n96) );
  NR3 U51 ( .I1(n42), .I2(n43), .I3(n44), .O(n148) );
  NR2 U52 ( .I1(n36), .I2(n33), .O(n60) );
  INV1S U53 ( .I(n10), .O(n33) );
  INV1S U54 ( .I(n155), .O(n12) );
  OR2 U55 ( .I1(n158), .I2(n44), .O(n164) );
  INV1S U56 ( .I(n75), .O(n13) );
  NR2 U57 ( .I1(n36), .I2(n75), .O(n76) );
  NR2 U58 ( .I1(KEY[3]), .I2(KEY[1]), .O(n133) );
  MOAI1S U59 ( .A1(n44), .A2(n13), .B1(N148), .B2(n76), .O(n192) );
  MOAI1S U60 ( .A1(n42), .A2(n13), .B1(N147), .B2(n76), .O(n194) );
  AOI13HS U61 ( .B1(n150), .B2(n36), .B3(n9), .A1(rst), .O(n77) );
  ND3 U62 ( .I1(n95), .I2(n56), .I3(n10), .O(n150) );
  OA12 U63 ( .B1(n97), .B2(n10), .A1(n24), .O(n74) );
  INV1S U64 ( .I(n87), .O(n24) );
  ND3 U65 ( .I1(n30), .I2(n217), .I3(n144), .O(n143) );
  AOI13HS U66 ( .B1(n25), .B2(n37), .B3(n66), .A1(n93), .O(n142) );
  ND3 U67 ( .I1(n81), .I2(n218), .I3(n140), .O(n144) );
  NR2 U68 ( .I1(n33), .I2(n11), .O(n140) );
  INV1S U69 ( .I(n9), .O(n37) );
  AOI12HS U70 ( .B1(n126), .B2(n134), .A1(n14), .O(n105) );
  INV1S U71 ( .I(n123), .O(n14) );
  OAI22S U72 ( .A1(n25), .A2(n108), .B1(n136), .B2(n107), .O(n213) );
  NR2 U73 ( .I1(n135), .I2(n137), .O(n136) );
  OAI22S U74 ( .A1(n15), .A2(n113), .B1(n11), .B2(n138), .O(n137) );
  ND3 U75 ( .I1(KEY[2]), .I2(KEY[0]), .I3(n133), .O(n113) );
  NR2 U76 ( .I1(n218), .I2(n97), .O(n61) );
  ND3 U77 ( .I1(n81), .I2(n25), .I3(n82), .O(n65) );
  ND3 U78 ( .I1(n100), .I2(n15), .I3(n101), .O(n209) );
  OA12 U79 ( .B1(n37), .B2(n36), .A1(n105), .O(n100) );
  AN4B1S U80 ( .I1(n102), .I2(n217), .I3(n103), .B1(n29), .O(n101) );
  MOAI1S U81 ( .A1(n39), .A2(n108), .B1(n16), .B2(n120), .O(n211) );
  ND3 U82 ( .I1(n121), .I2(n27), .I3(n122), .O(n120) );
  OA22 U83 ( .A1(n127), .A2(n113), .B1(n34), .B2(n9), .O(n121) );
  MOAI1S U84 ( .A1(n33), .A2(n108), .B1(n16), .B2(n128), .O(n212) );
  OAI112HS U85 ( .C1(n113), .C2(n129), .A1(n27), .B1(n130), .O(n128) );
  MOAI1S U86 ( .A1(n215), .A2(n98), .B1(N169), .B2(n99), .O(n201) );
  MOAI1S U87 ( .A1(n214), .A2(n98), .B1(N168), .B2(n99), .O(n202) );
  MOAI1S U88 ( .A1(n50), .A2(n98), .B1(N167), .B2(n99), .O(n203) );
  MOAI1S U89 ( .A1(n49), .A2(n98), .B1(N166), .B2(n99), .O(n204) );
  MOAI1S U90 ( .A1(n48), .A2(n98), .B1(N165), .B2(n99), .O(n205) );
  MOAI1S U91 ( .A1(n47), .A2(n98), .B1(N164), .B2(n99), .O(n206) );
  MOAI1S U92 ( .A1(n45), .A2(n98), .B1(N163), .B2(n99), .O(n208) );
  INV1S U93 ( .I(n135), .O(n27) );
  INV1S U94 ( .I(n80), .O(n41) );
  ND3 U95 ( .I1(KEY[3]), .I2(KEY[0]), .I3(n125), .O(n119) );
  NR2 U96 ( .I1(KEY[2]), .I2(KEY[1]), .O(n125) );
  ND3 U97 ( .I1(KEY[3]), .I2(KEY[2]), .I3(n118), .O(n53) );
  AOI13HS U98 ( .B1(n33), .B2(n36), .B3(n11), .A1(n96), .O(n90) );
  ND3 U99 ( .I1(n9), .I2(n39), .I3(n140), .O(n129) );
  ND3 U100 ( .I1(n10), .I2(n39), .I3(n126), .O(n103) );
  ND3 U101 ( .I1(n9), .I2(n25), .I3(n96), .O(n127) );
  ND3 U102 ( .I1(n95), .I2(n37), .I3(n10), .O(n115) );
  ND3 U103 ( .I1(n127), .I2(n129), .I3(n139), .O(n112) );
  ND3 U104 ( .I1(n9), .I2(n25), .I3(n134), .O(n139) );
  INV1S U105 ( .I(n81), .O(n38) );
  INV1S U106 ( .I(n117), .O(n29) );
  OA12 U107 ( .B1(n93), .B2(n11), .A1(n37), .O(n73) );
  OA12 U108 ( .B1(n11), .B2(n36), .A1(n35), .O(n92) );
  AOI13HS U109 ( .B1(n152), .B2(n82), .B3(F_IO_A_IN[7]), .A1(n134), .O(n151)
         );
  OAI112HS U110 ( .C1(n167), .C2(n155), .A1(n25), .B1(n168), .O(n166) );
  OA12 U111 ( .B1(counter[2]), .B2(n158), .A1(n157), .O(n167) );
  MOAI1S U112 ( .A1(n155), .A2(n156), .B1(F_IO_A_IN[6]), .B2(n152), .O(n153)
         );
  OA22 U113 ( .A1(n161), .A2(n35), .B1(n50), .B2(n34), .O(n159) );
  AOI22S U114 ( .A1(n12), .A2(n162), .B1(F_IO_A_IN[5]), .B2(n152), .O(n161) );
  ND3 U115 ( .I1(n163), .I2(n42), .I3(n164), .O(n162) );
  INV1S U116 ( .I(state[2]), .O(n39) );
  MOAI1S U117 ( .A1(n179), .A2(n180), .B1(page[0]), .B2(n178), .O(
        F_IO_A_OUT[0]) );
  BUF1CK U118 ( .I(state[0]), .O(n11) );
  INV1S U119 ( .I(counter[1]), .O(n42) );
  NR2 U120 ( .I1(WTMK_ACTIVE), .I2(n11), .O(n152) );
  NR2 U121 ( .I1(n93), .I2(state[3]), .O(n134) );
  AOI13HS U122 ( .B1(n42), .B2(n44), .B3(counter[0]), .A1(n148), .O(n170) );
  INV1S U123 ( .I(counter[0]), .O(n43) );
  INV1S U124 ( .I(counter[2]), .O(n44) );
  ND3 U125 ( .I1(counter[0]), .I2(n42), .I3(counter[2]), .O(n163) );
  INV1S U126 ( .I(state[3]), .O(n36) );
  INV1S U127 ( .I(page[7]), .O(n215) );
  INV1S U128 ( .I(page[5]), .O(n50) );
  ND3 U129 ( .I1(counter[1]), .I2(n43), .I3(counter[2]), .O(n169) );
  BUF1CK U130 ( .I(state[1]), .O(n10) );
  INV1S U131 ( .I(page[3]), .O(n48) );
  INV1S U132 ( .I(page[6]), .O(n214) );
  INV1S U133 ( .I(page[4]), .O(n49) );
  INV1S U134 ( .I(page[1]), .O(n45) );
  INV1S U135 ( .I(page[2]), .O(n47) );
  BUF1CK U136 ( .I(state[4]), .O(n9) );
  INV1S U137 ( .I(F_WEN_B), .O(n40) );
  MOAI1S U138 ( .A1(n4), .A2(n13), .B1(N152), .B2(n76), .O(n188) );
  MOAI1S U139 ( .A1(n5), .A2(n13), .B1(N150), .B2(n76), .O(n190) );
  MOAI1S U140 ( .A1(n6), .A2(n13), .B1(N149), .B2(n76), .O(n191) );
  MOAI1S U141 ( .A1(n43), .A2(n13), .B1(N146), .B2(n76), .O(n193) );
  MOAI1S U142 ( .A1(n68), .A2(n72), .B1(F_CLE_A), .B2(n68), .O(n185) );
  MOAI1S U143 ( .A1(n68), .A2(n69), .B1(F_WEN_A), .B2(n68), .O(n184) );
  AOI22S U144 ( .A1(n70), .A2(n25), .B1(n71), .B2(n10), .O(n69) );
  NR2 U145 ( .I1(n9), .I2(n39), .O(n71) );
  MOAI1S U146 ( .A1(n78), .A2(n79), .B1(F_REN_A), .B2(n78), .O(n195) );
  NR2 U147 ( .I1(n65), .I2(n80), .O(n79) );
  OAI112HS U148 ( .C1(n41), .C2(F_WEN_B), .A1(n33), .B1(n81), .O(n83) );
  NR2 U149 ( .I1(state[2]), .I2(n9), .O(n81) );
  OAI22S U150 ( .A1(n56), .A2(n117), .B1(n28), .B2(n141), .O(n135) );
  INV1S U151 ( .I(F_RB_B), .O(n218) );
  AN2 U152 ( .I1(state[3]), .I2(n98), .O(n99) );
  OAI22S U153 ( .A1(n36), .A2(n54), .B1(n26), .B2(n55), .O(n182) );
  OAI112HS U154 ( .C1(n56), .C2(n52), .A1(n217), .B1(n31), .O(n55) );
  INV1S U155 ( .I(n57), .O(n31) );
  ND3 U156 ( .I1(n145), .I2(n146), .I3(n147), .O(n66) );
  NR2 U157 ( .I1(n6), .I2(n5), .O(n145) );
  AN4B1S U158 ( .I1(counter[8]), .I2(counter[7]), .I3(counter[5]), .B1(n4), 
        .O(n147) );
  MOAI1S U159 ( .A1(n216), .A2(n98), .B1(N170), .B2(n99), .O(n200) );
  INV1S U160 ( .I(page[8]), .O(n216) );
  MOAI1S U161 ( .A1(n46), .A2(n98), .B1(N162), .B2(n99), .O(n207) );
  INV1S U162 ( .I(page[0]), .O(n46) );
  MOAI1S U163 ( .A1(n8), .A2(n91), .B1(F_CLE_B), .B2(n8), .O(n198) );
  MOAI1S U164 ( .A1(n8), .A2(n88), .B1(F_ALE_B), .B2(n8), .O(n197) );
  ND3 U165 ( .I1(n39), .I2(n36), .I3(n10), .O(n89) );
  MOAI1S U166 ( .A1(n84), .A2(n85), .B1(n84), .B2(F_WEN_B), .O(n196) );
  AOI22S U167 ( .A1(n60), .A2(n218), .B1(n86), .B2(n25), .O(n85) );
  NR2 U168 ( .I1(n87), .I2(n81), .O(n84) );
  OR2 U169 ( .I1(n70), .I2(n80), .O(n86) );
  MOAI1S U170 ( .A1(n63), .A2(n64), .B1(F_IO_A_READING), .B2(n63), .O(n183) );
  OA12 U171 ( .B1(n65), .B2(n66), .A1(n67), .O(n63) );
  OA12 U172 ( .B1(state[3]), .B2(n115), .A1(n77), .O(n67) );
  MOAI1S U173 ( .A1(n74), .A2(n94), .B1(F_ALE_A), .B2(n74), .O(n199) );
  OA12 U174 ( .B1(n95), .B2(n33), .A1(n90), .O(n94) );
  MOAI1S U175 ( .A1(rst), .A2(n51), .B1(n51), .B2(WTMK_ACTIVE), .O(n181) );
  OA12 U176 ( .B1(n52), .B2(n53), .A1(n217), .O(n51) );
  AN4B1S U177 ( .I1(page[8]), .I2(page[7]), .I3(n58), .B1(n59), .O(n57) );
  ND3 U190 ( .I1(page[5]), .I2(page[4]), .I3(page[6]), .O(n59) );
  AN4B1S U231 ( .I1(n60), .I2(n61), .I3(page[0]), .B1(n62), .O(n58) );
  ND3 U232 ( .I1(page[2]), .I2(page[1]), .I3(page[3]), .O(n62) );
  ND3 U233 ( .I1(n9), .I2(state[2]), .I3(n140), .O(n117) );
  NR2 U234 ( .I1(state[3]), .I2(n81), .O(n132) );
endmodule


module NFC_2_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  HA1 U1_1_7 ( .A(A[7]), .B(carry[7]), .C(carry[8]), .S(SUM[7]) );
  HA1 U1_1_6 ( .A(A[6]), .B(carry[6]), .C(carry[7]), .S(SUM[6]) );
  HA1 U1_1_5 ( .A(A[5]), .B(carry[5]), .C(carry[6]), .S(SUM[5]) );
  HA1 U1_1_4 ( .A(A[4]), .B(carry[4]), .C(carry[5]), .S(SUM[4]) );
  HA1 U1_1_3 ( .A(A[3]), .B(carry[3]), .C(carry[4]), .S(SUM[3]) );
  HA1 U1_1_2 ( .A(A[2]), .B(carry[2]), .C(carry[3]), .S(SUM[2]) );
  HA1 U1_1_1 ( .A(A[1]), .B(A[0]), .C(carry[2]), .S(SUM[1]) );
  XOR2HS U1 ( .I1(carry[8]), .I2(A[8]), .O(SUM[8]) );
  INV1S U2 ( .I(A[0]), .O(SUM[0]) );
endmodule


module NFC_2_DW01_inc_1 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  HA1 U1_1_7 ( .A(A[7]), .B(carry[7]), .C(carry[8]), .S(SUM[7]) );
  HA1 U1_1_6 ( .A(A[6]), .B(carry[6]), .C(carry[7]), .S(SUM[6]) );
  HA1 U1_1_5 ( .A(A[5]), .B(carry[5]), .C(carry[6]), .S(SUM[5]) );
  HA1 U1_1_4 ( .A(A[4]), .B(carry[4]), .C(carry[5]), .S(SUM[4]) );
  HA1 U1_1_3 ( .A(A[3]), .B(carry[3]), .C(carry[4]), .S(SUM[3]) );
  HA1 U1_1_2 ( .A(A[2]), .B(carry[2]), .C(carry[3]), .S(SUM[2]) );
  HA1 U1_1_1 ( .A(A[1]), .B(A[0]), .C(carry[2]), .S(SUM[1]) );
  XOR2HS U1 ( .I1(carry[8]), .I2(A[8]), .O(SUM[8]) );
  INV1S U2 ( .I(A[0]), .O(SUM[0]) );
endmodule


module NFC_2 ( clk, rst, done, F_IO_A_IN, F_IO_A_OUT, F_CLE_A, F_ALE_A, 
        F_REN_A, F_WEN_A, F_RB_A, F_IO_B_OUT, F_CLE_B, F_ALE_B, F_REN_B, 
        F_WEN_B, F_RB_B, F_IO_A_READING, F_IO_B_READING, KEY );
  input [7:0] F_IO_A_IN;
  output [7:0] F_IO_A_OUT;
  output [7:0] F_IO_B_OUT;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B, F_IO_A_READING, F_IO_B_READING;
  wire   WTMK_ACTIVE, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N162, N163, N164, N165, N166, N167, N168, N169, N170, n2, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387;
  wire   [4:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;

  ND2 U178 ( .I1(n379), .I2(n217), .O(n380) );
  ND2 U179 ( .I1(n36), .I2(n37), .O(n370) );
  AN2 U180 ( .I1(n36), .I2(n361), .O(n362) );
  OA13S U181 ( .B1(n38), .B2(n10), .B3(n368), .A1(n360), .O(n366) );
  AO22 U182 ( .A1(counter[8]), .A2(n359), .B1(N154), .B2(n358), .O(n248) );
  AO22 U183 ( .A1(counter[7]), .A2(n359), .B1(N153), .B2(n358), .O(n247) );
  AO22 U184 ( .A1(counter[5]), .A2(n359), .B1(N151), .B2(n358), .O(n245) );
  OA13S U185 ( .B1(n40), .B2(n41), .B3(n369), .A1(n357), .O(n359) );
  AN2 U186 ( .I1(n360), .I2(n351), .O(n356) );
  ND2 U187 ( .I1(n352), .I2(n39), .O(n364) );
  OA112 U188 ( .C1(n11), .C2(n39), .A1(n345), .B1(n344), .O(n346) );
  OA112 U189 ( .C1(n36), .C2(n218), .A1(n361), .B1(n342), .O(n343) );
  ND2 U191 ( .I1(n330), .I2(n378), .O(n332) );
  AN3B2S U192 ( .I1(n342), .B1(n325), .B2(n324), .O(n328) );
  AN2 U193 ( .I1(n381), .I2(n330), .O(n318) );
  AN2 U194 ( .I1(KEY[0]), .I2(KEY[1]), .O(n316) );
  OA222 U195 ( .A1(n219), .A2(n311), .B1(n337), .B2(n310), .C1(n331), .C2(n315), .O(n312) );
  ND2 U196 ( .I1(n10), .I2(n36), .O(n310) );
  OA222 U197 ( .A1(n329), .A2(n219), .B1(n25), .B2(n303), .C1(n302), .C2(n28), 
        .O(n304) );
  ND2 U198 ( .I1(n33), .I2(n37), .O(n303) );
  AN3B2S U199 ( .I1(n301), .B1(KEY[0]), .B2(KEY[2]), .O(n323) );
  ND2 U200 ( .I1(n338), .I2(n308), .O(n311) );
  ND2 U201 ( .I1(n326), .I2(n217), .O(n327) );
  AN2 U202 ( .I1(n9), .I2(n302), .O(n296) );
  ND2 U203 ( .I1(state[2]), .I2(n37), .O(n293) );
  OR3 U204 ( .I1(n292), .I2(n36), .I3(n291), .O(n326) );
  AN3 U205 ( .I1(n286), .I2(F_WEN_B), .I3(n354), .O(n288) );
  ND2 U206 ( .I1(F_REN_A), .I2(F_RB_A), .O(n354) );
  ND2 U207 ( .I1(n217), .I2(n285), .O(n347) );
  AO12 U208 ( .B1(n330), .B2(n378), .A1(state[3]), .O(n285) );
  ND2 U209 ( .I1(n353), .I2(n11), .O(n337) );
  OR3B2 U210 ( .I1(KEY[0]), .B1(KEY[2]), .B2(n301), .O(n378) );
  ND2 U211 ( .I1(n33), .I2(n39), .O(n341) );
  AO12 U212 ( .B1(n281), .B2(n280), .A1(F_IO_A_OUT[6]), .O(F_IO_B_OUT[6]) );
  AN2 U213 ( .I1(n277), .I2(n276), .O(n278) );
  ND2 U214 ( .I1(n280), .I2(n268), .O(n269) );
  ND2 U215 ( .I1(F_IO_A_IN[4]), .I2(n282), .O(n266) );
  AN2 U216 ( .I1(n265), .I2(n43), .O(n277) );
  ND2 U217 ( .I1(F_IO_A_IN[3]), .I2(n261), .O(n262) );
  ND2 U218 ( .I1(F_IO_A_IN[2]), .I2(n261), .O(n260) );
  ND2 U219 ( .I1(F_IO_A_IN[1]), .I2(n261), .O(n259) );
  ND2 U220 ( .I1(F_IO_A_IN[0]), .I2(n261), .O(n257) );
  AN2 U221 ( .I1(n280), .I2(n282), .O(n261) );
  ND2 U222 ( .I1(n280), .I2(n12), .O(n263) );
  ND2 U223 ( .I1(WTMK_ACTIVE), .I2(n25), .O(n279) );
  AN2 U224 ( .I1(n270), .I2(n264), .O(n258) );
  ND2 U225 ( .I1(n43), .I2(n42), .O(n276) );
  ND2 U226 ( .I1(n18), .I2(page[8]), .O(n254) );
  ND2 U227 ( .I1(n217), .I2(n382), .O(n274) );
  ND2 U228 ( .I1(n330), .I2(n36), .O(n382) );
  AN3 U229 ( .I1(n339), .I2(n10), .I3(n9), .O(n330) );
  ND2 U230 ( .I1(n10), .I2(state[2]), .O(n255) );
  NFC_2_DW01_inc_0 add_585 ( .A(page), .SUM({N170, N169, N168, N167, N166, 
        N165, N164, N163, N162}) );
  NFC_2_DW01_inc_1 add_531 ( .A(counter), .SUM({N154, N153, N152, N151, N150, 
        N149, N148, N147, N146}) );
  QDFFN \counter_reg[7]  ( .D(n247), .CK(clk), .Q(counter[7]) );
  QDFFN \counter_reg[5]  ( .D(n245), .CK(clk), .Q(counter[5]) );
  QDFFN \counter_reg[8]  ( .D(n248), .CK(clk), .Q(counter[8]) );
  DFFN \counter_reg[6]  ( .D(n246), .CK(clk), .Q(counter[6]), .QB(n387) );
  DFFN \counter_reg[4]  ( .D(n244), .CK(clk), .Q(counter[4]), .QB(n386) );
  DFFN \counter_reg[3]  ( .D(n243), .CK(clk), .Q(counter[3]), .QB(n385) );
  DFFN done_reg ( .D(n252), .CK(clk), .Q(done), .QB(n384) );
  QDFFN F_ALE_A_reg ( .D(n235), .CK(clk), .Q(F_ALE_A) );
  QDFFN F_ALE_B_reg ( .D(n237), .CK(clk), .Q(F_ALE_B) );
  QDFFN F_CLE_B_reg ( .D(n236), .CK(clk), .Q(F_CLE_B) );
  QDFFN F_WEN_A_reg ( .D(n250), .CK(clk), .Q(F_WEN_A) );
  QDFFN F_CLE_A_reg ( .D(n249), .CK(clk), .Q(F_CLE_A) );
  QDFFN F_REN_A_reg ( .D(n239), .CK(clk), .Q(F_REN_A) );
  QDFFN F_WEN_B_reg ( .D(n238), .CK(clk), .Q(F_WEN_B) );
  QDFFN F_IO_A_READING_reg ( .D(n251), .CK(clk), .Q(F_IO_A_READING) );
  QDFFN \state_reg[1]  ( .D(n222), .CK(clk), .Q(state[1]) );
  QDFFN \state_reg[4]  ( .D(n225), .CK(clk), .Q(state[4]) );
  QDFFN \page_reg[7]  ( .D(n233), .CK(clk), .Q(page[7]) );
  QDFFN WTMK_ACTIVE_reg ( .D(n253), .CK(clk), .Q(WTMK_ACTIVE) );
  QDFFN \counter_reg[1]  ( .D(n240), .CK(clk), .Q(counter[1]) );
  QDFFN \page_reg[2]  ( .D(n228), .CK(clk), .Q(page[2]) );
  QDFFN \page_reg[5]  ( .D(n231), .CK(clk), .Q(page[5]) );
  QDFFN \page_reg[1]  ( .D(n226), .CK(clk), .Q(page[1]) );
  QDFFN \page_reg[4]  ( .D(n230), .CK(clk), .Q(page[4]) );
  QDFFN \page_reg[3]  ( .D(n229), .CK(clk), .Q(page[3]) );
  QDFFN \page_reg[6]  ( .D(n232), .CK(clk), .Q(page[6]) );
  QDFFN \page_reg[8]  ( .D(n234), .CK(clk), .Q(page[8]) );
  QDFFN \page_reg[0]  ( .D(n227), .CK(clk), .Q(page[0]) );
  QDFFN \counter_reg[0]  ( .D(n241), .CK(clk), .Q(counter[0]) );
  QDFFN \counter_reg[2]  ( .D(n242), .CK(clk), .Q(counter[2]) );
  QDFFN \state_reg[3]  ( .D(n224), .CK(clk), .Q(state[3]) );
  QDFFN \state_reg[0]  ( .D(n221), .CK(clk), .Q(state[0]) );
  QDFFN \state_reg[2]  ( .D(n223), .CK(clk), .Q(state[2]) );
  TIE1 U3 ( .O(n7) );
  TIE0 U4 ( .O(n2) );
  INV1S U5 ( .I(n2), .O(F_REN_B) );
  INV1S U6 ( .I(n7), .O(F_IO_B_READING) );
  INV1S U7 ( .I(n256), .O(n23) );
  NR2 U8 ( .I1(n274), .I2(n35), .O(n280) );
  NR2 U9 ( .I1(n274), .I2(n34), .O(n256) );
  INV1S U10 ( .I(n274), .O(n18) );
  INV1S U11 ( .I(n327), .O(n16) );
  INV1S U12 ( .I(F_IO_A_OUT[4]), .O(n19) );
  INV1S U13 ( .I(F_IO_A_OUT[3]), .O(n20) );
  INV1S U14 ( .I(F_IO_A_OUT[2]), .O(n21) );
  INV1S U15 ( .I(F_IO_A_OUT[1]), .O(n22) );
  INV1S U16 ( .I(n338), .O(n34) );
  INV1S U17 ( .I(n374), .O(n32) );
  INV1S U18 ( .I(n352), .O(n35) );
  OAI12HS U19 ( .B1(n30), .B2(n32), .A1(n357), .O(n336) );
  NR2 U20 ( .I1(n37), .I2(n25), .O(n308) );
  OAI12HS U21 ( .B1(n318), .B2(n29), .A1(n378), .O(n320) );
  OAI12HS U22 ( .B1(n328), .B2(n327), .A1(n326), .O(n224) );
  MOAI1S U23 ( .A1(n329), .A2(n323), .B1(n322), .B2(n321), .O(n324) );
  OAI112HS U24 ( .C1(n220), .C2(n331), .A1(n320), .B1(n319), .O(n325) );
  OA112 U25 ( .C1(n33), .C2(n38), .A1(n337), .B1(n24), .O(n8) );
  INV1S U26 ( .I(n373), .O(n30) );
  INV1S U27 ( .I(n323), .O(n219) );
  INV1S U28 ( .I(n315), .O(n220) );
  INV1S U29 ( .I(n322), .O(n15) );
  INV1S U30 ( .I(n294), .O(n28) );
  OAI112HS U31 ( .C1(n215), .C2(n34), .A1(n18), .B1(n283), .O(F_IO_B_OUT[7])
         );
  NR2 U32 ( .I1(n275), .I2(n274), .O(F_IO_B_OUT[5]) );
  OAI112HS U33 ( .C1(n32), .C2(n274), .A1(n269), .B1(n19), .O(F_IO_B_OUT[4])
         );
  OAI112HS U34 ( .C1(n264), .C2(n263), .A1(n262), .B1(n20), .O(F_IO_B_OUT[3])
         );
  OAI112HS U35 ( .C1(n258), .C2(n263), .A1(n17), .B1(n257), .O(F_IO_B_OUT[0])
         );
  OAI112HS U36 ( .C1(n263), .C2(n265), .A1(n260), .B1(n21), .O(F_IO_B_OUT[2])
         );
  OAI112HS U37 ( .C1(n263), .C2(n271), .A1(n259), .B1(n22), .O(F_IO_B_OUT[1])
         );
  INV1S U38 ( .I(rst), .O(n217) );
  NR2 U39 ( .I1(n39), .I2(n25), .O(n339) );
  INV1S U40 ( .I(n11), .O(n25) );
  NR2 U41 ( .I1(n23), .I2(n49), .O(F_IO_A_OUT[4]) );
  NR2 U42 ( .I1(n23), .I2(n48), .O(F_IO_A_OUT[3]) );
  NR2 U43 ( .I1(n23), .I2(n47), .O(F_IO_A_OUT[2]) );
  NR2 U44 ( .I1(n23), .I2(n45), .O(F_IO_A_OUT[1]) );
  NR2 U45 ( .I1(n23), .I2(n214), .O(F_IO_A_OUT[6]) );
  NR2 U46 ( .I1(n215), .I2(n23), .O(F_IO_A_OUT[7]) );
  NR2 U47 ( .I1(n50), .I2(n23), .O(F_IO_A_OUT[5]) );
  INV1S U48 ( .I(F_IO_A_OUT[0]), .O(n17) );
  NR2 U49 ( .I1(n36), .I2(n10), .O(n352) );
  NR2 U50 ( .I1(n39), .I2(n10), .O(n338) );
  NR3 U51 ( .I1(n42), .I2(n43), .I3(n44), .O(n286) );
  NR2 U52 ( .I1(n36), .I2(n33), .O(n374) );
  INV1S U53 ( .I(n10), .O(n33) );
  INV1S U54 ( .I(n279), .O(n12) );
  OR2 U55 ( .I1(n276), .I2(n44), .O(n270) );
  INV1S U56 ( .I(n359), .O(n13) );
  NR2 U57 ( .I1(n36), .I2(n359), .O(n358) );
  NR2 U58 ( .I1(KEY[3]), .I2(KEY[1]), .O(n301) );
  MOAI1S U59 ( .A1(n44), .A2(n13), .B1(N148), .B2(n358), .O(n242) );
  MOAI1S U60 ( .A1(n42), .A2(n13), .B1(N147), .B2(n358), .O(n240) );
  AOI13HS U61 ( .B1(n284), .B2(n36), .B3(n9), .A1(rst), .O(n357) );
  ND3 U62 ( .I1(n339), .I2(n378), .I3(n10), .O(n284) );
  OA12 U63 ( .B1(n337), .B2(n10), .A1(n24), .O(n360) );
  INV1S U64 ( .I(n347), .O(n24) );
  ND3 U65 ( .I1(n30), .I2(n217), .I3(n290), .O(n291) );
  AOI13HS U66 ( .B1(n25), .B2(n37), .B3(n368), .A1(n341), .O(n292) );
  ND3 U67 ( .I1(n353), .I2(n218), .I3(n294), .O(n290) );
  NR2 U68 ( .I1(n33), .I2(n11), .O(n294) );
  INV1S U69 ( .I(n9), .O(n37) );
  AOI12HS U70 ( .B1(n308), .B2(n300), .A1(n14), .O(n329) );
  INV1S U71 ( .I(n311), .O(n14) );
  OAI22S U72 ( .A1(n25), .A2(n326), .B1(n298), .B2(n327), .O(n221) );
  NR2 U73 ( .I1(n299), .I2(n297), .O(n298) );
  OAI22S U74 ( .A1(n15), .A2(n321), .B1(n11), .B2(n296), .O(n297) );
  ND3 U75 ( .I1(KEY[2]), .I2(KEY[0]), .I3(n301), .O(n321) );
  NR2 U76 ( .I1(n218), .I2(n337), .O(n373) );
  ND3 U77 ( .I1(n353), .I2(n25), .I3(n352), .O(n369) );
  ND3 U78 ( .I1(n334), .I2(n15), .I3(n333), .O(n225) );
  OA12 U79 ( .B1(n37), .B2(n36), .A1(n329), .O(n334) );
  AN4B1S U80 ( .I1(n332), .I2(n217), .I3(n331), .B1(n29), .O(n333) );
  MOAI1S U81 ( .A1(n39), .A2(n326), .B1(n16), .B2(n314), .O(n223) );
  ND3 U82 ( .I1(n313), .I2(n27), .I3(n312), .O(n314) );
  OA22 U83 ( .A1(n307), .A2(n321), .B1(n34), .B2(n9), .O(n313) );
  MOAI1S U84 ( .A1(n33), .A2(n326), .B1(n16), .B2(n306), .O(n222) );
  OAI112HS U85 ( .C1(n321), .C2(n305), .A1(n27), .B1(n304), .O(n306) );
  MOAI1S U86 ( .A1(n215), .A2(n336), .B1(N169), .B2(n335), .O(n233) );
  MOAI1S U87 ( .A1(n214), .A2(n336), .B1(N168), .B2(n335), .O(n232) );
  MOAI1S U88 ( .A1(n50), .A2(n336), .B1(N167), .B2(n335), .O(n231) );
  MOAI1S U89 ( .A1(n49), .A2(n336), .B1(N166), .B2(n335), .O(n230) );
  MOAI1S U90 ( .A1(n48), .A2(n336), .B1(N165), .B2(n335), .O(n229) );
  MOAI1S U91 ( .A1(n47), .A2(n336), .B1(N164), .B2(n335), .O(n228) );
  MOAI1S U92 ( .A1(n45), .A2(n336), .B1(N163), .B2(n335), .O(n226) );
  INV1S U93 ( .I(n299), .O(n27) );
  INV1S U94 ( .I(n354), .O(n41) );
  ND3 U95 ( .I1(KEY[3]), .I2(KEY[0]), .I3(n309), .O(n315) );
  NR2 U96 ( .I1(KEY[2]), .I2(KEY[1]), .O(n309) );
  ND3 U97 ( .I1(KEY[3]), .I2(KEY[2]), .I3(n316), .O(n381) );
  AOI13HS U98 ( .B1(n33), .B2(n36), .B3(n11), .A1(n338), .O(n344) );
  ND3 U99 ( .I1(n9), .I2(n39), .I3(n294), .O(n305) );
  ND3 U100 ( .I1(n10), .I2(n39), .I3(n308), .O(n331) );
  ND3 U101 ( .I1(n9), .I2(n25), .I3(n338), .O(n307) );
  ND3 U102 ( .I1(n339), .I2(n37), .I3(n10), .O(n319) );
  ND3 U103 ( .I1(n307), .I2(n305), .I3(n295), .O(n322) );
  ND3 U104 ( .I1(n9), .I2(n25), .I3(n300), .O(n295) );
  INV1S U105 ( .I(n353), .O(n38) );
  INV1S U106 ( .I(n317), .O(n29) );
  OA12 U107 ( .B1(n341), .B2(n11), .A1(n37), .O(n361) );
  OA12 U108 ( .B1(n11), .B2(n36), .A1(n35), .O(n342) );
  AOI13HS U109 ( .B1(n282), .B2(n352), .B3(F_IO_A_IN[7]), .A1(n300), .O(n283)
         );
  OAI112HS U110 ( .C1(n267), .C2(n279), .A1(n25), .B1(n266), .O(n268) );
  OA12 U111 ( .B1(counter[2]), .B2(n276), .A1(n277), .O(n267) );
  MOAI1S U112 ( .A1(n279), .A2(n278), .B1(F_IO_A_IN[6]), .B2(n282), .O(n281)
         );
  OA22 U113 ( .A1(n273), .A2(n35), .B1(n50), .B2(n34), .O(n275) );
  AOI22S U114 ( .A1(n12), .A2(n272), .B1(F_IO_A_IN[5]), .B2(n282), .O(n273) );
  ND3 U115 ( .I1(n271), .I2(n42), .I3(n270), .O(n272) );
  INV1S U116 ( .I(state[2]), .O(n39) );
  MOAI1S U117 ( .A1(n255), .A2(n254), .B1(page[0]), .B2(n256), .O(
        F_IO_A_OUT[0]) );
  BUF1CK U118 ( .I(state[0]), .O(n11) );
  INV1S U119 ( .I(counter[1]), .O(n42) );
  NR2 U120 ( .I1(WTMK_ACTIVE), .I2(n11), .O(n282) );
  NR2 U121 ( .I1(n341), .I2(state[3]), .O(n300) );
  AOI13HS U122 ( .B1(n42), .B2(n44), .B3(counter[0]), .A1(n286), .O(n264) );
  INV1S U123 ( .I(counter[0]), .O(n43) );
  INV1S U124 ( .I(counter[2]), .O(n44) );
  ND3 U125 ( .I1(counter[0]), .I2(n42), .I3(counter[2]), .O(n271) );
  INV1S U126 ( .I(state[3]), .O(n36) );
  INV1S U127 ( .I(page[7]), .O(n215) );
  INV1S U128 ( .I(page[5]), .O(n50) );
  ND3 U129 ( .I1(counter[1]), .I2(n43), .I3(counter[2]), .O(n265) );
  BUF1CK U130 ( .I(state[1]), .O(n10) );
  INV1S U131 ( .I(page[3]), .O(n48) );
  INV1S U132 ( .I(page[6]), .O(n214) );
  INV1S U133 ( .I(page[4]), .O(n49) );
  INV1S U134 ( .I(page[1]), .O(n45) );
  INV1S U135 ( .I(page[2]), .O(n47) );
  BUF1CK U136 ( .I(state[4]), .O(n9) );
  INV1S U137 ( .I(F_WEN_B), .O(n40) );
  MOAI1S U138 ( .A1(n387), .A2(n13), .B1(N152), .B2(n358), .O(n246) );
  MOAI1S U139 ( .A1(n386), .A2(n13), .B1(N150), .B2(n358), .O(n244) );
  MOAI1S U140 ( .A1(n385), .A2(n13), .B1(N149), .B2(n358), .O(n243) );
  MOAI1S U141 ( .A1(n43), .A2(n13), .B1(N146), .B2(n358), .O(n241) );
  MOAI1S U142 ( .A1(n366), .A2(n362), .B1(F_CLE_A), .B2(n366), .O(n249) );
  MOAI1S U143 ( .A1(n366), .A2(n365), .B1(F_WEN_A), .B2(n366), .O(n250) );
  AOI22S U144 ( .A1(n364), .A2(n25), .B1(n363), .B2(n10), .O(n365) );
  NR2 U145 ( .I1(n9), .I2(n39), .O(n363) );
  MOAI1S U146 ( .A1(n356), .A2(n355), .B1(F_REN_A), .B2(n356), .O(n239) );
  NR2 U147 ( .I1(n369), .I2(n354), .O(n355) );
  OAI112HS U148 ( .C1(n41), .C2(F_WEN_B), .A1(n33), .B1(n353), .O(n351) );
  NR2 U149 ( .I1(state[2]), .I2(n9), .O(n353) );
  OAI22S U150 ( .A1(n378), .A2(n317), .B1(n28), .B2(n293), .O(n299) );
  INV1S U151 ( .I(F_RB_B), .O(n218) );
  AN2 U152 ( .I1(state[3]), .I2(n336), .O(n335) );
  OAI22S U153 ( .A1(n36), .A2(n380), .B1(n384), .B2(n379), .O(n252) );
  OAI112HS U154 ( .C1(n378), .C2(n382), .A1(n217), .B1(n31), .O(n379) );
  INV1S U155 ( .I(n377), .O(n31) );
  ND3 U156 ( .I1(n289), .I2(n288), .I3(n287), .O(n368) );
  NR2 U157 ( .I1(n385), .I2(n386), .O(n289) );
  AN4B1S U158 ( .I1(counter[8]), .I2(counter[7]), .I3(counter[5]), .B1(n387), 
        .O(n287) );
  MOAI1S U159 ( .A1(n216), .A2(n336), .B1(N170), .B2(n335), .O(n234) );
  INV1S U160 ( .I(page[8]), .O(n216) );
  MOAI1S U161 ( .A1(n46), .A2(n336), .B1(N162), .B2(n335), .O(n227) );
  INV1S U162 ( .I(page[0]), .O(n46) );
  MOAI1S U163 ( .A1(n8), .A2(n343), .B1(F_CLE_B), .B2(n8), .O(n236) );
  MOAI1S U164 ( .A1(n8), .A2(n346), .B1(F_ALE_B), .B2(n8), .O(n237) );
  ND3 U165 ( .I1(n39), .I2(n36), .I3(n10), .O(n345) );
  MOAI1S U166 ( .A1(n350), .A2(n349), .B1(n350), .B2(F_WEN_B), .O(n238) );
  AOI22S U167 ( .A1(n374), .A2(n218), .B1(n348), .B2(n25), .O(n349) );
  NR2 U168 ( .I1(n347), .I2(n353), .O(n350) );
  OR2 U169 ( .I1(n364), .I2(n354), .O(n348) );
  MOAI1S U170 ( .A1(n371), .A2(n370), .B1(F_IO_A_READING), .B2(n371), .O(n251)
         );
  OA12 U171 ( .B1(n369), .B2(n368), .A1(n367), .O(n371) );
  OA12 U172 ( .B1(state[3]), .B2(n319), .A1(n357), .O(n367) );
  MOAI1S U173 ( .A1(n360), .A2(n340), .B1(F_ALE_A), .B2(n360), .O(n235) );
  OA12 U174 ( .B1(n339), .B2(n33), .A1(n344), .O(n340) );
  MOAI1S U175 ( .A1(rst), .A2(n383), .B1(n383), .B2(WTMK_ACTIVE), .O(n253) );
  OA12 U176 ( .B1(n382), .B2(n381), .A1(n217), .O(n383) );
  AN4B1S U177 ( .I1(page[8]), .I2(page[7]), .I3(n376), .B1(n375), .O(n377) );
  ND3 U190 ( .I1(page[5]), .I2(page[4]), .I3(page[6]), .O(n375) );
  AN4B1S U231 ( .I1(n374), .I2(n373), .I3(page[0]), .B1(n372), .O(n376) );
  ND3 U232 ( .I1(page[2]), .I2(page[1]), .I3(page[3]), .O(n372) );
  ND3 U233 ( .I1(n9), .I2(state[2]), .I3(n294), .O(n317) );
  NR2 U234 ( .I1(state[3]), .I2(n353), .O(n302) );
endmodule


module NFC_1_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  HA1 U1_1_7 ( .A(A[7]), .B(carry[7]), .C(carry[8]), .S(SUM[7]) );
  HA1 U1_1_6 ( .A(A[6]), .B(carry[6]), .C(carry[7]), .S(SUM[6]) );
  HA1 U1_1_5 ( .A(A[5]), .B(carry[5]), .C(carry[6]), .S(SUM[5]) );
  HA1 U1_1_4 ( .A(A[4]), .B(carry[4]), .C(carry[5]), .S(SUM[4]) );
  HA1 U1_1_3 ( .A(A[3]), .B(carry[3]), .C(carry[4]), .S(SUM[3]) );
  HA1 U1_1_2 ( .A(A[2]), .B(carry[2]), .C(carry[3]), .S(SUM[2]) );
  HA1 U1_1_1 ( .A(A[1]), .B(A[0]), .C(carry[2]), .S(SUM[1]) );
  XOR2HS U1 ( .I1(carry[8]), .I2(A[8]), .O(SUM[8]) );
  INV1S U2 ( .I(A[0]), .O(SUM[0]) );
endmodule


module NFC_1_DW01_inc_1 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  HA1 U1_1_7 ( .A(A[7]), .B(carry[7]), .C(carry[8]), .S(SUM[7]) );
  HA1 U1_1_6 ( .A(A[6]), .B(carry[6]), .C(carry[7]), .S(SUM[6]) );
  HA1 U1_1_5 ( .A(A[5]), .B(carry[5]), .C(carry[6]), .S(SUM[5]) );
  HA1 U1_1_4 ( .A(A[4]), .B(carry[4]), .C(carry[5]), .S(SUM[4]) );
  HA1 U1_1_3 ( .A(A[3]), .B(carry[3]), .C(carry[4]), .S(SUM[3]) );
  HA1 U1_1_2 ( .A(A[2]), .B(carry[2]), .C(carry[3]), .S(SUM[2]) );
  HA1 U1_1_1 ( .A(A[1]), .B(A[0]), .C(carry[2]), .S(SUM[1]) );
  XOR2HS U1 ( .I1(carry[8]), .I2(A[8]), .O(SUM[8]) );
  INV1S U2 ( .I(A[0]), .O(SUM[0]) );
endmodule


module NFC_1 ( clk, rst, done, F_IO_A_IN, F_IO_A_OUT, F_CLE_A, F_ALE_A, 
        F_REN_A, F_WEN_A, F_RB_A, F_IO_B_OUT, F_CLE_B, F_ALE_B, F_REN_B, 
        F_WEN_B, F_RB_B, F_IO_A_READING, F_IO_B_READING, KEY );
  input [7:0] F_IO_A_IN;
  output [7:0] F_IO_A_OUT;
  output [7:0] F_IO_B_OUT;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B, F_IO_A_READING, F_IO_B_READING;
  wire   WTMK_ACTIVE, N146, N147, N148, N149, N150, N151, N152, N153, N154,
         N162, N163, N164, N165, N166, N167, N168, N169, N170, n2, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387;
  wire   [4:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;

  ND2 U178 ( .I1(n379), .I2(n217), .O(n380) );
  ND2 U179 ( .I1(n36), .I2(n37), .O(n370) );
  AN2 U180 ( .I1(n36), .I2(n361), .O(n362) );
  OA13S U181 ( .B1(n38), .B2(n10), .B3(n368), .A1(n360), .O(n366) );
  AO22 U182 ( .A1(counter[8]), .A2(n359), .B1(N154), .B2(n358), .O(n248) );
  AO22 U183 ( .A1(counter[7]), .A2(n359), .B1(N153), .B2(n358), .O(n247) );
  AO22 U184 ( .A1(counter[5]), .A2(n359), .B1(N151), .B2(n358), .O(n245) );
  OA13S U185 ( .B1(n40), .B2(n41), .B3(n369), .A1(n357), .O(n359) );
  AN2 U186 ( .I1(n360), .I2(n351), .O(n356) );
  ND2 U187 ( .I1(n352), .I2(n39), .O(n364) );
  OA112 U188 ( .C1(n11), .C2(n39), .A1(n345), .B1(n344), .O(n346) );
  OA112 U189 ( .C1(n36), .C2(n218), .A1(n361), .B1(n342), .O(n343) );
  ND2 U191 ( .I1(n330), .I2(n378), .O(n332) );
  AN3B2S U192 ( .I1(n342), .B1(n325), .B2(n324), .O(n328) );
  AN2 U193 ( .I1(n381), .I2(n330), .O(n318) );
  AN2 U194 ( .I1(KEY[0]), .I2(KEY[1]), .O(n316) );
  OA222 U195 ( .A1(n219), .A2(n311), .B1(n337), .B2(n310), .C1(n331), .C2(n315), .O(n312) );
  ND2 U196 ( .I1(n10), .I2(n36), .O(n310) );
  OA222 U197 ( .A1(n329), .A2(n219), .B1(n25), .B2(n303), .C1(n302), .C2(n28), 
        .O(n304) );
  ND2 U198 ( .I1(n33), .I2(n37), .O(n303) );
  AN3B2S U199 ( .I1(n301), .B1(KEY[0]), .B2(KEY[2]), .O(n323) );
  ND2 U200 ( .I1(n338), .I2(n308), .O(n311) );
  ND2 U201 ( .I1(n326), .I2(n217), .O(n327) );
  AN2 U202 ( .I1(n9), .I2(n302), .O(n296) );
  ND2 U203 ( .I1(state[2]), .I2(n37), .O(n293) );
  OR3 U204 ( .I1(n292), .I2(n36), .I3(n291), .O(n326) );
  AN3 U205 ( .I1(n286), .I2(F_WEN_B), .I3(n354), .O(n288) );
  ND2 U206 ( .I1(F_REN_A), .I2(F_RB_A), .O(n354) );
  ND2 U207 ( .I1(n217), .I2(n285), .O(n347) );
  AO12 U208 ( .B1(n330), .B2(n378), .A1(state[3]), .O(n285) );
  ND2 U209 ( .I1(n353), .I2(n11), .O(n337) );
  OR3B2 U210 ( .I1(KEY[0]), .B1(KEY[2]), .B2(n301), .O(n378) );
  ND2 U211 ( .I1(n33), .I2(n39), .O(n341) );
  AO12 U212 ( .B1(n281), .B2(n280), .A1(F_IO_A_OUT[6]), .O(F_IO_B_OUT[6]) );
  AN2 U213 ( .I1(n277), .I2(n276), .O(n278) );
  ND2 U214 ( .I1(n280), .I2(n268), .O(n269) );
  ND2 U215 ( .I1(F_IO_A_IN[4]), .I2(n282), .O(n266) );
  AN2 U216 ( .I1(n265), .I2(n43), .O(n277) );
  ND2 U217 ( .I1(F_IO_A_IN[3]), .I2(n261), .O(n262) );
  ND2 U218 ( .I1(F_IO_A_IN[2]), .I2(n261), .O(n260) );
  ND2 U219 ( .I1(F_IO_A_IN[1]), .I2(n261), .O(n259) );
  ND2 U220 ( .I1(F_IO_A_IN[0]), .I2(n261), .O(n257) );
  AN2 U221 ( .I1(n280), .I2(n282), .O(n261) );
  ND2 U222 ( .I1(n280), .I2(n12), .O(n263) );
  ND2 U223 ( .I1(WTMK_ACTIVE), .I2(n25), .O(n279) );
  AN2 U224 ( .I1(n270), .I2(n264), .O(n258) );
  ND2 U225 ( .I1(n43), .I2(n42), .O(n276) );
  ND2 U226 ( .I1(n18), .I2(page[8]), .O(n254) );
  ND2 U227 ( .I1(n217), .I2(n382), .O(n274) );
  ND2 U228 ( .I1(n330), .I2(n36), .O(n382) );
  AN3 U229 ( .I1(n339), .I2(n10), .I3(n9), .O(n330) );
  ND2 U230 ( .I1(n10), .I2(state[2]), .O(n255) );
  NFC_1_DW01_inc_0 add_585 ( .A(page), .SUM({N170, N169, N168, N167, N166, 
        N165, N164, N163, N162}) );
  NFC_1_DW01_inc_1 add_531 ( .A(counter), .SUM({N154, N153, N152, N151, N150, 
        N149, N148, N147, N146}) );
  QDFFN \counter_reg[7]  ( .D(n247), .CK(clk), .Q(counter[7]) );
  QDFFN \counter_reg[5]  ( .D(n245), .CK(clk), .Q(counter[5]) );
  QDFFN \counter_reg[8]  ( .D(n248), .CK(clk), .Q(counter[8]) );
  DFFN \counter_reg[6]  ( .D(n246), .CK(clk), .Q(counter[6]), .QB(n387) );
  DFFN \counter_reg[4]  ( .D(n244), .CK(clk), .Q(counter[4]), .QB(n386) );
  DFFN \counter_reg[3]  ( .D(n243), .CK(clk), .Q(counter[3]), .QB(n385) );
  DFFN done_reg ( .D(n252), .CK(clk), .Q(done), .QB(n384) );
  QDFFN F_ALE_A_reg ( .D(n235), .CK(clk), .Q(F_ALE_A) );
  QDFFN F_ALE_B_reg ( .D(n237), .CK(clk), .Q(F_ALE_B) );
  QDFFN F_CLE_B_reg ( .D(n236), .CK(clk), .Q(F_CLE_B) );
  QDFFN F_WEN_A_reg ( .D(n250), .CK(clk), .Q(F_WEN_A) );
  QDFFN F_CLE_A_reg ( .D(n249), .CK(clk), .Q(F_CLE_A) );
  QDFFN F_REN_A_reg ( .D(n239), .CK(clk), .Q(F_REN_A) );
  QDFFN F_WEN_B_reg ( .D(n238), .CK(clk), .Q(F_WEN_B) );
  QDFFN F_IO_A_READING_reg ( .D(n251), .CK(clk), .Q(F_IO_A_READING) );
  QDFFN \state_reg[1]  ( .D(n222), .CK(clk), .Q(state[1]) );
  QDFFN \state_reg[4]  ( .D(n225), .CK(clk), .Q(state[4]) );
  QDFFN \page_reg[7]  ( .D(n233), .CK(clk), .Q(page[7]) );
  QDFFN WTMK_ACTIVE_reg ( .D(n253), .CK(clk), .Q(WTMK_ACTIVE) );
  QDFFN \counter_reg[1]  ( .D(n240), .CK(clk), .Q(counter[1]) );
  QDFFN \page_reg[2]  ( .D(n228), .CK(clk), .Q(page[2]) );
  QDFFN \page_reg[5]  ( .D(n231), .CK(clk), .Q(page[5]) );
  QDFFN \page_reg[1]  ( .D(n226), .CK(clk), .Q(page[1]) );
  QDFFN \page_reg[4]  ( .D(n230), .CK(clk), .Q(page[4]) );
  QDFFN \page_reg[3]  ( .D(n229), .CK(clk), .Q(page[3]) );
  QDFFN \page_reg[6]  ( .D(n232), .CK(clk), .Q(page[6]) );
  QDFFN \page_reg[8]  ( .D(n234), .CK(clk), .Q(page[8]) );
  QDFFN \page_reg[0]  ( .D(n227), .CK(clk), .Q(page[0]) );
  QDFFN \counter_reg[0]  ( .D(n241), .CK(clk), .Q(counter[0]) );
  QDFFN \counter_reg[2]  ( .D(n242), .CK(clk), .Q(counter[2]) );
  QDFFN \state_reg[3]  ( .D(n224), .CK(clk), .Q(state[3]) );
  QDFFN \state_reg[0]  ( .D(n221), .CK(clk), .Q(state[0]) );
  QDFFN \state_reg[2]  ( .D(n223), .CK(clk), .Q(state[2]) );
  TIE1 U3 ( .O(n7) );
  TIE0 U4 ( .O(n2) );
  INV1S U5 ( .I(n2), .O(F_REN_B) );
  INV1S U6 ( .I(n7), .O(F_IO_B_READING) );
  INV1S U7 ( .I(n256), .O(n23) );
  NR2 U8 ( .I1(n274), .I2(n35), .O(n280) );
  NR2 U9 ( .I1(n274), .I2(n34), .O(n256) );
  INV1S U10 ( .I(n274), .O(n18) );
  INV1S U11 ( .I(n327), .O(n16) );
  INV1S U12 ( .I(n338), .O(n34) );
  INV1S U13 ( .I(n374), .O(n32) );
  INV1S U14 ( .I(n352), .O(n35) );
  OAI12HS U15 ( .B1(n30), .B2(n32), .A1(n357), .O(n336) );
  NR2 U16 ( .I1(n37), .I2(n25), .O(n308) );
  OAI12HS U17 ( .B1(n318), .B2(n29), .A1(n378), .O(n320) );
  OAI12HS U18 ( .B1(n328), .B2(n327), .A1(n326), .O(n224) );
  MOAI1S U19 ( .A1(n329), .A2(n323), .B1(n322), .B2(n321), .O(n324) );
  OAI112HS U20 ( .C1(n220), .C2(n331), .A1(n320), .B1(n319), .O(n325) );
  OA112 U21 ( .C1(n33), .C2(n38), .A1(n337), .B1(n24), .O(n8) );
  INV1S U22 ( .I(n373), .O(n30) );
  INV1S U23 ( .I(n323), .O(n219) );
  INV1S U24 ( .I(n315), .O(n220) );
  INV1S U25 ( .I(n322), .O(n15) );
  INV1S U26 ( .I(n294), .O(n28) );
  OAI112HS U27 ( .C1(n32), .C2(n274), .A1(n269), .B1(n19), .O(F_IO_B_OUT[4])
         );
  INV1S U28 ( .I(F_IO_A_OUT[4]), .O(n19) );
  OAI112HS U29 ( .C1(n267), .C2(n279), .A1(n25), .B1(n266), .O(n268) );
  INV1S U30 ( .I(rst), .O(n217) );
  NR2 U31 ( .I1(n39), .I2(n25), .O(n339) );
  INV1S U32 ( .I(n11), .O(n25) );
  NR2 U33 ( .I1(n23), .I2(n49), .O(F_IO_A_OUT[4]) );
  NR2 U34 ( .I1(n23), .I2(n48), .O(F_IO_A_OUT[3]) );
  NR2 U35 ( .I1(n23), .I2(n47), .O(F_IO_A_OUT[2]) );
  NR2 U36 ( .I1(n23), .I2(n45), .O(F_IO_A_OUT[1]) );
  NR2 U37 ( .I1(n23), .I2(n214), .O(F_IO_A_OUT[6]) );
  NR2 U38 ( .I1(n215), .I2(n23), .O(F_IO_A_OUT[7]) );
  NR2 U39 ( .I1(n50), .I2(n23), .O(F_IO_A_OUT[5]) );
  NR2 U40 ( .I1(n36), .I2(n10), .O(n352) );
  NR2 U41 ( .I1(n39), .I2(n10), .O(n338) );
  NR3 U42 ( .I1(n42), .I2(n43), .I3(n44), .O(n286) );
  NR2 U43 ( .I1(n36), .I2(n33), .O(n374) );
  INV1S U44 ( .I(n10), .O(n33) );
  INV1S U45 ( .I(n279), .O(n12) );
  OR2 U46 ( .I1(n276), .I2(n44), .O(n270) );
  INV1S U47 ( .I(n359), .O(n13) );
  NR2 U48 ( .I1(n36), .I2(n359), .O(n358) );
  NR2 U49 ( .I1(KEY[3]), .I2(KEY[1]), .O(n301) );
  MOAI1S U50 ( .A1(n44), .A2(n13), .B1(N148), .B2(n358), .O(n242) );
  MOAI1S U51 ( .A1(n42), .A2(n13), .B1(N147), .B2(n358), .O(n240) );
  AOI13HS U52 ( .B1(n284), .B2(n36), .B3(n9), .A1(rst), .O(n357) );
  ND3 U53 ( .I1(n339), .I2(n378), .I3(n10), .O(n284) );
  OA12 U54 ( .B1(n337), .B2(n10), .A1(n24), .O(n360) );
  INV1S U55 ( .I(n347), .O(n24) );
  ND3 U56 ( .I1(n30), .I2(n217), .I3(n290), .O(n291) );
  AOI13HS U57 ( .B1(n25), .B2(n37), .B3(n368), .A1(n341), .O(n292) );
  ND3 U58 ( .I1(n353), .I2(n218), .I3(n294), .O(n290) );
  NR2 U59 ( .I1(n33), .I2(n11), .O(n294) );
  INV1S U60 ( .I(n9), .O(n37) );
  AOI12HS U61 ( .B1(n308), .B2(n300), .A1(n14), .O(n329) );
  INV1S U62 ( .I(n311), .O(n14) );
  OAI22S U63 ( .A1(n25), .A2(n326), .B1(n298), .B2(n327), .O(n221) );
  NR2 U64 ( .I1(n299), .I2(n297), .O(n298) );
  OAI22S U65 ( .A1(n15), .A2(n321), .B1(n11), .B2(n296), .O(n297) );
  ND3 U66 ( .I1(KEY[2]), .I2(KEY[0]), .I3(n301), .O(n321) );
  NR2 U67 ( .I1(n218), .I2(n337), .O(n373) );
  ND3 U68 ( .I1(n353), .I2(n25), .I3(n352), .O(n369) );
  ND3 U69 ( .I1(n334), .I2(n15), .I3(n333), .O(n225) );
  OA12 U70 ( .B1(n37), .B2(n36), .A1(n329), .O(n334) );
  AN4B1S U71 ( .I1(n332), .I2(n217), .I3(n331), .B1(n29), .O(n333) );
  MOAI1S U72 ( .A1(n39), .A2(n326), .B1(n16), .B2(n314), .O(n223) );
  ND3 U73 ( .I1(n313), .I2(n27), .I3(n312), .O(n314) );
  OA22 U74 ( .A1(n307), .A2(n321), .B1(n34), .B2(n9), .O(n313) );
  MOAI1S U75 ( .A1(n33), .A2(n326), .B1(n16), .B2(n306), .O(n222) );
  OAI112HS U76 ( .C1(n321), .C2(n305), .A1(n27), .B1(n304), .O(n306) );
  MOAI1S U77 ( .A1(n215), .A2(n336), .B1(N169), .B2(n335), .O(n233) );
  MOAI1S U78 ( .A1(n214), .A2(n336), .B1(N168), .B2(n335), .O(n232) );
  MOAI1S U79 ( .A1(n50), .A2(n336), .B1(N167), .B2(n335), .O(n231) );
  MOAI1S U80 ( .A1(n49), .A2(n336), .B1(N166), .B2(n335), .O(n230) );
  MOAI1S U81 ( .A1(n48), .A2(n336), .B1(N165), .B2(n335), .O(n229) );
  MOAI1S U82 ( .A1(n47), .A2(n336), .B1(N164), .B2(n335), .O(n228) );
  MOAI1S U83 ( .A1(n45), .A2(n336), .B1(N163), .B2(n335), .O(n226) );
  INV1S U84 ( .I(n299), .O(n27) );
  INV1S U85 ( .I(n354), .O(n41) );
  ND3 U86 ( .I1(KEY[3]), .I2(KEY[0]), .I3(n309), .O(n315) );
  NR2 U87 ( .I1(KEY[2]), .I2(KEY[1]), .O(n309) );
  ND3 U88 ( .I1(KEY[3]), .I2(KEY[2]), .I3(n316), .O(n381) );
  AOI13HS U89 ( .B1(n33), .B2(n36), .B3(n11), .A1(n338), .O(n344) );
  ND3 U90 ( .I1(n9), .I2(n39), .I3(n294), .O(n305) );
  ND3 U91 ( .I1(n10), .I2(n39), .I3(n308), .O(n331) );
  ND3 U92 ( .I1(n9), .I2(n25), .I3(n338), .O(n307) );
  ND3 U93 ( .I1(n339), .I2(n37), .I3(n10), .O(n319) );
  ND3 U94 ( .I1(n307), .I2(n305), .I3(n295), .O(n322) );
  ND3 U95 ( .I1(n9), .I2(n25), .I3(n300), .O(n295) );
  INV1S U96 ( .I(n353), .O(n38) );
  INV1S U97 ( .I(n317), .O(n29) );
  OA12 U98 ( .B1(n341), .B2(n11), .A1(n37), .O(n361) );
  OA12 U99 ( .B1(n11), .B2(n36), .A1(n35), .O(n342) );
  OAI112HS U100 ( .C1(n264), .C2(n263), .A1(n262), .B1(n20), .O(F_IO_B_OUT[3])
         );
  INV1S U101 ( .I(F_IO_A_OUT[3]), .O(n20) );
  OAI112HS U102 ( .C1(n263), .C2(n265), .A1(n260), .B1(n21), .O(F_IO_B_OUT[2])
         );
  INV1S U103 ( .I(F_IO_A_OUT[2]), .O(n21) );
  OAI112HS U104 ( .C1(n263), .C2(n271), .A1(n259), .B1(n22), .O(F_IO_B_OUT[1])
         );
  INV1S U105 ( .I(F_IO_A_OUT[1]), .O(n22) );
  OAI112HS U106 ( .C1(n258), .C2(n263), .A1(n17), .B1(n257), .O(F_IO_B_OUT[0])
         );
  INV1S U107 ( .I(F_IO_A_OUT[0]), .O(n17) );
  OAI112HS U108 ( .C1(n215), .C2(n34), .A1(n18), .B1(n283), .O(F_IO_B_OUT[7])
         );
  AOI13HS U109 ( .B1(n282), .B2(n352), .B3(F_IO_A_IN[7]), .A1(n300), .O(n283)
         );
  NR2 U110 ( .I1(n275), .I2(n274), .O(F_IO_B_OUT[5]) );
  OA22 U111 ( .A1(n273), .A2(n35), .B1(n50), .B2(n34), .O(n275) );
  AOI22S U112 ( .A1(n12), .A2(n272), .B1(F_IO_A_IN[5]), .B2(n282), .O(n273) );
  ND3 U113 ( .I1(n271), .I2(n42), .I3(n270), .O(n272) );
  MOAI1S U114 ( .A1(n279), .A2(n278), .B1(F_IO_A_IN[6]), .B2(n282), .O(n281)
         );
  MOAI1S U115 ( .A1(n255), .A2(n254), .B1(page[0]), .B2(n256), .O(
        F_IO_A_OUT[0]) );
  INV1S U116 ( .I(state[2]), .O(n39) );
  BUF1CK U117 ( .I(state[0]), .O(n11) );
  INV1S U118 ( .I(counter[1]), .O(n42) );
  NR2 U119 ( .I1(WTMK_ACTIVE), .I2(n11), .O(n282) );
  NR2 U120 ( .I1(n341), .I2(state[3]), .O(n300) );
  AOI13HS U121 ( .B1(n42), .B2(n44), .B3(counter[0]), .A1(n286), .O(n264) );
  INV1S U122 ( .I(counter[0]), .O(n43) );
  INV1S U123 ( .I(counter[2]), .O(n44) );
  ND3 U124 ( .I1(counter[0]), .I2(n42), .I3(counter[2]), .O(n271) );
  INV1S U125 ( .I(state[3]), .O(n36) );
  INV1S U126 ( .I(page[7]), .O(n215) );
  INV1S U127 ( .I(page[5]), .O(n50) );
  ND3 U128 ( .I1(counter[1]), .I2(n43), .I3(counter[2]), .O(n265) );
  BUF1CK U129 ( .I(state[1]), .O(n10) );
  INV1S U130 ( .I(page[3]), .O(n48) );
  INV1S U131 ( .I(page[6]), .O(n214) );
  INV1S U132 ( .I(page[4]), .O(n49) );
  INV1S U133 ( .I(page[1]), .O(n45) );
  INV1S U134 ( .I(page[2]), .O(n47) );
  BUF1CK U135 ( .I(state[4]), .O(n9) );
  OA12 U136 ( .B1(counter[2]), .B2(n276), .A1(n277), .O(n267) );
  INV1S U137 ( .I(F_WEN_B), .O(n40) );
  MOAI1S U138 ( .A1(n387), .A2(n13), .B1(N152), .B2(n358), .O(n246) );
  MOAI1S U139 ( .A1(n386), .A2(n13), .B1(N150), .B2(n358), .O(n244) );
  MOAI1S U140 ( .A1(n385), .A2(n13), .B1(N149), .B2(n358), .O(n243) );
  MOAI1S U141 ( .A1(n43), .A2(n13), .B1(N146), .B2(n358), .O(n241) );
  MOAI1S U142 ( .A1(n366), .A2(n362), .B1(F_CLE_A), .B2(n366), .O(n249) );
  MOAI1S U143 ( .A1(n366), .A2(n365), .B1(F_WEN_A), .B2(n366), .O(n250) );
  AOI22S U144 ( .A1(n364), .A2(n25), .B1(n363), .B2(n10), .O(n365) );
  NR2 U145 ( .I1(n9), .I2(n39), .O(n363) );
  MOAI1S U146 ( .A1(n356), .A2(n355), .B1(F_REN_A), .B2(n356), .O(n239) );
  NR2 U147 ( .I1(n369), .I2(n354), .O(n355) );
  OAI112HS U148 ( .C1(n41), .C2(F_WEN_B), .A1(n33), .B1(n353), .O(n351) );
  NR2 U149 ( .I1(state[2]), .I2(n9), .O(n353) );
  OAI22S U150 ( .A1(n378), .A2(n317), .B1(n28), .B2(n293), .O(n299) );
  INV1S U151 ( .I(F_RB_B), .O(n218) );
  AN2 U152 ( .I1(state[3]), .I2(n336), .O(n335) );
  OAI22S U153 ( .A1(n36), .A2(n380), .B1(n384), .B2(n379), .O(n252) );
  OAI112HS U154 ( .C1(n378), .C2(n382), .A1(n217), .B1(n31), .O(n379) );
  INV1S U155 ( .I(n377), .O(n31) );
  ND3 U156 ( .I1(n289), .I2(n288), .I3(n287), .O(n368) );
  NR2 U157 ( .I1(n385), .I2(n386), .O(n289) );
  AN4B1S U158 ( .I1(counter[8]), .I2(counter[7]), .I3(counter[5]), .B1(n387), 
        .O(n287) );
  MOAI1S U159 ( .A1(n216), .A2(n336), .B1(N170), .B2(n335), .O(n234) );
  INV1S U160 ( .I(page[8]), .O(n216) );
  MOAI1S U161 ( .A1(n46), .A2(n336), .B1(N162), .B2(n335), .O(n227) );
  INV1S U162 ( .I(page[0]), .O(n46) );
  MOAI1S U163 ( .A1(n8), .A2(n343), .B1(F_CLE_B), .B2(n8), .O(n236) );
  MOAI1S U164 ( .A1(n8), .A2(n346), .B1(F_ALE_B), .B2(n8), .O(n237) );
  ND3 U165 ( .I1(n39), .I2(n36), .I3(n10), .O(n345) );
  MOAI1S U166 ( .A1(n350), .A2(n349), .B1(n350), .B2(F_WEN_B), .O(n238) );
  AOI22S U167 ( .A1(n374), .A2(n218), .B1(n348), .B2(n25), .O(n349) );
  NR2 U168 ( .I1(n347), .I2(n353), .O(n350) );
  OR2 U169 ( .I1(n364), .I2(n354), .O(n348) );
  MOAI1S U170 ( .A1(n371), .A2(n370), .B1(F_IO_A_READING), .B2(n371), .O(n251)
         );
  OA12 U171 ( .B1(n369), .B2(n368), .A1(n367), .O(n371) );
  OA12 U172 ( .B1(state[3]), .B2(n319), .A1(n357), .O(n367) );
  MOAI1S U173 ( .A1(n360), .A2(n340), .B1(F_ALE_A), .B2(n360), .O(n235) );
  OA12 U174 ( .B1(n339), .B2(n33), .A1(n344), .O(n340) );
  MOAI1S U175 ( .A1(rst), .A2(n383), .B1(n383), .B2(WTMK_ACTIVE), .O(n253) );
  OA12 U176 ( .B1(n382), .B2(n381), .A1(n217), .O(n383) );
  AN4B1S U177 ( .I1(page[8]), .I2(page[7]), .I3(n376), .B1(n375), .O(n377) );
  ND3 U190 ( .I1(page[5]), .I2(page[4]), .I3(page[6]), .O(n375) );
  AN4B1S U231 ( .I1(n374), .I2(n373), .I3(page[0]), .B1(n372), .O(n376) );
  ND3 U232 ( .I1(page[2]), .I2(page[1]), .I3(page[3]), .O(n372) );
  ND3 U233 ( .I1(n9), .I2(state[2]), .I3(n294), .O(n317) );
  NR2 U234 ( .I1(state[3]), .I2(n353), .O(n302) );
endmodule


module TMR_1bit_0 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;


  MAO222T U1 ( .A1(dataA_in), .B1(dataC_in), .C1(dataB_in), .O(data_out) );
endmodule


module TMR_8bit_0 ( data_out, dataA_in, dataB_in, dataC_in );
  output [7:0] data_out;
  input [7:0] dataA_in;
  input [7:0] dataB_in;
  input [7:0] dataC_in;


  MAO222 U1 ( .A1(dataA_in[7]), .B1(dataC_in[7]), .C1(dataB_in[7]), .O(
        data_out[7]) );
  MAO222 U2 ( .A1(dataA_in[6]), .B1(dataC_in[6]), .C1(dataB_in[6]), .O(
        data_out[6]) );
  MAO222 U3 ( .A1(dataA_in[5]), .B1(dataC_in[5]), .C1(dataB_in[5]), .O(
        data_out[5]) );
  MAO222 U4 ( .A1(dataA_in[4]), .B1(dataC_in[4]), .C1(dataB_in[4]), .O(
        data_out[4]) );
  MAO222 U5 ( .A1(dataA_in[3]), .B1(dataC_in[3]), .C1(dataB_in[3]), .O(
        data_out[3]) );
  MAO222 U6 ( .A1(dataA_in[2]), .B1(dataC_in[2]), .C1(dataB_in[2]), .O(
        data_out[2]) );
  MAO222 U7 ( .A1(dataA_in[1]), .B1(dataC_in[1]), .C1(dataB_in[1]), .O(
        data_out[1]) );
  MAO222 U8 ( .A1(dataA_in[0]), .B1(dataC_in[0]), .C1(dataB_in[0]), .O(
        data_out[0]) );
endmodule


module TMR_1bit_10 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;


  MAO222T U1 ( .A1(dataA_in), .B1(dataC_in), .C1(dataB_in), .O(data_out) );
endmodule


module TMR_1bit_9 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;


  MAO222T U1 ( .A1(dataA_in), .B1(dataC_in), .C1(dataB_in), .O(data_out) );
endmodule


module TMR_1bit_8 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;


  MAO222T U1 ( .A1(dataA_in), .B1(dataC_in), .C1(dataB_in), .O(data_out) );
endmodule


module TMR_1bit_7 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;


  MAO222T U1 ( .A1(dataA_in), .B1(dataC_in), .C1(dataB_in), .O(data_out) );
endmodule


module TMR_8bit_1 ( data_out, dataA_in, dataB_in, dataC_in );
  output [7:0] data_out;
  input [7:0] dataA_in;
  input [7:0] dataB_in;
  input [7:0] dataC_in;


  MAO222 U1 ( .A1(dataA_in[7]), .B1(dataC_in[7]), .C1(dataB_in[7]), .O(
        data_out[7]) );
  MAO222 U2 ( .A1(dataA_in[6]), .B1(dataC_in[6]), .C1(dataB_in[6]), .O(
        data_out[6]) );
  MAO222 U3 ( .A1(dataA_in[5]), .B1(dataC_in[5]), .C1(dataB_in[5]), .O(
        data_out[5]) );
  MAO222 U4 ( .A1(dataA_in[4]), .B1(dataC_in[4]), .C1(dataB_in[4]), .O(
        data_out[4]) );
  MAO222 U5 ( .A1(dataA_in[3]), .B1(dataC_in[3]), .C1(dataB_in[3]), .O(
        data_out[3]) );
  MAO222 U6 ( .A1(dataA_in[2]), .B1(dataC_in[2]), .C1(dataB_in[2]), .O(
        data_out[2]) );
  MAO222 U7 ( .A1(dataA_in[1]), .B1(dataC_in[1]), .C1(dataB_in[1]), .O(
        data_out[1]) );
  MAO222 U8 ( .A1(dataA_in[0]), .B1(dataC_in[0]), .C1(dataB_in[0]), .O(
        data_out[0]) );
endmodule


module TMR_1bit_6 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;


  MAO222T U1 ( .A1(dataA_in), .B1(dataC_in), .C1(dataB_in), .O(data_out) );
endmodule


module TMR_1bit_5 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;


  MAO222T U1 ( .A1(dataA_in), .B1(dataC_in), .C1(dataB_in), .O(data_out) );
endmodule


module TMR_1bit_4 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;


  MAO222T U1 ( .A1(dataA_in), .B1(dataC_in), .C1(dataB_in), .O(data_out) );
endmodule


module TMR_1bit_3 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;


  MAO222T U1 ( .A1(dataA_in), .B1(dataC_in), .C1(dataB_in), .O(data_out) );
endmodule


module TMR_1bit_2 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;


  MAO222 U1 ( .A1(dataA_in), .B1(dataC_in), .C1(dataB_in), .O(data_out) );
endmodule


module TMR_1bit_1 ( data_out, dataA_in, dataB_in, dataC_in );
  input dataA_in, dataB_in, dataC_in;
  output data_out;


  MAO222 U1 ( .A1(dataA_in), .B1(dataC_in), .C1(dataB_in), .O(data_out) );
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
         OA_F_REN_A, OA_F_WEN_A, OA_F_CLE_B, OA_F_ALE_B, OC_F_REN_B,
         OA_F_WEN_B, OA_F_IO_A_READING, OC_F_IO_B_READING, OB_done, OB_F_CLE_A,
         OB_F_ALE_A, OB_F_REN_A, OB_F_WEN_A, OB_F_CLE_B, OB_F_ALE_B,
         OB_F_WEN_B, OB_F_IO_A_READING, OC_done, OC_F_CLE_A, OC_F_ALE_A,
         OC_F_REN_A, OC_F_WEN_A, OC_F_CLE_B, OC_F_ALE_B, OC_F_WEN_B,
         OC_F_IO_A_READING, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;
  wire   [7:0] F_IO_A_OUT;
  wire   [7:0] F_IO_B_OUT;
  wire   [7:0] OA_F_IO_A_OUT;
  wire   [7:0] OA_F_IO_B_OUT;
  wire   [7:0] OB_F_IO_A_OUT;
  wire   [7:0] OB_F_IO_B_OUT;
  wire   [7:0] OC_F_IO_A_OUT;
  wire   [7:0] OC_F_IO_B_OUT;

  NFC_0 OriNFC_A ( .clk(clk), .rst(n23), .done(OA_done), .F_IO_A_IN(F_IO_A), 
        .F_IO_A_OUT(OA_F_IO_A_OUT), .F_CLE_A(OA_F_CLE_A), .F_ALE_A(OA_F_ALE_A), 
        .F_REN_A(OA_F_REN_A), .F_WEN_A(OA_F_WEN_A), .F_RB_A(F_RB_A), 
        .F_IO_B_OUT(OA_F_IO_B_OUT), .F_CLE_B(OA_F_CLE_B), .F_ALE_B(OA_F_ALE_B), 
        .F_WEN_B(OA_F_WEN_B), .F_RB_B(F_RB_B), .F_IO_A_READING(
        OA_F_IO_A_READING), .KEY({n22, n21, n20, n19}) );
  NFC_2 OriNFC_B ( .clk(clk), .rst(n23), .done(OB_done), .F_IO_A_IN(F_IO_A), 
        .F_IO_A_OUT(OB_F_IO_A_OUT), .F_CLE_A(OB_F_CLE_A), .F_ALE_A(OB_F_ALE_A), 
        .F_REN_A(OB_F_REN_A), .F_WEN_A(OB_F_WEN_A), .F_RB_A(F_RB_A), 
        .F_IO_B_OUT(OB_F_IO_B_OUT), .F_CLE_B(OB_F_CLE_B), .F_ALE_B(OB_F_ALE_B), 
        .F_WEN_B(OB_F_WEN_B), .F_RB_B(F_RB_B), .F_IO_A_READING(
        OB_F_IO_A_READING), .KEY({n22, n21, n20, n19}) );
  NFC_1 OriNFC_C ( .clk(clk), .rst(n23), .done(OC_done), .F_IO_A_IN(F_IO_A), 
        .F_IO_A_OUT(OC_F_IO_A_OUT), .F_CLE_A(OC_F_CLE_A), .F_ALE_A(OC_F_ALE_A), 
        .F_REN_A(OC_F_REN_A), .F_WEN_A(OC_F_WEN_A), .F_RB_A(F_RB_A), 
        .F_IO_B_OUT(OC_F_IO_B_OUT), .F_CLE_B(OC_F_CLE_B), .F_ALE_B(OC_F_ALE_B), 
        .F_WEN_B(OC_F_WEN_B), .F_RB_B(F_RB_B), .F_IO_A_READING(
        OC_F_IO_A_READING), .KEY({n22, n21, n20, n19}) );
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
  TMR_1bit_4 TMR_F_REN_B ( .data_out(F_REN_B), .dataA_in(OC_F_REN_B), 
        .dataB_in(OC_F_REN_B), .dataC_in(OC_F_REN_B) );
  TMR_1bit_3 TMR_F_WEN_B ( .data_out(F_WEN_B), .dataA_in(OA_F_WEN_B), 
        .dataB_in(OB_F_WEN_B), .dataC_in(OC_F_WEN_B) );
  TMR_1bit_2 TMR_F_IO_A_READING ( .data_out(F_IO_A_READING), .dataA_in(
        OA_F_IO_A_READING), .dataB_in(OB_F_IO_A_READING), .dataC_in(
        OC_F_IO_A_READING) );
  TMR_1bit_1 TMR_F_IO_B_READING ( .data_out(F_IO_B_READING), .dataA_in(
        OC_F_IO_B_READING), .dataB_in(OC_F_IO_B_READING), .dataC_in(
        OC_F_IO_B_READING) );
  INVT4 \F_IO_A_tri[7]  ( .I(n33), .E(n40), .O(F_IO_A[7]) );
  INVT4 \F_IO_A_tri[5]  ( .I(n35), .E(n40), .O(F_IO_A[5]) );
  INVT4 \F_IO_A_tri[3]  ( .I(n37), .E(n40), .O(F_IO_A[3]) );
  INVT4 \F_IO_A_tri[2]  ( .I(n38), .E(n40), .O(F_IO_A[2]) );
  INVT4 \F_IO_A_tri[1]  ( .I(n39), .E(n40), .O(F_IO_A[1]) );
  INVT4 \F_IO_A_tri[0]  ( .I(n31), .E(n40), .O(F_IO_A[0]) );
  INVT4 \F_IO_A_tri[4]  ( .I(n36), .E(n40), .O(F_IO_A[4]) );
  INVT4 \F_IO_A_tri[6]  ( .I(n34), .E(n40), .O(F_IO_A[6]) );
  INVT4 \F_IO_B_tri[7]  ( .I(n32), .E(n41), .O(F_IO_B[7]) );
  INVT4 \F_IO_B_tri[6]  ( .I(n30), .E(n41), .O(F_IO_B[6]) );
  INVT4 \F_IO_B_tri[5]  ( .I(n28), .E(n41), .O(F_IO_B[5]) );
  INVT4 \F_IO_B_tri[4]  ( .I(n29), .E(n41), .O(F_IO_B[4]) );
  INVT4 \F_IO_B_tri[3]  ( .I(n27), .E(n41), .O(F_IO_B[3]) );
  INVT4 \F_IO_B_tri[2]  ( .I(n26), .E(n41), .O(F_IO_B[2]) );
  INVT4 \F_IO_B_tri[1]  ( .I(n25), .E(n41), .O(F_IO_B[1]) );
  INVT4 \F_IO_B_tri[0]  ( .I(n24), .E(n41), .O(F_IO_B[0]) );
  INV1S U19 ( .I(F_IO_A_OUT[4]), .O(n36) );
  INV1S U20 ( .I(F_IO_A_OUT[3]), .O(n37) );
  INV1S U21 ( .I(F_IO_A_OUT[2]), .O(n38) );
  INV1S U22 ( .I(F_IO_A_OUT[1]), .O(n39) );
  INV1S U23 ( .I(F_IO_A_OUT[6]), .O(n34) );
  INV1S U24 ( .I(F_IO_B_OUT[7]), .O(n32) );
  INV1S U25 ( .I(F_IO_B_OUT[5]), .O(n28) );
  INV1S U26 ( .I(F_IO_B_OUT[6]), .O(n30) );
  INV1S U27 ( .I(F_IO_B_OUT[4]), .O(n29) );
  INV1S U28 ( .I(F_IO_B_OUT[3]), .O(n27) );
  INV1S U29 ( .I(F_IO_B_OUT[0]), .O(n24) );
  INV1S U30 ( .I(F_IO_B_OUT[2]), .O(n26) );
  INV1S U31 ( .I(F_IO_B_OUT[1]), .O(n25) );
  INV1S U32 ( .I(F_IO_A_OUT[0]), .O(n31) );
  INV1S U33 ( .I(F_IO_A_OUT[7]), .O(n33) );
  INV1S U34 ( .I(F_IO_A_OUT[5]), .O(n35) );
  BUF1CK U35 ( .I(rst), .O(n23) );
  INV1S U36 ( .I(F_IO_A_READING), .O(n40) );
  BUF1CK U37 ( .I(KEY[2]), .O(n21) );
  BUF1CK U38 ( .I(KEY[0]), .O(n19) );
  BUF1CK U39 ( .I(KEY[3]), .O(n22) );
  BUF1CK U40 ( .I(KEY[1]), .O(n20) );
  INV1S U41 ( .I(F_IO_B_READING), .O(n41) );
  TIE1 U42 ( .O(OC_F_REN_B) );
  TIE0 U43 ( .O(OC_F_IO_B_READING) );
endmodule

