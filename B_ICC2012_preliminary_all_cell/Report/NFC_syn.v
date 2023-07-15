/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : P-2019.03
// Date      : Sat Jul 15 13:56:22 2023
/////////////////////////////////////////////////////////////


module NFC ( clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, 
        F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B );
  inout [7:0] F_IO_A;
  inout [7:0] F_IO_B;
  input clk, rst, F_RB_A, F_RB_B;
  output done, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B,
         F_WEN_B;
  wire   F_IO_A_READING, n3, n110, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n138, n139, n140, n319, n321,
         n350, n352, n354, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, n470, n471, n473;
  wire   [7:0] F_IO_A_OUT;
  wire   [7:0] F_IO_B_OUT;
  wire   [3:0] state;
  wire   [8:0] counter;
  wire   [8:0] page;

  DFFQX1 F_CLE_A_reg ( .D(n135), .CK(clk), .Q(F_CLE_A) );
  DFFQX1 \counter_reg[0]  ( .D(n133), .CK(clk), .Q(counter[0]) );
  DFFQX1 \counter_reg[1]  ( .D(n132), .CK(clk), .Q(counter[1]) );
  DFFQX1 \counter_reg[2]  ( .D(n131), .CK(clk), .Q(counter[2]) );
  DFFQX1 \counter_reg[3]  ( .D(n130), .CK(clk), .Q(counter[3]) );
  DFFQX1 \counter_reg[4]  ( .D(n129), .CK(clk), .Q(counter[4]) );
  DFFQX1 \counter_reg[5]  ( .D(n128), .CK(clk), .Q(counter[5]) );
  DFFQX1 \counter_reg[6]  ( .D(n127), .CK(clk), .Q(counter[6]) );
  DFFQX1 \counter_reg[7]  ( .D(n126), .CK(clk), .Q(counter[7]) );
  DFFQX1 \counter_reg[8]  ( .D(n125), .CK(clk), .Q(counter[8]) );
  DFFQX1 F_ALE_B_reg ( .D(n138), .CK(clk), .Q(F_ALE_B) );
  DFFQX1 F_CLE_B_reg ( .D(n139), .CK(clk), .Q(F_CLE_B) );
  DFFQX1 \page_reg[8]  ( .D(n116), .CK(clk), .Q(page[8]) );
  DFFQX1 \page_reg[6]  ( .D(n118), .CK(clk), .Q(page[6]) );
  DFFQX1 \page_reg[5]  ( .D(n119), .CK(clk), .Q(page[5]) );
  DFFQX1 \page_reg[4]  ( .D(n120), .CK(clk), .Q(page[4]) );
  DFFQX1 \page_reg[3]  ( .D(n121), .CK(clk), .Q(page[3]) );
  DFFQX1 \page_reg[2]  ( .D(n122), .CK(clk), .Q(page[2]) );
  DFFQX1 \page_reg[1]  ( .D(n123), .CK(clk), .Q(page[1]) );
  DFFQX1 \page_reg[0]  ( .D(n124), .CK(clk), .Q(page[0]) );
  TBUFXL \F_IO_B_tri[1]  ( .A(F_IO_B_OUT[1]), .OE(1'b1), .Y(F_IO_B[1]) );
  TBUFXL \F_IO_B_tri[2]  ( .A(F_IO_B_OUT[2]), .OE(1'b1), .Y(F_IO_B[2]) );
  TBUFXL \F_IO_B_tri[3]  ( .A(F_IO_B_OUT[3]), .OE(1'b1), .Y(F_IO_B[3]) );
  TBUFXL \F_IO_B_tri[5]  ( .A(F_IO_B_OUT[5]), .OE(1'b1), .Y(F_IO_B[5]) );
  TBUFXL \F_IO_B_tri[6]  ( .A(F_IO_B_OUT[6]), .OE(1'b1), .Y(F_IO_B[6]) );
  TBUFXL \F_IO_B_tri[0]  ( .A(F_IO_B_OUT[0]), .OE(1'b1), .Y(F_IO_B[0]) );
  TBUFXL \F_IO_B_tri[4]  ( .A(F_IO_B_OUT[4]), .OE(1'b1), .Y(F_IO_B[4]) );
  TBUFXL \F_IO_B_tri[7]  ( .A(F_IO_B_OUT[7]), .OE(1'b1), .Y(F_IO_B[7]) );
  TBUFXL \F_IO_A_tri[0]  ( .A(F_IO_A_OUT[0]), .OE(n3), .Y(F_IO_A[0]) );
  TBUFXL \F_IO_A_tri[1]  ( .A(F_IO_A_OUT[1]), .OE(n3), .Y(F_IO_A[1]) );
  TBUFXL \F_IO_A_tri[2]  ( .A(F_IO_A_OUT[2]), .OE(n3), .Y(F_IO_A[2]) );
  TBUFXL \F_IO_A_tri[3]  ( .A(F_IO_A_OUT[3]), .OE(n3), .Y(F_IO_A[3]) );
  TBUFXL \F_IO_A_tri[5]  ( .A(F_IO_A_OUT[5]), .OE(n3), .Y(F_IO_A[5]) );
  TBUFXL \F_IO_A_tri[6]  ( .A(F_IO_A_OUT[6]), .OE(n3), .Y(F_IO_A[6]) );
  TBUFXL \F_IO_A_tri[4]  ( .A(n354), .OE(n3), .Y(F_IO_A[4]) );
  TBUFXL \F_IO_A_tri[7]  ( .A(F_IO_A_OUT[7]), .OE(n3), .Y(F_IO_A[7]) );
  DFFQX1 done_reg ( .D(n110), .CK(clk), .Q(done) );
  DFFQX1 F_WEN_A_reg ( .D(n134), .CK(clk), .Q(F_WEN_A) );
  DFFQX1 F_WEN_B_reg ( .D(n140), .CK(clk), .Q(F_WEN_B) );
  DFFQX1 \page_reg[7]  ( .D(n117), .CK(clk), .Q(page[7]) );
  DFFQX1 \state_reg[0]  ( .D(n115), .CK(clk), .Q(state[0]) );
  DFFQX1 \state_reg[3]  ( .D(n114), .CK(clk), .Q(state[3]) );
  DFFQX1 \state_reg[2]  ( .D(n113), .CK(clk), .Q(state[2]) );
  DFFQX1 \state_reg[1]  ( .D(n112), .CK(clk), .Q(state[1]) );
  DFFQX1 F_REN_A_reg ( .D(n358), .CK(clk), .Q(F_REN_A) );
  DFFQX1 F_IO_A_READING_reg ( .D(n473), .CK(clk), .Q(F_IO_A_READING) );
  EDFFTRXL F_ALE_A_reg ( .RN(n471), .D(1'b1), .E(n470), .CK(clk), .QN(F_ALE_A)
         );
  OAI31XL U254 ( .A0(state[1]), .A1(state[0]), .A2(F_IO_A[4]), .B0(state[3]), 
        .Y(n321) );
  AOI22XL U251 ( .A0(n350), .A1(F_IO_A[7]), .B0(state[2]), .B1(page[7]), .Y(
        n319) );
  AO21X1 U280 ( .A0(n352), .A1(F_IO_A[6]), .B0(F_IO_A_OUT[6]), .Y(
        F_IO_B_OUT[6]) );
  AO21X1 U279 ( .A0(n352), .A1(F_IO_A[5]), .B0(F_IO_A_OUT[5]), .Y(
        F_IO_B_OUT[5]) );
  AO21X1 U278 ( .A0(n352), .A1(F_IO_A[3]), .B0(F_IO_A_OUT[3]), .Y(
        F_IO_B_OUT[3]) );
  AO21X1 U277 ( .A0(n352), .A1(F_IO_A[2]), .B0(F_IO_A_OUT[2]), .Y(
        F_IO_B_OUT[2]) );
  AO21X1 U276 ( .A0(n352), .A1(F_IO_A[1]), .B0(F_IO_A_OUT[1]), .Y(
        F_IO_B_OUT[1]) );
  AO21X1 U275 ( .A0(n352), .A1(F_IO_A[0]), .B0(F_IO_A_OUT[0]), .Y(
        F_IO_B_OUT[0]) );
  NAND2XL U281 ( .A(n463), .B(n452), .Y(n421) );
  OA21XL U282 ( .A0(F_RB_B), .A1(n412), .B0(n401), .Y(n463) );
  INVXL U283 ( .A(n400), .Y(n401) );
  AND2X1 U284 ( .A(n360), .B(n468), .Y(n473) );
  NAND2XL U285 ( .A(n393), .B(n386), .Y(n400) );
  OR2X2 U286 ( .A(n446), .B(n448), .Y(n383) );
  NAND3XL U287 ( .A(n447), .B(counter[7]), .C(counter[8]), .Y(n386) );
  AO22X1 U288 ( .A0(n420), .A1(n419), .B0(n418), .B1(n417), .Y(n117) );
  AO21X1 U289 ( .A0(n429), .A1(F_ALE_B), .B0(n428), .Y(n138) );
  AND2X1 U290 ( .A(n381), .B(n380), .Y(n420) );
  INVXL U291 ( .A(n442), .Y(n448) );
  NOR2XL U292 ( .A(n439), .B(n446), .Y(n447) );
  OAI21XL U293 ( .A0(rst), .A1(n321), .B0(n424), .Y(F_IO_B_OUT[4]) );
  NOR2BX1 U294 ( .AN(n393), .B(n392), .Y(n429) );
  NOR2XL U295 ( .A(n379), .B(n406), .Y(n381) );
  INVXL U296 ( .A(n380), .Y(n457) );
  NOR2XL U297 ( .A(n439), .B(rst), .Y(n442) );
  NAND2XL U298 ( .A(n441), .B(counter[6]), .Y(n446) );
  NAND3XL U299 ( .A(n391), .B(F_WEN_B), .C(n390), .Y(n439) );
  NOR2XL U300 ( .A(n440), .B(n438), .Y(n441) );
  NOR2XL U301 ( .A(n409), .B(n398), .Y(n393) );
  INVXL U302 ( .A(n428), .Y(n471) );
  AND2X1 U303 ( .A(F_WEN_B), .B(n391), .Y(n361) );
  NOR2XL U304 ( .A(n452), .B(rst), .Y(n380) );
  OAI211XL U305 ( .A0(state[1]), .A1(n319), .B0(n411), .C0(n468), .Y(
        F_IO_B_OUT[7]) );
  NAND3XL U306 ( .A(state[0]), .B(F_RB_B), .C(n392), .Y(n452) );
  NOR2XL U307 ( .A(n409), .B(n416), .Y(n391) );
  NAND2XL U308 ( .A(n433), .B(counter[4]), .Y(n440) );
  OAI21XL U309 ( .A0(n405), .A1(n385), .B0(n468), .Y(n398) );
  NOR2BX1 U310 ( .AN(page[2]), .B(n427), .Y(F_IO_A_OUT[2]) );
  NOR2BX1 U311 ( .AN(page[1]), .B(n427), .Y(F_IO_A_OUT[1]) );
  AND2X1 U312 ( .A(n461), .B(n350), .Y(n352) );
  NAND2XL U313 ( .A(n373), .B(page[4]), .Y(n377) );
  NAND3XL U314 ( .A(state[2]), .B(n423), .C(n468), .Y(n427) );
  NOR3XL U315 ( .A(n372), .B(n397), .C(n371), .Y(n433) );
  NOR2XL U316 ( .A(state[0]), .B(n409), .Y(n350) );
  NAND2XL U317 ( .A(n410), .B(n405), .Y(n416) );
  NOR3XL U318 ( .A(state[2]), .B(n423), .C(n409), .Y(n392) );
  INVXL U319 ( .A(state[3]), .Y(n409) );
  INVXL U320 ( .A(counter[6]), .Y(n445) );
  NOR2XL U321 ( .A(state[1]), .B(rst), .Y(n461) );
  INVXL U322 ( .A(page[0]), .Y(n451) );
  INVXL U323 ( .A(counter[5]), .Y(n438) );
  INVXL U324 ( .A(F_CLE_A), .Y(n399) );
  INVXL U325 ( .A(counter[1]), .Y(n431) );
  INVXL U326 ( .A(counter[0]), .Y(n397) );
  INVXL U327 ( .A(page[7]), .Y(n419) );
  INVXL U328 ( .A(page[3]), .Y(n408) );
  INVXL U329 ( .A(state[0]), .Y(n405) );
  NAND2XL U330 ( .A(counter[1]), .B(counter[2]), .Y(n372) );
  INVXL U331 ( .A(F_IO_A_READING), .Y(n3) );
  INVXL U332 ( .A(page[6]), .Y(n406) );
  NAND2XL U333 ( .A(F_REN_A), .B(F_RB_A), .Y(n390) );
  INVXL U334 ( .A(page[5]), .Y(n407) );
  INVXL U335 ( .A(state[1]), .Y(n423) );
  INVXL U336 ( .A(page[4]), .Y(n388) );
  INVXL U337 ( .A(counter[3]), .Y(n371) );
  INVXL U338 ( .A(rst), .Y(n468) );
  INVXL U339 ( .A(1'b0), .Y(F_REN_B) );
  NAND2XL U341 ( .A(n393), .B(n362), .Y(n358) );
  INVXL U342 ( .A(n460), .Y(n462) );
  INVXL U343 ( .A(n354), .Y(n424) );
  NAND2XL U344 ( .A(n401), .B(F_WEN_A), .Y(n402) );
  INVXL U345 ( .A(n373), .Y(n376) );
  NOR3XL U346 ( .A(counter[8]), .B(n446), .C(n448), .Y(n450) );
  NOR2XL U347 ( .A(n427), .B(n408), .Y(F_IO_A_OUT[3]) );
  AOI21XL U348 ( .A0(n463), .A1(n405), .B0(n422), .Y(n115) );
  OAI32XL U349 ( .A0(counter[2]), .A1(n431), .A2(n432), .B0(n364), .B1(n363), 
        .Y(n131) );
  NOR2XL U350 ( .A(state[1]), .B(state[2]), .Y(n410) );
  NAND2XL U351 ( .A(state[3]), .B(n410), .Y(n385) );
  INVXL U352 ( .A(n393), .Y(n470) );
  INVXL U353 ( .A(state[2]), .Y(n459) );
  NOR3XL U354 ( .A(n423), .B(n405), .C(n459), .Y(n359) );
  NOR4BX1 U355 ( .AN(n416), .B(rst), .C(state[3]), .D(n359), .Y(n428) );
  NAND2XL U357 ( .A(n359), .B(n409), .Y(n403) );
  OAI2BB1XL U358 ( .A0N(F_IO_A_READING), .A1N(n386), .B0(n403), .Y(n360) );
  INVXL U359 ( .A(n391), .Y(n394) );
  OAI22XL U360 ( .A0(F_REN_A), .A1(n361), .B0(n394), .B1(n390), .Y(n362) );
  NAND2XL U361 ( .A(counter[0]), .B(n442), .Y(n432) );
  OAI31XL U362 ( .A0(n431), .A1(n439), .A2(n397), .B0(n468), .Y(n364) );
  INVXL U363 ( .A(counter[2]), .Y(n363) );
  NAND2XL U364 ( .A(n442), .B(n438), .Y(n366) );
  OAI21XL U365 ( .A0(n439), .A1(n440), .B0(n468), .Y(n365) );
  OAI22XL U366 ( .A0(n440), .A1(n366), .B0(n438), .B1(n365), .Y(n128) );
  NAND3XL U367 ( .A(page[0]), .B(page[1]), .C(page[2]), .Y(n374) );
  NAND2XL U368 ( .A(n380), .B(n408), .Y(n368) );
  OAI21XL U369 ( .A0(n452), .A1(n374), .B0(n468), .Y(n367) );
  OAI22XL U370 ( .A0(n374), .A1(n368), .B0(n408), .B1(n367), .Y(n121) );
  NOR2XL U371 ( .A(n374), .B(n408), .Y(n373) );
  NAND2XL U372 ( .A(n380), .B(n407), .Y(n370) );
  OAI21XL U373 ( .A0(n452), .A1(n377), .B0(n468), .Y(n369) );
  OAI22XL U374 ( .A0(n377), .A1(n370), .B0(n407), .B1(n369), .Y(n119) );
  OAI31XL U375 ( .A0(n439), .A1(n372), .A2(n397), .B0(n468), .Y(n434) );
  OAI32XL U376 ( .A0(counter[3]), .A1(n372), .A2(n432), .B0(n434), .B1(n371), 
        .Y(n130) );
  OAI31XL U377 ( .A0(n374), .A1(n452), .A2(n408), .B0(n468), .Y(n375) );
  OAI32XL U378 ( .A0(page[4]), .A1(n457), .A2(n376), .B0(n375), .B1(n388), .Y(
        n120) );
  OR2X2 U379 ( .A(n377), .B(n407), .Y(n379) );
  OAI31XL U380 ( .A0(n377), .A1(n452), .A2(n407), .B0(n468), .Y(n378) );
  OAI32XL U381 ( .A0(page[6]), .A1(n457), .A2(n379), .B0(n378), .B1(n406), .Y(
        n118) );
  NAND2XL U382 ( .A(n420), .B(page[7]), .Y(n467) );
  INVXL U383 ( .A(n452), .Y(n453) );
  NAND2XL U384 ( .A(n453), .B(n381), .Y(n418) );
  OAI211XL U385 ( .A0(n419), .A1(n418), .B0(page[8]), .C0(n468), .Y(n382) );
  OAI21XL U386 ( .A0(page[8]), .A1(n467), .B0(n382), .Y(n116) );
  INVXL U387 ( .A(counter[7]), .Y(n384) );
  OAI32XL U388 ( .A0(n384), .A1(rst), .A2(n447), .B0(counter[7]), .B1(n383), 
        .Y(n126) );
  NAND2XL U389 ( .A(n392), .B(n405), .Y(n412) );
  AND3X1 U390 ( .A(n412), .B(n385), .C(n403), .Y(n387) );
  OAI21XL U391 ( .A0(rst), .A1(n387), .B0(n421), .Y(n114) );
  NOR2XL U392 ( .A(n427), .B(n388), .Y(n354) );
  NAND2XL U393 ( .A(state[0]), .B(F_RB_B), .Y(n389) );
  AOI22XL U394 ( .A0(n391), .A1(n390), .B0(n392), .B1(n389), .Y(n396) );
  NAND3XL U395 ( .A(F_WEN_B), .B(n429), .C(n394), .Y(n395) );
  NOR2XL U396 ( .A(state[0]), .B(rst), .Y(n404) );
  NAND2XL U397 ( .A(n404), .B(n409), .Y(n460) );
  OAI211XL U398 ( .A0(rst), .A1(n396), .B0(n395), .C0(n460), .Y(n140) );
  OAI21XL U399 ( .A0(n439), .A1(n397), .B0(n468), .Y(n430) );
  AOI21XL U400 ( .A0(n439), .A1(n397), .B0(n430), .Y(n133) );
  INVXL U401 ( .A(n398), .Y(n415) );
  AOI32XL U402 ( .A0(n415), .A1(n400), .A2(n416), .B0(n401), .B1(n399), .Y(
        n135) );
  OAI211XL U403 ( .A0(rst), .A1(n403), .B0(n402), .C0(n460), .Y(n134) );
  NOR2BX1 U404 ( .AN(n421), .B(n404), .Y(n422) );
  NOR2XL U405 ( .A(n427), .B(n419), .Y(F_IO_A_OUT[7]) );
  NOR2XL U406 ( .A(n427), .B(n406), .Y(F_IO_A_OUT[6]) );
  NOR2XL U407 ( .A(n427), .B(n407), .Y(F_IO_A_OUT[5]) );
  NAND2XL U408 ( .A(n410), .B(n409), .Y(n411) );
  INVXL U409 ( .A(n412), .Y(n413) );
  AOI211XL U410 ( .A0(n429), .A1(F_CLE_B), .B0(n453), .C0(n413), .Y(n414) );
  OAI211XL U411 ( .A0(state[3]), .A1(n416), .B0(n415), .C0(n414), .Y(n139) );
  NOR2XL U412 ( .A(n419), .B(rst), .Y(n417) );
  NAND3XL U413 ( .A(state[0]), .B(n468), .C(n421), .Y(n465) );
  OAI22XL U414 ( .A0(state[1]), .A1(n465), .B0(n423), .B1(n422), .Y(n112) );
  NAND2XL U415 ( .A(state[1]), .B(state[2]), .Y(n426) );
  NAND2XL U416 ( .A(page[8]), .B(n468), .Y(n425) );
  OAI22XL U417 ( .A0(n427), .A1(n451), .B0(n426), .B1(n425), .Y(F_IO_A_OUT[0])
         );
  OAI22XL U418 ( .A0(counter[1]), .A1(n432), .B0(n431), .B1(n430), .Y(n132) );
  INVXL U419 ( .A(n433), .Y(n437) );
  OAI21XL U420 ( .A0(counter[3]), .A1(n448), .B0(n434), .Y(n435) );
  NAND2XL U421 ( .A(n435), .B(counter[4]), .Y(n436) );
  OAI31XL U422 ( .A0(counter[4]), .A1(n448), .A2(n437), .B0(n436), .Y(n129) );
  OAI31XL U423 ( .A0(n440), .A1(n439), .A2(n438), .B0(n468), .Y(n444) );
  NAND3XL U424 ( .A(n445), .B(n442), .C(n441), .Y(n443) );
  OAI21XL U425 ( .A0(n445), .A1(n444), .B0(n443), .Y(n127) );
  OAI22XL U426 ( .A0(counter[7]), .A1(n448), .B0(rst), .B1(n447), .Y(n449) );
  AO22X1 U427 ( .A0(counter[7]), .A1(n450), .B0(counter[8]), .B1(n449), .Y(
        n125) );
  OA21XL U428 ( .A0(n452), .A1(n451), .B0(n468), .Y(n454) );
  OA21XL U429 ( .A0(n453), .A1(page[0]), .B0(n454), .Y(n124) );
  NOR2XL U430 ( .A(page[1]), .B(n457), .Y(n455) );
  AO22X1 U431 ( .A0(page[0]), .A1(n455), .B0(page[1]), .B1(n454), .Y(n123) );
  NAND2XL U432 ( .A(page[0]), .B(page[1]), .Y(n458) );
  OAI21XL U433 ( .A0(n455), .A1(n454), .B0(page[2]), .Y(n456) );
  OAI31XL U434 ( .A0(page[2]), .A1(n458), .A2(n457), .B0(n456), .Y(n122) );
  NAND2XL U435 ( .A(state[1]), .B(n459), .Y(n466) );
  OAI31XL U436 ( .A0(n463), .A1(n462), .A2(n461), .B0(state[2]), .Y(n464) );
  OAI31XL U437 ( .A0(state[3]), .A1(n466), .A2(n465), .B0(n464), .Y(n113) );
  INVXL U438 ( .A(n467), .Y(n469) );
  AO22X1 U439 ( .A0(page[8]), .A1(n469), .B0(done), .B1(n468), .Y(n110) );
endmodule

