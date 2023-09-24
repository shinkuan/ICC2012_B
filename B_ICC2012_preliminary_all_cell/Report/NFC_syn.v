/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Thu Sep  7 01:04:46 2023
/////////////////////////////////////////////////////////////


module NFC_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
endmodule


module NFC_DW01_inc_1 ( A, SUM );
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


module NFC ( clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, 
        F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B, KEY );
  inout [7:0] F_IO_A;
  inout [7:0] F_IO_B;
  input [3:0] KEY;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B;
  wire   N164, N165, N166, N167, N168, N169, N170, N171, N172, N180, N181,
         N182, N183, N184, N185, N186, N187, N188, N193, N194, N195, N196,
         N197, N198, N199, N200, N201, N203, N204, N205, N206, N207, N208,
         N209, N210, N211, N214, N215, N217, N219, N221, N223, N224, N234,
         N236, N237, N238, N239, N240, N241, N242, N244, N246, N247, N248,
         N249, N250, N251, N252, n2, n3, n5, n7, n8, n9, n12, n13, n16, n18,
         n19, n20, n21, n22, n24, n25, n26, n27, n29, n31, n32, n33, n34, n35,
         n37, n38, n41, n42, n43, n45, n48, n49, n55, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n67, n68, n69, n70, n72, n74, n75, n76, n77, n78,
         n79, n80, n83, n84, n85, n86, n87, n88, n89, n90, n91, n93, n94, n95,
         n96, n97, n98, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n113, n114, n116, n117, n118, n119, n120, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189;
  wire   [4:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;
  assign F_REN_B = 1'b1;

  NFC_DW01_inc_0 add_585 ( .A(page), .SUM({N188, N187, N186, N185, N184, N183, 
        N182, N181, N180}) );
  NFC_DW01_inc_1 add_531 ( .A(counter), .SUM({N172, N171, N170, N169, N168, 
        N167, N166, N165, N164}) );
  EDFFX1 \counter_reg[4]  ( .D(N207), .E(N247), .CK(clk), .Q(counter[4]), .QN(
        n125) );
  EDFFX1 \counter_reg[8]  ( .D(N211), .E(N247), .CK(clk), .Q(counter[8]), .QN(
        n123) );
  EDFFX1 \counter_reg[3]  ( .D(N206), .E(N247), .CK(clk), .Q(counter[3]), .QN(
        n124) );
  EDFFX1 \counter_reg[6]  ( .D(N209), .E(N247), .CK(clk), .Q(counter[6]) );
  EDFFX1 \counter_reg[5]  ( .D(N208), .E(N247), .CK(clk), .Q(counter[5]) );
  EDFFX1 \counter_reg[7]  ( .D(N210), .E(N247), .CK(clk), .Q(counter[7]) );
  EDFFX1 F_WEN_B_reg ( .D(N223), .E(N252), .CK(clk), .Q(F_WEN_B), .QN(n126) );
  EDFFX1 F_REN_A_reg ( .D(N219), .E(N250), .CK(clk), .Q(F_REN_A) );
  EDFFX1 \page_reg[8]  ( .D(N201), .E(N246), .CK(clk), .Q(page[8]) );
  EDFFX1 \page_reg[1]  ( .D(N194), .E(N246), .CK(clk), .Q(page[1]) );
  EDFFX1 \page_reg[7]  ( .D(N200), .E(N246), .CK(clk), .Q(page[7]), .QN(n155)
         );
  EDFFX1 \page_reg[5]  ( .D(N198), .E(N246), .CK(clk), .Q(page[5]) );
  EDFFX1 \page_reg[4]  ( .D(N197), .E(N246), .CK(clk), .Q(page[4]) );
  EDFFX1 \page_reg[6]  ( .D(N199), .E(N246), .CK(clk), .Q(page[6]) );
  EDFFX1 \page_reg[0]  ( .D(N193), .E(N246), .CK(clk), .Q(page[0]), .QN(n153)
         );
  EDFFX1 \page_reg[2]  ( .D(N195), .E(N246), .CK(clk), .Q(page[2]) );
  EDFFX1 \page_reg[3]  ( .D(N196), .E(N246), .CK(clk), .Q(page[3]) );
  TBUFXL \F_IO_A_tri[4]  ( .A(n161), .OE(n132), .Y(F_IO_A[4]) );
  TBUFXL \F_IO_A_tri[7]  ( .A(n131), .OE(n132), .Y(F_IO_A[7]) );
  TBUFXL \F_IO_A_tri[0]  ( .A(n139), .OE(n132), .Y(F_IO_A[0]) );
  TBUFXL \F_IO_A_tri[1]  ( .A(n164), .OE(n132), .Y(F_IO_A[1]) );
  TBUFXL \F_IO_A_tri[2]  ( .A(n163), .OE(n132), .Y(F_IO_A[2]) );
  TBUFXL \F_IO_A_tri[3]  ( .A(n162), .OE(n132), .Y(F_IO_A[3]) );
  TBUFXL \F_IO_A_tri[5]  ( .A(n160), .OE(n132), .Y(F_IO_A[5]) );
  TBUFXL \F_IO_A_tri[6]  ( .A(n159), .OE(n132), .Y(F_IO_A[6]) );
  EDFFX1 \state_reg[0]  ( .D(N237), .E(N236), .CK(clk), .Q(state[0]), .QN(n151) );
  EDFFX1 \state_reg[1]  ( .D(N238), .E(N236), .CK(clk), .Q(state[1]), .QN(n152) );
  EDFFX1 \state_reg[4]  ( .D(N241), .E(N236), .CK(clk), .Q(state[4]), .QN(n154) );
  EDFFX1 WTMK_ACTIVE_reg ( .D(n170), .E(N242), .CK(clk), .QN(n130) );
  EDFFX1 \counter_reg[2]  ( .D(N205), .E(N247), .CK(clk), .Q(counter[2]), .QN(
        n129) );
  EDFFX1 \counter_reg[0]  ( .D(N203), .E(N247), .CK(clk), .Q(counter[0]), .QN(
        n127) );
  EDFFX1 \state_reg[3]  ( .D(N240), .E(N236), .CK(clk), .Q(state[3]), .QN(n149) );
  EDFFX1 \counter_reg[1]  ( .D(N204), .E(N247), .CK(clk), .Q(counter[1]), .QN(
        n128) );
  EDFFX1 F_CLE_B_reg ( .D(N221), .E(N251), .CK(clk), .Q(F_CLE_B) );
  EDFFX1 F_ALE_A_reg ( .D(N217), .E(N249), .CK(clk), .Q(F_ALE_A) );
  EDFFX1 done_reg ( .D(n168), .E(N234), .CK(clk), .Q(done) );
  EDFFX1 \state_reg[2]  ( .D(N239), .E(N236), .CK(clk), .Q(state[2]), .QN(n150) );
  TBUFXL \F_IO_B_tri[4]  ( .A(n143), .OE(1'b1), .Y(F_IO_B[4]) );
  TBUFXL \F_IO_B_tri[5]  ( .A(n142), .OE(1'b1), .Y(F_IO_B[5]) );
  TBUFXL \F_IO_B_tri[6]  ( .A(n141), .OE(1'b1), .Y(F_IO_B[6]) );
  TBUFXL \F_IO_B_tri[7]  ( .A(n140), .OE(1'b1), .Y(F_IO_B[7]) );
  TBUFXL \F_IO_B_tri[1]  ( .A(n146), .OE(1'b1), .Y(F_IO_B[1]) );
  TBUFXL \F_IO_B_tri[2]  ( .A(n145), .OE(1'b1), .Y(F_IO_B[2]) );
  TBUFXL \F_IO_B_tri[3]  ( .A(n144), .OE(1'b1), .Y(F_IO_B[3]) );
  TBUFXL \F_IO_B_tri[0]  ( .A(n147), .OE(1'b1), .Y(F_IO_B[0]) );
  EDFFX1 F_CLE_A_reg ( .D(N214), .E(N248), .CK(clk), .Q(F_CLE_A) );
  EDFFX1 F_ALE_B_reg ( .D(N224), .E(N251), .CK(clk), .Q(F_ALE_B) );
  EDFFX1 F_WEN_A_reg ( .D(N215), .E(N248), .CK(clk), .Q(F_WEN_A) );
  EDFFX1 F_IO_A_READING_reg ( .D(n188), .E(N244), .CK(clk), .QN(n132) );
  OAI31XL U186 ( .A0(n154), .A1(n158), .A2(n64), .B0(n63), .Y(n42) );
  OAI31XL U187 ( .A0(n154), .A1(rst), .A2(n12), .B0(n13), .Y(n3) );
  CLKINVX1 U188 ( .A(n120), .Y(n165) );
  CLKINVX1 U189 ( .A(n90), .Y(n183) );
  CLKINVX1 U190 ( .A(n31), .Y(n179) );
  CLKINVX1 U191 ( .A(n12), .Y(n176) );
  NAND2X1 U192 ( .A(n166), .B(n187), .Y(n120) );
  NOR2BX1 U193 ( .AN(n89), .B(n103), .Y(n119) );
  NAND2X1 U194 ( .A(n152), .B(n151), .Y(n90) );
  CLKINVX1 U195 ( .A(n35), .Y(n186) );
  CLKINVX1 U196 ( .A(n103), .Y(n166) );
  NOR3X1 U197 ( .A(n151), .B(n64), .C(n154), .Y(n31) );
  NOR2X1 U198 ( .A(n187), .B(n67), .Y(n64) );
  NAND2X1 U199 ( .A(n185), .B(n41), .Y(n12) );
  NAND2X1 U200 ( .A(n189), .B(n152), .Y(n8) );
  CLKINVX1 U201 ( .A(n2), .Y(n189) );
  CLKINVX1 U202 ( .A(N249), .Y(n169) );
  NAND2X1 U203 ( .A(n89), .B(n189), .Y(n16) );
  CLKINVX1 U204 ( .A(n42), .Y(n181) );
  CLKINVX1 U205 ( .A(n59), .Y(n182) );
  CLKINVX1 U206 ( .A(n27), .Y(n184) );
  NAND2X1 U207 ( .A(n188), .B(n87), .Y(N214) );
  CLKINVX1 U208 ( .A(n13), .Y(n168) );
  CLKINVX1 U209 ( .A(n21), .Y(n188) );
  NAND3BX1 U210 ( .AN(n95), .B(n107), .C(counter[0]), .Y(n108) );
  NAND2X1 U211 ( .A(n157), .B(n158), .Y(n35) );
  NAND3X1 U212 ( .A(n185), .B(n149), .C(n156), .Y(n25) );
  NOR2X1 U213 ( .A(n157), .B(state[3]), .Y(n67) );
  NOR2X1 U214 ( .A(n90), .B(n149), .Y(n89) );
  NAND2X1 U215 ( .A(n170), .B(n25), .Y(n103) );
  CLKINVX1 U216 ( .A(n91), .Y(n187) );
  AO21X1 U217 ( .A0(counter[1]), .A1(counter[2]), .B0(n100), .Y(n107) );
  NOR2X1 U218 ( .A(n155), .B(n120), .Y(n131) );
  CLKINVX1 U219 ( .A(n20), .Y(n185) );
  NOR2X1 U220 ( .A(counter[1]), .B(counter[2]), .Y(n100) );
  CLKINVX1 U221 ( .A(n109), .Y(n162) );
  CLKINVX1 U222 ( .A(n113), .Y(n163) );
  CLKINVX1 U223 ( .A(n96), .Y(n159) );
  CLKINVX1 U224 ( .A(n101), .Y(n160) );
  CLKINVX1 U225 ( .A(n105), .Y(n161) );
  CLKINVX1 U226 ( .A(n116), .Y(n164) );
  CLKINVX1 U227 ( .A(n117), .Y(n167) );
  OAI21XL U228 ( .A0(n151), .A1(n8), .B0(n3), .Y(N249) );
  NAND3X1 U229 ( .A(n186), .B(n150), .C(n156), .Y(n27) );
  OAI22XL U230 ( .A0(n181), .A1(n177), .B0(n174), .B1(n32), .Y(n38) );
  CLKINVX1 U231 ( .A(n41), .Y(n174) );
  NAND2X1 U232 ( .A(n150), .B(n154), .Y(n2) );
  NAND2X1 U233 ( .A(state[3]), .B(n170), .Y(n13) );
  OAI21XL U234 ( .A0(n8), .A1(n9), .B0(n169), .Y(N248) );
  OAI21XL U235 ( .A0(n183), .A1(n2), .B0(n3), .Y(N251) );
  OAI32X1 U236 ( .A0(n59), .A1(n156), .A2(n150), .B0(n32), .B1(n41), .Y(n57)
         );
  NAND2X1 U237 ( .A(n157), .B(n151), .Y(n59) );
  OAI21XL U238 ( .A0(n24), .A1(n25), .B0(n170), .Y(N242) );
  NAND2X1 U239 ( .A(n183), .B(n150), .Y(n87) );
  NAND2X1 U240 ( .A(n18), .B(n19), .Y(N246) );
  AOI21X1 U241 ( .A0(n158), .A1(n67), .B0(n187), .Y(n84) );
  NAND2X1 U242 ( .A(n149), .B(n154), .Y(n21) );
  AO22X1 U243 ( .A0(n151), .A1(n177), .B0(n158), .B1(n45), .Y(n55) );
  NAND2X1 U244 ( .A(n13), .B(n22), .Y(n18) );
  OAI21XL U245 ( .A0(n176), .A1(n154), .B0(n170), .Y(n22) );
  NAND3X1 U246 ( .A(n156), .B(n150), .C(n182), .Y(n63) );
  OAI221XL U247 ( .A0(n9), .A1(n16), .B0(n20), .B1(n21), .C0(n18), .Y(N244) );
  NAND2X1 U248 ( .A(n2), .B(n3), .Y(N252) );
  OAI31XL U249 ( .A0(n150), .A1(n156), .A2(n152), .B0(n86), .Y(N215) );
  OAI211X1 U250 ( .A0(n158), .A1(n150), .B0(n83), .C0(n84), .Y(N224) );
  NAND3X1 U251 ( .A(n150), .B(n149), .C(n157), .Y(n83) );
  CLKINVX1 U252 ( .A(n9), .Y(n172) );
  OR2X1 U253 ( .A(n16), .B(n7), .Y(N219) );
  CLKINVX1 U254 ( .A(n7), .Y(n171) );
  AND2X2 U255 ( .A(N183), .B(state[3]), .Y(N196) );
  AND2X2 U256 ( .A(N182), .B(state[3]), .Y(N195) );
  AND2X2 U257 ( .A(N186), .B(state[3]), .Y(N199) );
  AND2X2 U258 ( .A(N184), .B(state[3]), .Y(N197) );
  AND2X2 U259 ( .A(N185), .B(state[3]), .Y(N198) );
  AND2X2 U260 ( .A(N187), .B(state[3]), .Y(N200) );
  AND2X2 U261 ( .A(N181), .B(state[3]), .Y(N194) );
  AND2X2 U262 ( .A(N171), .B(state[3]), .Y(N210) );
  AND2X2 U263 ( .A(N169), .B(state[3]), .Y(N208) );
  AND2X2 U264 ( .A(N170), .B(state[3]), .Y(N209) );
  AND2X2 U265 ( .A(N168), .B(state[3]), .Y(N207) );
  AND2X2 U266 ( .A(N167), .B(state[3]), .Y(N206) );
  AND2X2 U267 ( .A(N166), .B(state[3]), .Y(N205) );
  AND2X2 U268 ( .A(N165), .B(state[3]), .Y(N204) );
  NAND2X1 U269 ( .A(n68), .B(n178), .Y(n41) );
  CLKINVX1 U270 ( .A(n62), .Y(n177) );
  CLKINVX1 U271 ( .A(n24), .Y(n173) );
  NAND3BX1 U272 ( .AN(n139), .B(n108), .C(n118), .Y(n147) );
  AOI32X1 U273 ( .A0(n128), .A1(n127), .A2(n117), .B0(F_IO_A[0]), .B1(n98), 
        .Y(n118) );
  NAND3X1 U274 ( .A(n108), .B(n109), .C(n110), .Y(n144) );
  NAND2X1 U275 ( .A(F_IO_A[3]), .B(n98), .Y(n110) );
  AO21X1 U276 ( .A0(F_IO_A[2]), .A1(n98), .B0(n111), .Y(n145) );
  OAI31XL U277 ( .A0(n167), .A1(n128), .A2(counter[0]), .B0(n113), .Y(n111) );
  AO21X1 U278 ( .A0(F_IO_A[1]), .A1(n98), .B0(n114), .Y(n146) );
  OAI31XL U279 ( .A0(n167), .A1(n127), .A2(counter[1]), .B0(n116), .Y(n114) );
  OAI31XL U280 ( .A0(n103), .A1(n104), .A2(n149), .B0(n105), .Y(n143) );
  AOI211X1 U281 ( .A0(F_IO_A[4]), .A1(n130), .B0(n90), .C0(n106), .Y(n104) );
  AOI2BB1X1 U282 ( .A0N(n107), .A1N(counter[0]), .B0(n130), .Y(n106) );
  OAI211X1 U283 ( .A0(n94), .A1(n95), .B0(n96), .C0(n97), .Y(n141) );
  NOR3X1 U284 ( .A(counter[0]), .B(n128), .C(counter[2]), .Y(n94) );
  NAND2X1 U285 ( .A(F_IO_A[6]), .B(n98), .Y(n97) );
  OAI211X1 U286 ( .A0(n100), .A1(n95), .B0(n101), .C0(n102), .Y(n142) );
  NAND2X1 U287 ( .A(F_IO_A[5]), .B(n98), .Y(n102) );
  OAI211X1 U288 ( .A0(n91), .A1(n155), .B0(n166), .C0(n93), .Y(n140) );
  AOI32X1 U289 ( .A0(F_IO_A[7]), .A1(n89), .A2(n130), .B0(n67), .B1(n150), .Y(
        n93) );
  OAI21XL U290 ( .A0(n153), .A1(n120), .B0(n122), .Y(n139) );
  NAND4X1 U291 ( .A(n166), .B(page[8]), .C(state[2]), .D(n157), .Y(n122) );
  NAND2BX1 U292 ( .AN(n130), .B(n119), .Y(n95) );
  AND2X2 U293 ( .A(n119), .B(n130), .Y(n98) );
  NAND2X1 U294 ( .A(state[2]), .B(n186), .Y(n20) );
  NAND2X1 U295 ( .A(state[2]), .B(n152), .Y(n91) );
  NAND2X1 U296 ( .A(n165), .B(page[3]), .Y(n109) );
  NOR2X1 U297 ( .A(n95), .B(n129), .Y(n117) );
  NAND2X1 U298 ( .A(n165), .B(page[2]), .Y(n113) );
  NAND2X1 U299 ( .A(n165), .B(page[6]), .Y(n96) );
  NAND2X1 U300 ( .A(n165), .B(page[5]), .Y(n101) );
  NAND2X1 U301 ( .A(n165), .B(page[4]), .Y(n105) );
  CLKBUFX3 U302 ( .A(state[4]), .Y(n156) );
  NAND2X1 U303 ( .A(n165), .B(page[1]), .Y(n116) );
  CLKBUFX3 U304 ( .A(state[1]), .Y(n157) );
  CLKBUFX3 U305 ( .A(state[0]), .Y(n158) );
  OAI211X1 U306 ( .A0(n25), .A1(n41), .B0(n77), .C0(n170), .Y(N234) );
  NAND4X1 U307 ( .A(page[3]), .B(page[2]), .C(n78), .D(n79), .Y(n77) );
  NOR3BXL U308 ( .AN(page[8]), .B(n80), .C(n155), .Y(n79) );
  NOR3BXL U309 ( .AN(page[1]), .B(n19), .C(n153), .Y(n78) );
  NAND3X1 U310 ( .A(n156), .B(state[2]), .C(n182), .Y(n32) );
  NAND4X1 U311 ( .A(n7), .B(counter[2]), .C(n74), .D(n75), .Y(n9) );
  NOR3X1 U312 ( .A(n128), .B(n126), .C(n127), .Y(n74) );
  NOR4X1 U313 ( .A(n76), .B(n125), .C(n123), .D(n124), .Y(n75) );
  NAND3X1 U314 ( .A(counter[6]), .B(counter[5]), .C(counter[7]), .Y(n76) );
  OAI22XL U315 ( .A0(rst), .A1(n33), .B0(n34), .B1(n13), .Y(N240) );
  NOR2X1 U316 ( .A(n156), .B(n35), .Y(n34) );
  AOI211X1 U317 ( .A0(n185), .A1(n154), .B0(n37), .C0(n38), .Y(n33) );
  OAI222XL U318 ( .A0(n43), .A1(n27), .B0(n173), .B1(n12), .C0(n45), .C1(n179), 
        .Y(n37) );
  OAI22XL U319 ( .A0(n58), .A1(n59), .B0(rst), .B1(n60), .Y(N238) );
  AOI211X1 U320 ( .A0(n45), .A1(n31), .B0(n61), .C0(n57), .Y(n60) );
  OAI32X1 U321 ( .A0(n151), .A1(n156), .A2(n157), .B0(n62), .B1(n63), .Y(n61)
         );
  OAI22XL U322 ( .A0(n158), .A1(n58), .B0(rst), .B1(n65), .Y(N237) );
  AOI221XL U323 ( .A0(n177), .A1(n42), .B0(n151), .B1(n154), .C0(n57), .Y(n65)
         );
  NAND4X1 U324 ( .A(F_RB_B), .B(n189), .C(state[3]), .D(n186), .Y(n19) );
  AOI2BB1X1 U325 ( .A0N(rst), .A1N(n2), .B0(n168), .Y(n58) );
  NAND2X1 U326 ( .A(F_RB_A), .B(F_REN_A), .Y(n7) );
  OAI31XL U327 ( .A0(n16), .A1(n126), .A2(n171), .B0(n18), .Y(N247) );
  NAND4X1 U328 ( .A(n26), .B(n27), .C(n181), .D(n29), .Y(N241) );
  OAI21XL U329 ( .A0(n176), .A1(state[3]), .B0(n156), .Y(n26) );
  NOR3X1 U330 ( .A(n180), .B(rst), .C(n31), .Y(n29) );
  CLKINVX1 U331 ( .A(n32), .Y(n180) );
  NAND3X1 U332 ( .A(page[5]), .B(page[4]), .C(page[6]), .Y(n80) );
  NAND3X1 U333 ( .A(n87), .B(n154), .C(n88), .Y(N221) );
  OAI21XL U334 ( .A0(F_RB_B), .A1(n35), .B0(state[3]), .Y(n88) );
  OAI31XL U335 ( .A0(n149), .A1(state[2]), .A2(n157), .B0(n151), .Y(n86) );
  NAND2X1 U336 ( .A(n5), .B(n169), .Y(N250) );
  AO21X1 U337 ( .A0(n7), .A1(n126), .B0(n8), .Y(n5) );
  OAI211X1 U338 ( .A0(n69), .A1(n2), .B0(n70), .C0(n168), .Y(N236) );
  AOI2BB2X1 U339 ( .B0(F_RB_B), .B1(n158), .A0N(n59), .A1N(F_RB_B), .Y(n69) );
  OAI31XL U340 ( .A0(n172), .A1(n156), .A2(n158), .B0(n72), .Y(n70) );
  NOR2X1 U341 ( .A(state[2]), .B(n157), .Y(n72) );
  OAI211X1 U342 ( .A0(state[2]), .A1(n152), .B0(n59), .C0(n84), .Y(N217) );
  OAI211X1 U343 ( .A0(n158), .A1(n171), .B0(n85), .C0(n86), .Y(N223) );
  NAND3BX1 U344 ( .AN(F_RB_B), .B(n157), .C(state[3]), .Y(n85) );
  AOI31X1 U345 ( .A0(n175), .A1(n48), .A2(n49), .B0(rst), .Y(N239) );
  OAI21XL U346 ( .A0(n154), .A1(n55), .B0(n187), .Y(n48) );
  CLKINVX1 U347 ( .A(n57), .Y(n175) );
  AOI32X1 U348 ( .A0(n186), .A1(n149), .A2(n189), .B0(n43), .B1(n184), .Y(n49)
         );
  AND2X2 U349 ( .A(N188), .B(state[3]), .Y(N201) );
  AND2X2 U350 ( .A(N172), .B(state[3]), .Y(N211) );
  AND2X2 U351 ( .A(N180), .B(state[3]), .Y(N193) );
  AND2X2 U352 ( .A(N164), .B(state[3]), .Y(N203) );
  NOR3BXL U353 ( .AN(KEY[2]), .B(KEY[1]), .C(KEY[3]), .Y(n68) );
  NOR4X1 U354 ( .A(KEY[0]), .B(KEY[1]), .C(KEY[2]), .D(KEY[3]), .Y(n45) );
  NOR4BX1 U355 ( .AN(KEY[3]), .B(n178), .C(KEY[1]), .D(KEY[2]), .Y(n43) );
  NAND4X1 U356 ( .A(KEY[3]), .B(KEY[1]), .C(KEY[0]), .D(KEY[2]), .Y(n24) );
  NAND2X1 U357 ( .A(KEY[0]), .B(n68), .Y(n62) );
  CLKINVX1 U358 ( .A(rst), .Y(n170) );
  CLKINVX1 U359 ( .A(KEY[0]), .Y(n178) );
endmodule

