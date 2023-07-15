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

* [About the Project](#about-the-project)
* [Usage](#usage)
* [License](#license)
* [Authors](#authors)
* [Acknowledgements](#acknowledgements)

## About The Project

![Screen Shot](https://i.imgur.com/kcSRFWD.png)

### __問題描述__

　　請完成一快閃記憶體控制(NAND Flash Memory Control)電路設計。此控制電路的功能是將快閃記憶體 A 的資料完全複製至快閃記憶體 B。
　　本控制電路有 4 只信號輸入(clk, rst, F_RB_A, F_RB_B)、9 只信號輸出(done,F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B)及 2 只記憶體雙向輸出入信號(F_IO_A, F_IO_B)，如圖 一所示，關於各輸入/輸出信號的功能說明，請參考表一。
　　__本試題有使用到快閃記憶體模型(flash simulation model)，其中內含時序檢查，若要避免 RTL模擬時所産生的時序檢查錯誤(setup or hold violation)，可參考附錄 B 的第 4 點來進行模擬。__
　　每個參賽隊伍必須根據下一節所給的設計規格完成計。參賽隊伍可藉由 CIC 所提供的輸入指令及正確結果檔來檢查設計是否有達到要求，詳情請參考附錄 B。

## Usage

1. cd into __B_ICC2012_preliminary_all_cell__ 
 `cd ./B_ICC2012_preliminary_all_cell/`  
2. use __ncverilog__ to run testbench. You may choose `p1` or `p2`. __+FSDB__ to generate fsdb file.
`ncverilog testfixture.v NFC.v +define+p1+FSDB +access+r`  
3. You can use [load.tcl](https://github.com/shinkuan/ICC2012_B/blob/main/B_ICC2012_preliminary_all_cell/load.tcl) to load __NFC.v__ into __Design Vision__.  
4. Load timing constrain for Flash using [set_timeviolation.tcl](https://github.com/shinkuan/ICC2012_B/blob/main/B_ICC2012_preliminary_all_cell/set_timeviolation.tcl)  
5. Provided a somple way to __report__ and __save__ result using [ReportAndSave.tcl](https://github.com/shinkuan/ICC2012_B/blob/main/B_ICC2012_preliminary_all_cell/ReportAndSave.tcl)

## License

Distributed under the MIT License. See [LICENSE](https://github.com/shinkuan/ICC2012_B/blob/main/LICENSE.md) for more information.

## Authors

* **Shinkuan** - [Shinkuan](https://github.com/shinkuan/)
