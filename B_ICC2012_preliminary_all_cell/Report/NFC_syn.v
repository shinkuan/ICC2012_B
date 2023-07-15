/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sat Jul 15 14:12:40 2023
/////////////////////////////////////////////////////////////


module NFC ( clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, 
        F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B );
  inout [7:0] F_IO_A;
  inout [7:0] F_IO_B;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B;
  wire   F_IO_A_READING, n3, n101, n102, n105, n108, n109, n110, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247;
  wire   [7:0] F_IO_A_OUT;
  wire   [7:0] F_IO_B_OUT;
  wire   [3:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;

  AOI22XL U118 ( .A0(n102), .A1(F_IO_A[7]), .B0(n101), .B1(page[7]), .Y(n105)
         );
  AO21X1 U121 ( .A0(n109), .A1(F_IO_A[6]), .B0(F_IO_A_OUT[6]), .Y(
        F_IO_B_OUT[6]) );
  AO21X1 U122 ( .A0(n109), .A1(F_IO_A[5]), .B0(F_IO_A_OUT[5]), .Y(
        F_IO_B_OUT[5]) );
  OAI31XL U123 ( .A0(state[0]), .A1(state[1]), .A2(F_IO_A[4]), .B0(state[3]), 
        .Y(n108) );
  AO21X1 U125 ( .A0(n109), .A1(F_IO_A[3]), .B0(F_IO_A_OUT[3]), .Y(
        F_IO_B_OUT[3]) );
  AO21X1 U126 ( .A0(n109), .A1(F_IO_A[2]), .B0(F_IO_A_OUT[2]), .Y(
        F_IO_B_OUT[2]) );
  AO21X1 U127 ( .A0(n109), .A1(F_IO_A[1]), .B0(F_IO_A_OUT[1]), .Y(
        F_IO_B_OUT[1]) );
  AO21X1 U128 ( .A0(n109), .A1(F_IO_A[0]), .B0(F_IO_A_OUT[0]), .Y(
        F_IO_B_OUT[0]) );
  TBUFXL \F_IO_A_tri[0]  ( .A(F_IO_A_OUT[0]), .OE(n3), .Y(F_IO_A[0]) );
  TBUFXL \F_IO_A_tri[1]  ( .A(F_IO_A_OUT[1]), .OE(n3), .Y(F_IO_A[1]) );
  TBUFXL \F_IO_A_tri[2]  ( .A(F_IO_A_OUT[2]), .OE(n3), .Y(F_IO_A[2]) );
  TBUFXL \F_IO_A_tri[3]  ( .A(F_IO_A_OUT[3]), .OE(n3), .Y(F_IO_A[3]) );
  TBUFXL \F_IO_A_tri[5]  ( .A(F_IO_A_OUT[5]), .OE(n3), .Y(F_IO_A[5]) );
  TBUFXL \F_IO_A_tri[6]  ( .A(F_IO_A_OUT[6]), .OE(n3), .Y(F_IO_A[6]) );
  TBUFXL \F_IO_A_tri[4]  ( .A(F_IO_A_OUT[4]), .OE(n3), .Y(F_IO_A[4]) );
  TBUFXL \F_IO_A_tri[7]  ( .A(F_IO_A_OUT[7]), .OE(n3), .Y(F_IO_A[7]) );
  TBUFXL \F_IO_B_tri[1]  ( .A(F_IO_B_OUT[1]), .OE(1'b1), .Y(F_IO_B[1]) );
  TBUFXL \F_IO_B_tri[2]  ( .A(F_IO_B_OUT[2]), .OE(1'b1), .Y(F_IO_B[2]) );
  TBUFXL \F_IO_B_tri[3]  ( .A(F_IO_B_OUT[3]), .OE(1'b1), .Y(F_IO_B[3]) );
  TBUFXL \F_IO_B_tri[5]  ( .A(F_IO_B_OUT[5]), .OE(1'b1), .Y(F_IO_B[5]) );
  TBUFXL \F_IO_B_tri[6]  ( .A(F_IO_B_OUT[6]), .OE(1'b1), .Y(F_IO_B[6]) );
  TBUFXL \F_IO_B_tri[0]  ( .A(F_IO_B_OUT[0]), .OE(1'b1), .Y(F_IO_B[0]) );
  TBUFXL \F_IO_B_tri[7]  ( .A(F_IO_B_OUT[7]), .OE(1'b1), .Y(F_IO_B[7]) );
  TBUFXL \F_IO_B_tri[4]  ( .A(F_IO_B_OUT[4]), .OE(1'b1), .Y(F_IO_B[4]) );
  DFFX1 F_REN_A_reg ( .D(n137), .CK(clk), .Q(F_REN_A) );
  DFFX1 F_ALE_A_reg ( .D(n136), .CK(clk), .Q(F_ALE_A) );
  DFFX1 F_ALE_B_reg ( .D(n138), .CK(clk), .Q(F_ALE_B), .QN(n235) );
  DFFX1 done_reg ( .D(n110), .CK(clk), .Q(done) );
  DFFX1 \page_reg[7]  ( .D(n117), .CK(clk), .Q(page[7]), .QN(n244) );
  DFFX1 F_CLE_B_reg ( .D(n139), .CK(clk), .Q(F_CLE_B), .QN(n233) );
  DFFX1 \page_reg[0]  ( .D(n124), .CK(clk), .Q(page[0]), .QN(n241) );
  DFFX1 \page_reg[8]  ( .D(n116), .CK(clk), .Q(page[8]), .QN(n247) );
  DFFX1 F_WEN_B_reg ( .D(n140), .CK(clk), .Q(F_WEN_B), .QN(n239) );
  DFFX1 F_WEN_A_reg ( .D(n134), .CK(clk), .Q(F_WEN_A), .QN(n237) );
  DFFX1 F_IO_A_READING_reg ( .D(n141), .CK(clk), .Q(F_IO_A_READING), .QN(n3)
         );
  DFFX1 \page_reg[5]  ( .D(n119), .CK(clk), .Q(page[5]) );
  DFFX1 \page_reg[1]  ( .D(n123), .CK(clk), .Q(page[1]) );
  DFFX1 \page_reg[3]  ( .D(n121), .CK(clk), .Q(page[3]) );
  DFFX1 \page_reg[6]  ( .D(n118), .CK(clk), .Q(page[6]), .QN(n243) );
  DFFX1 \page_reg[4]  ( .D(n120), .CK(clk), .Q(page[4]) );
  DFFX1 \page_reg[2]  ( .D(n122), .CK(clk), .Q(page[2]), .QN(n242) );
  DFFX1 F_CLE_A_reg ( .D(n135), .CK(clk), .Q(F_CLE_A), .QN(n236) );
  DFFX1 \counter_reg[0]  ( .D(n133), .CK(clk), .Q(counter[0]), .QN(n238) );
  DFFX1 \state_reg[3]  ( .D(n114), .CK(clk), .Q(state[3]), .QN(n232) );
  DFFX1 \counter_reg[7]  ( .D(n126), .CK(clk), .Q(counter[7]), .QN(n240) );
  DFFX1 \counter_reg[5]  ( .D(n128), .CK(clk), .Q(counter[5]) );
  DFFX1 \counter_reg[3]  ( .D(n130), .CK(clk), .Q(counter[3]) );
  DFFX1 \state_reg[0]  ( .D(n115), .CK(clk), .Q(state[0]), .QN(n245) );
  DFFX1 \state_reg[2]  ( .D(n113), .CK(clk), .Q(state[2]), .QN(n234) );
  DFFX1 \counter_reg[2]  ( .D(n131), .CK(clk), .Q(counter[2]) );
  DFFX1 \counter_reg[6]  ( .D(n127), .CK(clk), .Q(counter[6]) );
  DFFX1 \counter_reg[4]  ( .D(n129), .CK(clk), .Q(counter[4]) );
  DFFX1 \state_reg[1]  ( .D(n112), .CK(clk), .Q(state[1]), .QN(n246) );
  DFFX1 \counter_reg[1]  ( .D(n132), .CK(clk), .Q(counter[1]) );
  DFFX1 \counter_reg[8]  ( .D(n125), .CK(clk), .Q(counter[8]) );
  INVXL U129 ( .A(1'b0), .Y(F_REN_B) );
  INVXL U131 ( .A(F_RB_B), .Y(n154) );
  INVXL U132 ( .A(n161), .Y(n102) );
  NOR2XL U133 ( .A(n234), .B(n228), .Y(n218) );
  NOR2XL U134 ( .A(rst), .B(n161), .Y(n109) );
  NOR3XL U135 ( .A(counter[8]), .B(n196), .C(n198), .Y(n200) );
  NOR2XL U136 ( .A(counter[3]), .B(n198), .Y(n187) );
  NOR2XL U137 ( .A(n242), .B(n205), .Y(n206) );
  INVXL U138 ( .A(n150), .Y(n169) );
  AND2X1 U139 ( .A(page[1]), .B(n224), .Y(F_IO_A_OUT[1]) );
  NOR2XL U140 ( .A(n160), .B(rst), .Y(n141) );
  NOR2XL U141 ( .A(state[1]), .B(n234), .Y(n101) );
  INVXL U142 ( .A(rst), .Y(n230) );
  NAND2XL U143 ( .A(n101), .B(n230), .Y(n164) );
  INVXL U144 ( .A(n164), .Y(n224) );
  AND2X1 U145 ( .A(page[3]), .B(n224), .Y(F_IO_A_OUT[3]) );
  AND2X1 U146 ( .A(page[5]), .B(n224), .Y(F_IO_A_OUT[5]) );
  NAND3XL U147 ( .A(n245), .B(n246), .C(state[3]), .Y(n161) );
  NAND2XL U148 ( .A(n234), .B(n246), .Y(n170) );
  INVXL U149 ( .A(n170), .Y(n220) );
  NAND3XL U150 ( .A(state[0]), .B(state[3]), .C(n220), .Y(n157) );
  NAND2XL U151 ( .A(n230), .B(n157), .Y(n176) );
  NOR2XL U152 ( .A(n232), .B(n176), .Y(n174) );
  NAND2XL U153 ( .A(n234), .B(n102), .Y(n150) );
  NOR2XL U154 ( .A(n150), .B(n239), .Y(n144) );
  NAND2XL U155 ( .A(F_REN_A), .B(F_RB_A), .Y(n151) );
  OAI22XL U156 ( .A0(F_REN_A), .A1(n144), .B0(n150), .B1(n151), .Y(n145) );
  NAND2XL U157 ( .A(n174), .B(n145), .Y(n137) );
  NAND3XL U158 ( .A(n234), .B(state[3]), .C(state[1]), .Y(n166) );
  NAND3BX1 U159 ( .AN(n166), .B(state[0]), .C(F_RB_B), .Y(n156) );
  NAND2XL U160 ( .A(page[1]), .B(page[0]), .Y(n205) );
  NAND2XL U161 ( .A(page[3]), .B(n206), .Y(n210) );
  NOR2BX1 U162 ( .AN(page[4]), .B(n210), .Y(n212) );
  NAND2XL U163 ( .A(page[5]), .B(n212), .Y(n216) );
  NOR2XL U164 ( .A(n216), .B(n243), .Y(n147) );
  INVXL U165 ( .A(n147), .Y(n146) );
  OAI21XL U166 ( .A0(n156), .A1(n146), .B0(n230), .Y(n149) );
  NOR2XL U167 ( .A(n156), .B(rst), .Y(n201) );
  NAND2XL U168 ( .A(n201), .B(n244), .Y(n148) );
  OAI22XL U169 ( .A0(n149), .A1(n244), .B0(n148), .B1(n146), .Y(n117) );
  NAND3XL U170 ( .A(n201), .B(page[7]), .C(n147), .Y(n231) );
  AOI32XL U171 ( .A0(n149), .A1(page[8]), .A2(n148), .B0(n231), .B1(n247), .Y(
        n116) );
  NAND2XL U172 ( .A(n169), .B(n151), .Y(n165) );
  OAI21XL U173 ( .A0(n239), .A1(n165), .B0(n230), .Y(n190) );
  NAND2XL U174 ( .A(n230), .B(n190), .Y(n198) );
  AND3X1 U175 ( .A(counter[1]), .B(counter[0]), .C(counter[2]), .Y(n185) );
  NAND2XL U176 ( .A(n185), .B(counter[3]), .Y(n189) );
  NOR2BX1 U177 ( .AN(counter[4]), .B(n189), .Y(n191) );
  NAND2XL U178 ( .A(n191), .B(counter[5]), .Y(n195) );
  NAND2BX1 U179 ( .AN(n195), .B(counter[6]), .Y(n196) );
  OR2X2 U180 ( .A(n198), .B(n196), .Y(n152) );
  OAI31XL U181 ( .A0(n196), .A1(n165), .A2(n239), .B0(n230), .Y(n197) );
  OAI22XL U182 ( .A0(counter[7]), .A1(n152), .B0(n240), .B1(n197), .Y(n126) );
  NOR2XL U183 ( .A(n166), .B(state[0]), .Y(n219) );
  NOR2XL U184 ( .A(n196), .B(n165), .Y(n153) );
  NAND4XL U185 ( .A(counter[7]), .B(F_WEN_B), .C(counter[8]), .D(n153), .Y(
        n159) );
  NAND2XL U186 ( .A(n174), .B(n159), .Y(n180) );
  AOI21XL U187 ( .A0(n154), .A1(n219), .B0(n180), .Y(n226) );
  NAND2XL U188 ( .A(n226), .B(n156), .Y(n221) );
  NAND2XL U189 ( .A(n230), .B(n221), .Y(n229) );
  OAI22XL U190 ( .A0(state[0]), .A1(state[1]), .B0(n245), .B1(n246), .Y(n155)
         );
  OAI22XL U191 ( .A0(n246), .A1(n221), .B0(n229), .B1(n155), .Y(n112) );
  NAND2XL U192 ( .A(n174), .B(n166), .Y(n172) );
  NOR2XL U193 ( .A(state[0]), .B(state[3]), .Y(n178) );
  NAND2XL U194 ( .A(n156), .B(n230), .Y(n211) );
  AOI211XL U195 ( .A0(n220), .A1(n178), .B0(n219), .C0(n211), .Y(n158) );
  OAI211XL U196 ( .A0(n172), .A1(n233), .B0(n158), .C0(n157), .Y(n139) );
  NAND3XL U197 ( .A(state[0]), .B(state[1]), .C(n232), .Y(n228) );
  AOI21XL U198 ( .A0(F_IO_A_READING), .A1(n159), .B0(n218), .Y(n160) );
  NOR2XL U199 ( .A(n164), .B(n244), .Y(F_IO_A_OUT[7]) );
  NOR2XL U200 ( .A(n164), .B(n243), .Y(F_IO_A_OUT[6]) );
  NOR2XL U201 ( .A(n164), .B(n242), .Y(F_IO_A_OUT[2]) );
  NAND2XL U202 ( .A(n224), .B(page[4]), .Y(n162) );
  INVXL U203 ( .A(n162), .Y(F_IO_A_OUT[4]) );
  OAI211XL U204 ( .A0(state[3]), .A1(n170), .B0(n105), .C0(n230), .Y(
        F_IO_B_OUT[7]) );
  OAI21XL U205 ( .A0(rst), .A1(n108), .B0(n162), .Y(F_IO_B_OUT[4]) );
  NAND4XL U206 ( .A(state[1]), .B(state[2]), .C(page[8]), .D(n230), .Y(n163)
         );
  OAI21XL U207 ( .A0(n241), .A1(n164), .B0(n163), .Y(F_IO_A_OUT[0]) );
  INVXL U208 ( .A(n178), .Y(n223) );
  OAI211XL U209 ( .A0(F_RB_B), .A1(n166), .B0(n165), .C0(n223), .Y(n167) );
  OAI21XL U210 ( .A0(n219), .A1(n167), .B0(n230), .Y(n168) );
  OAI31XL U211 ( .A0(n169), .A1(n239), .A2(n172), .B0(n168), .Y(n140) );
  NOR2XL U212 ( .A(state[0]), .B(n170), .Y(n175) );
  NOR3XL U213 ( .A(state[3]), .B(rst), .C(n175), .Y(n171) );
  OAI31XL U214 ( .A0(n245), .A1(n234), .A2(n246), .B0(n171), .Y(n173) );
  OAI21XL U215 ( .A0(n172), .A1(n235), .B0(n173), .Y(n138) );
  OAI2BB1XL U216 ( .A0N(n174), .A1N(F_ALE_A), .B0(n173), .Y(n136) );
  OAI21XL U217 ( .A0(n176), .A1(n175), .B0(n180), .Y(n177) );
  OAI21XL U218 ( .A0(n180), .A1(n236), .B0(n177), .Y(n135) );
  OAI21XL U219 ( .A0(n218), .A1(n178), .B0(n230), .Y(n179) );
  OAI21XL U220 ( .A0(n180), .A1(n237), .B0(n179), .Y(n134) );
  OAI22XL U221 ( .A0(counter[0]), .A1(n198), .B0(n238), .B1(n190), .Y(n133) );
  OAI21XL U222 ( .A0(counter[0]), .A1(rst), .B0(n190), .Y(n181) );
  NOR2XL U223 ( .A(counter[1]), .B(n198), .Y(n182) );
  AO22X1 U224 ( .A0(counter[1]), .A1(n181), .B0(counter[0]), .B1(n182), .Y(
        n132) );
  NAND2XL U225 ( .A(counter[1]), .B(counter[0]), .Y(n184) );
  OAI21XL U226 ( .A0(n182), .A1(n181), .B0(counter[2]), .Y(n183) );
  OAI31XL U227 ( .A0(counter[2]), .A1(n184), .A2(n198), .B0(n183), .Y(n131) );
  OAI21XL U228 ( .A0(n185), .A1(rst), .B0(n190), .Y(n186) );
  AO22X1 U229 ( .A0(n185), .A1(n187), .B0(counter[3]), .B1(n186), .Y(n130) );
  OAI21XL U230 ( .A0(n187), .A1(n186), .B0(counter[4]), .Y(n188) );
  OAI31XL U231 ( .A0(counter[4]), .A1(n189), .A2(n198), .B0(n188), .Y(n129) );
  NOR2XL U232 ( .A(counter[5]), .B(n198), .Y(n193) );
  OAI21XL U233 ( .A0(n191), .A1(rst), .B0(n190), .Y(n192) );
  AO22X1 U234 ( .A0(n191), .A1(n193), .B0(counter[5]), .B1(n192), .Y(n128) );
  OAI21XL U235 ( .A0(n193), .A1(n192), .B0(counter[6]), .Y(n194) );
  OAI31XL U236 ( .A0(counter[6]), .A1(n195), .A2(n198), .B0(n194), .Y(n127) );
  OAI21XL U237 ( .A0(counter[7]), .A1(n198), .B0(n197), .Y(n199) );
  AO22X1 U238 ( .A0(counter[7]), .A1(n200), .B0(counter[8]), .B1(n199), .Y(
        n125) );
  INVXL U239 ( .A(n201), .Y(n217) );
  OAI22XL U240 ( .A0(page[0]), .A1(n217), .B0(n241), .B1(n211), .Y(n124) );
  OAI21XL U241 ( .A0(page[0]), .A1(n217), .B0(n211), .Y(n202) );
  NOR2XL U242 ( .A(page[1]), .B(n217), .Y(n203) );
  AO22X1 U243 ( .A0(page[1]), .A1(n202), .B0(n203), .B1(page[0]), .Y(n123) );
  OAI21XL U244 ( .A0(n203), .A1(n202), .B0(page[2]), .Y(n204) );
  OAI31XL U245 ( .A0(page[2]), .A1(n217), .A2(n205), .B0(n204), .Y(n122) );
  OAI21XL U246 ( .A0(n206), .A1(n217), .B0(n211), .Y(n207) );
  NOR2XL U247 ( .A(page[3]), .B(n217), .Y(n208) );
  AO22X1 U248 ( .A0(page[3]), .A1(n207), .B0(n208), .B1(n206), .Y(n121) );
  OAI21XL U249 ( .A0(n208), .A1(n207), .B0(page[4]), .Y(n209) );
  OAI31XL U250 ( .A0(page[4]), .A1(n217), .A2(n210), .B0(n209), .Y(n120) );
  OAI21XL U251 ( .A0(n212), .A1(n217), .B0(n211), .Y(n213) );
  NOR2XL U252 ( .A(page[5]), .B(n217), .Y(n214) );
  AO22X1 U253 ( .A0(page[5]), .A1(n213), .B0(n214), .B1(n212), .Y(n119) );
  OAI21XL U254 ( .A0(n214), .A1(n213), .B0(page[6]), .Y(n215) );
  OAI31XL U255 ( .A0(page[6]), .A1(n217), .A2(n216), .B0(n215), .Y(n118) );
  OAI22XL U256 ( .A0(state[0]), .A1(n229), .B0(n245), .B1(n221), .Y(n115) );
  AOI211XL U257 ( .A0(state[3]), .A1(n220), .B0(n219), .C0(n218), .Y(n222) );
  OAI21XL U258 ( .A0(rst), .A1(n222), .B0(n221), .Y(n114) );
  NOR2XL U259 ( .A(rst), .B(n223), .Y(n225) );
  AOI221XL U260 ( .A0(n226), .A1(state[2]), .B0(n225), .B1(state[2]), .C0(n224), .Y(n227) );
  OAI31XL U261 ( .A0(state[2]), .A1(n229), .A2(n228), .B0(n227), .Y(n113) );
  OAI2BB2XL U263 ( .B0(n231), .B1(n247), .A0N(done), .A1N(n230), .Y(n110) );
endmodule

