<br/>
<p align="center">
  <h3 align="center">IC Contest 2012 B</h3>

  <p align="center">
    2012 IC Design Contest Preliminary<br>
標準元件數位電路設計 – 大學/研究所組<br>
NAND Flash Memory Controller
    <br/>
    <br/>
    <a href="https://github.com/shinkuan/ICC2012_B/blob/main/B_ICC2012_preliminary_all_cell.pdf"><strong>Explore the docs »</strong></a>
    <br/>
    <br/>
    <a href="https://github.com/shinkuan/ICC2012_B/issues">Report Bug</a>
    .
    <a href="https://github.com/shinkuan/ICC2012_B/issues">Request Feature</a>
  </p>
</p>

![Contributors](https://img.shields.io/github/contributors/shinkuan/ICC2012_B?color=dark-green) ![Issues](https://img.shields.io/github/issues/shinkuan/ICC2012_B) 

## Table Of Contents

- [Table Of Contents](#table-of-contents)
- [About The Project](#about-the-project)
  - [__問題描述__](#問題描述)
- [Usage](#usage)
  - [Basic usage](#basic-usage)
  - [Locking the circuit](#locking-the-circuit)
  - [Wartermark](#wartermark)
  - [TMR](#tmr)
- [TODO](#todo)
- [License](#license)
- [Authors](#authors)

## About The Project

![Screen Shot](https://i.imgur.com/kcSRFWD.png)

### __問題描述__

　　請完成一快閃記憶體控制(NAND Flash Memory Control)電路設計。此控制電路的功能是將快閃記憶體 A 的資料完全複製至快閃記憶體 B。 <br>
　　本控制電路有 4 只信號輸入(clk, rst, F_RB_A, F_RB_B)、9 只信號輸出(done,F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B)及 2 只記憶體雙向輸出入信號(F_IO_A, F_IO_B)，如圖 一所示，關於各輸入/輸出信號的功能說明，請參考表一。 <br>
　　__本試題有使用到快閃記憶體模型(flash simulation model)，其中內含時序檢查，若要避免 RTL模擬時所産生的時序檢查錯誤(setup or hold violation)，可參考附錄 B 的第 4 點來進行模擬。__ <br>
　　每個參賽隊伍必須根據下一節所給的設計規格完成計。參賽隊伍可藉由 CIC 所提供的輸入指令及正確結果檔來檢查設計是否有達到要求，詳情請參考附錄 B。 <br>

## Usage

### Basic usage

1. cd into __B_ICC2012_preliminary_all_cell__ 
   - `cd ./B_ICC2012_preliminary_all_cell/`  
1. use __ncverilog__ to run testbench. You may choose `p1` or `p2`. __+FSDB__ to generate fsdb file.
   - `ncverilog testfixture.v NFC_ORIG.v +define+p1+FSDB +access+r`  
2. You can use [load.tcl](https://github.com/shinkuan/ICC2012_B/blob/main/B_ICC2012_preliminary_all_cell/load.tcl) to load __NFC.v__ into __Design Vision__.  
3. Load timing constrain for Flash using [set_timeviolation.tcl](https://github.com/shinkuan/ICC2012_B/blob/main/B_ICC2012_preliminary_all_cell/set_timeviolation.tcl)  
4. Provided a simple way to __report__ and __save__ result using [ReportAndSave.tcl](https://github.com/shinkuan/ICC2012_B/blob/main/B_ICC2012_preliminary_all_cell/ReportAndSave.tcl)
5. After synthesis, run post-syn simulation using:
   - `ncverilog testfixture.v ./Report/NFC_syn.v +define+p2+FSDB+SDF +access+r`

### Locking the circuit

Basic idea:

![Locking circuit](https://i.imgur.com/9ke5cyF.png)

1. Define a `4bit * 8` KEY here.
2. Define what key will testbench use here 
3. Run testbench with `+KEY`.
   - `ncverilog testfixture.v NFC.v +define+p1+FSDB+KEY +access+r` 
4. To unlock the circuit, input the `4bit * 8` KEY in correct order.

Example KEY in this repo is __PYPD__ in ascii (python 派對)

### Wartermark

When the circuit is in __wartermark mode__, it writes wartermark on to __NAND Flash Memory B__ repeatly.

To enter __wartermark mode__, input the following to port `KEY` in sequence:
 - `OFSM_KEY_0`~`OFSM_KEY_6`
 - `WTMK_KEY`
 - `OFSM_KEY_0`~`OFSM_KEY_7`

How to use:

1. Define the parameter:
   1. Define a `8bit * 8` wartermark in NFC.v
   2. Define `WTMK_KEY` in NFC.v
   3. Also Define `WTMK_KEY` in testfixture.v
2. Change data in wartermark_mem_goal.dat
3. Run testbench with `+WARTERMARK`.
   - `ncverilog testfixture.v NFC.v +define+p1+FSDB+KEY+WARTERMARK +access+r` 
   - __`+KEY` must be used with `+WARTERMARK`__

Example Wartermark in this repo is __PY party__ (python party)

### TMR

![TMR](https://i.imgur.com/brlOnR0.png)

Added the following testing inputs:

 - `A_ERROR_CTRL`
 - `B_ERROR_CTRL`
 - `C_ERROR_CTRL`

When __error_ctrl input__ is __1__, the behavier of the module will give __wrong__ outputs.

Added the following output ports:

 - `TMR_ERROR`

When __two or more__ modules gives wrong output, `TMR_ERROR` outputs 1

1. Run testbench with `+TMR`.
   - `ncverilog testfixture.v NFC_TMR.v +define+p1+FSDB+KEY+TMR +access+r`
   - __NFC_TMR.v is based on NFC that has KEY function, so `+KEY` must be used either.__ 

## TODO
 - [x] Basic functions working
 - [x] Locking Circuit
 - [x] Obfuscated states
 - [x] Wartermarking
 - [x] TMR for reliability
 - [ ] Design a more complex obfuscated states
 - [ ] Calculate MTTF of the proposed TMR

## License

Distributed under the MIT License. See [LICENSE](https://github.com/shinkuan/ICC2012_B/blob/main/LICENSE.md) for more information.

## Authors

* **Shinkuan** - [Shinkuan](https://github.com/shinkuan/)
* **j20020420** - [j20020420](https://github.com/j20020420)
* **rickhuang31** - [rickhuang31](https://github.com/rickhuang31)
