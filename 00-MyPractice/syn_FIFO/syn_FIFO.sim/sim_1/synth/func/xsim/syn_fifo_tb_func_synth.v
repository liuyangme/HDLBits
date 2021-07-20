// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Jul 19 15:32:19 2021
// Host        : LiuYang-Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               E:/Project/Doing/ProgrammingExercise/HDLBits/00-MyPractice/syn_FIFO/syn_FIFO.sim/sim_1/synth/func/xsim/syn_fifo_tb_func_synth.v
// Design      : syn_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ADDR_WIDTH = "3" *) (* FIFO_DEPTH = "8" *) (* FIFO_WIDTH = "32" *) 
(* NotValidForBitStream *)
module syn_fifo
   (clk_i,
    rst_n,
    wr_data,
    r_req,
    w_req,
    rd_data,
    full_o,
    empty_o);
  input clk_i;
  input rst_n;
  input [31:0]wr_data;
  input r_req;
  input w_req;
  output [31:0]rd_data;
  output full_o;
  output empty_o;

  wire clk_i;
  wire clk_i_IBUF;
  wire clk_i_IBUF_BUFG;
  wire counter;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter[2]_i_1_n_0 ;
  wire \counter[3]_i_2_n_0 ;
  wire [3:0]counter_reg;
  wire empty_o;
  wire empty_o_OBUF;
  wire fifo_mem_reg_0_7_0_5_i_1_n_0;
  wire full_o;
  wire full_o_OBUF;
  wire r_req;
  wire r_req_IBUF;
  wire [31:0]rd_data;
  wire [31:0]rd_data0;
  wire \rd_data[31]_i_1_n_0 ;
  wire \rd_data[31]_i_2_n_0 ;
  wire [31:0]rd_data_OBUF;
  wire [2:0]rd_ptr;
  wire \rd_ptr[0]_i_1_n_0 ;
  wire \rd_ptr[1]_i_1_n_0 ;
  wire \rd_ptr[2]_i_1_n_0 ;
  wire rst_n;
  wire rst_n_IBUF;
  wire w_req;
  wire w_req_IBUF;
  wire [31:0]wr_data;
  wire [31:0]wr_data_IBUF;
  wire [2:0]wr_ptr;
  wire \wr_ptr[0]_i_1_n_0 ;
  wire \wr_ptr[1]_i_1_n_0 ;
  wire \wr_ptr[2]_i_1_n_0 ;
  wire [1:0]NLW_fifo_mem_reg_0_7_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_fifo_mem_reg_0_7_12_17_DOD_UNCONNECTED;
  wire [1:0]NLW_fifo_mem_reg_0_7_18_23_DOD_UNCONNECTED;
  wire [1:0]NLW_fifo_mem_reg_0_7_24_29_DOD_UNCONNECTED;
  wire [1:0]NLW_fifo_mem_reg_0_7_30_31_DOB_UNCONNECTED;
  wire [1:0]NLW_fifo_mem_reg_0_7_30_31_DOC_UNCONNECTED;
  wire [1:0]NLW_fifo_mem_reg_0_7_30_31_DOD_UNCONNECTED;
  wire [1:0]NLW_fifo_mem_reg_0_7_6_11_DOD_UNCONNECTED;

  BUFG clk_i_IBUF_BUFG_inst
       (.I(clk_i_IBUF),
        .O(clk_i_IBUF_BUFG));
  IBUF clk_i_IBUF_inst
       (.I(clk_i),
        .O(clk_i_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter_reg[0]),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h669966B9)) 
    \counter[1]_i_1 
       (.I0(w_req_IBUF),
        .I1(counter_reg[0]),
        .I2(counter_reg[3]),
        .I3(counter_reg[1]),
        .I4(counter_reg[2]),
        .O(\counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7788EE31)) 
    \counter[2]_i_1 
       (.I0(w_req_IBUF),
        .I1(counter_reg[0]),
        .I2(counter_reg[3]),
        .I3(counter_reg[2]),
        .I4(counter_reg[1]),
        .O(\counter[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h55555657AAAAAAA8)) 
    \counter[3]_i_1 
       (.I0(r_req_IBUF),
        .I1(counter_reg[0]),
        .I2(counter_reg[1]),
        .I3(counter_reg[3]),
        .I4(counter_reg[2]),
        .I5(w_req_IBUF),
        .O(counter));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7F80FA01)) 
    \counter[3]_i_2 
       (.I0(counter_reg[0]),
        .I1(w_req_IBUF),
        .I2(counter_reg[1]),
        .I3(counter_reg[3]),
        .I4(counter_reg[2]),
        .O(\counter[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(counter),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(\counter[0]_i_1_n_0 ),
        .Q(counter_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(counter),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(\counter[1]_i_1_n_0 ),
        .Q(counter_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(counter),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(\counter[2]_i_1_n_0 ),
        .Q(counter_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_i_IBUF_BUFG),
        .CE(counter),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(\counter[3]_i_2_n_0 ),
        .Q(counter_reg[3]));
  OBUF empty_o_OBUF_inst
       (.I(empty_o_OBUF),
        .O(empty_o));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    empty_o_OBUF_inst_i_1
       (.I0(counter_reg[2]),
        .I1(counter_reg[3]),
        .I2(counter_reg[1]),
        .I3(counter_reg[0]),
        .O(empty_o_OBUF));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "7" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    fifo_mem_reg_0_7_0_5
       (.ADDRA({1'b0,1'b0,rd_ptr}),
        .ADDRB({1'b0,1'b0,rd_ptr}),
        .ADDRC({1'b0,1'b0,rd_ptr}),
        .ADDRD({1'b0,1'b0,wr_ptr}),
        .DIA(wr_data_IBUF[1:0]),
        .DIB(wr_data_IBUF[3:2]),
        .DIC(wr_data_IBUF[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(rd_data0[1:0]),
        .DOB(rd_data0[3:2]),
        .DOC(rd_data0[5:4]),
        .DOD(NLW_fifo_mem_reg_0_7_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i_IBUF_BUFG),
        .WE(fifo_mem_reg_0_7_0_5_i_1_n_0));
  LUT5 #(
    .INIT(32'hAAAAAA8A)) 
    fifo_mem_reg_0_7_0_5_i_1
       (.I0(w_req_IBUF),
        .I1(counter_reg[0]),
        .I2(counter_reg[3]),
        .I3(counter_reg[1]),
        .I4(counter_reg[2]),
        .O(fifo_mem_reg_0_7_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "7" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "17" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    fifo_mem_reg_0_7_12_17
       (.ADDRA({1'b0,1'b0,rd_ptr}),
        .ADDRB({1'b0,1'b0,rd_ptr}),
        .ADDRC({1'b0,1'b0,rd_ptr}),
        .ADDRD({1'b0,1'b0,wr_ptr}),
        .DIA(wr_data_IBUF[13:12]),
        .DIB(wr_data_IBUF[15:14]),
        .DIC(wr_data_IBUF[17:16]),
        .DID({1'b0,1'b0}),
        .DOA(rd_data0[13:12]),
        .DOB(rd_data0[15:14]),
        .DOC(rd_data0[17:16]),
        .DOD(NLW_fifo_mem_reg_0_7_12_17_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i_IBUF_BUFG),
        .WE(fifo_mem_reg_0_7_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "7" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "23" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    fifo_mem_reg_0_7_18_23
       (.ADDRA({1'b0,1'b0,rd_ptr}),
        .ADDRB({1'b0,1'b0,rd_ptr}),
        .ADDRC({1'b0,1'b0,rd_ptr}),
        .ADDRD({1'b0,1'b0,wr_ptr}),
        .DIA(wr_data_IBUF[19:18]),
        .DIB(wr_data_IBUF[21:20]),
        .DIC(wr_data_IBUF[23:22]),
        .DID({1'b0,1'b0}),
        .DOA(rd_data0[19:18]),
        .DOB(rd_data0[21:20]),
        .DOC(rd_data0[23:22]),
        .DOD(NLW_fifo_mem_reg_0_7_18_23_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i_IBUF_BUFG),
        .WE(fifo_mem_reg_0_7_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "7" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "29" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    fifo_mem_reg_0_7_24_29
       (.ADDRA({1'b0,1'b0,rd_ptr}),
        .ADDRB({1'b0,1'b0,rd_ptr}),
        .ADDRC({1'b0,1'b0,rd_ptr}),
        .ADDRD({1'b0,1'b0,wr_ptr}),
        .DIA(wr_data_IBUF[25:24]),
        .DIB(wr_data_IBUF[27:26]),
        .DIC(wr_data_IBUF[29:28]),
        .DID({1'b0,1'b0}),
        .DOA(rd_data0[25:24]),
        .DOB(rd_data0[27:26]),
        .DOC(rd_data0[29:28]),
        .DOD(NLW_fifo_mem_reg_0_7_24_29_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i_IBUF_BUFG),
        .WE(fifo_mem_reg_0_7_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "7" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    fifo_mem_reg_0_7_30_31
       (.ADDRA({1'b0,1'b0,rd_ptr}),
        .ADDRB({1'b0,1'b0,rd_ptr}),
        .ADDRC({1'b0,1'b0,rd_ptr}),
        .ADDRD({1'b0,1'b0,wr_ptr}),
        .DIA(wr_data_IBUF[31:30]),
        .DIB({1'b0,1'b0}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(rd_data0[31:30]),
        .DOB(NLW_fifo_mem_reg_0_7_30_31_DOB_UNCONNECTED[1:0]),
        .DOC(NLW_fifo_mem_reg_0_7_30_31_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_fifo_mem_reg_0_7_30_31_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i_IBUF_BUFG),
        .WE(fifo_mem_reg_0_7_0_5_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "7" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    fifo_mem_reg_0_7_6_11
       (.ADDRA({1'b0,1'b0,rd_ptr}),
        .ADDRB({1'b0,1'b0,rd_ptr}),
        .ADDRC({1'b0,1'b0,rd_ptr}),
        .ADDRD({1'b0,1'b0,wr_ptr}),
        .DIA(wr_data_IBUF[7:6]),
        .DIB(wr_data_IBUF[9:8]),
        .DIC(wr_data_IBUF[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(rd_data0[7:6]),
        .DOB(rd_data0[9:8]),
        .DOC(rd_data0[11:10]),
        .DOD(NLW_fifo_mem_reg_0_7_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_i_IBUF_BUFG),
        .WE(fifo_mem_reg_0_7_0_5_i_1_n_0));
  OBUF full_o_OBUF_inst
       (.I(full_o_OBUF),
        .O(full_o));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    full_o_OBUF_inst_i_1
       (.I0(counter_reg[2]),
        .I1(counter_reg[1]),
        .I2(counter_reg[3]),
        .I3(counter_reg[0]),
        .O(full_o_OBUF));
  IBUF r_req_IBUF_inst
       (.I(r_req),
        .O(r_req_IBUF));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    \rd_data[31]_i_1 
       (.I0(r_req_IBUF),
        .I1(counter_reg[0]),
        .I2(counter_reg[1]),
        .I3(counter_reg[3]),
        .I4(counter_reg[2]),
        .O(\rd_data[31]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rd_data[31]_i_2 
       (.I0(rst_n_IBUF),
        .O(\rd_data[31]_i_2_n_0 ));
  OBUF \rd_data_OBUF[0]_inst 
       (.I(rd_data_OBUF[0]),
        .O(rd_data[0]));
  OBUF \rd_data_OBUF[10]_inst 
       (.I(rd_data_OBUF[10]),
        .O(rd_data[10]));
  OBUF \rd_data_OBUF[11]_inst 
       (.I(rd_data_OBUF[11]),
        .O(rd_data[11]));
  OBUF \rd_data_OBUF[12]_inst 
       (.I(rd_data_OBUF[12]),
        .O(rd_data[12]));
  OBUF \rd_data_OBUF[13]_inst 
       (.I(rd_data_OBUF[13]),
        .O(rd_data[13]));
  OBUF \rd_data_OBUF[14]_inst 
       (.I(rd_data_OBUF[14]),
        .O(rd_data[14]));
  OBUF \rd_data_OBUF[15]_inst 
       (.I(rd_data_OBUF[15]),
        .O(rd_data[15]));
  OBUF \rd_data_OBUF[16]_inst 
       (.I(rd_data_OBUF[16]),
        .O(rd_data[16]));
  OBUF \rd_data_OBUF[17]_inst 
       (.I(rd_data_OBUF[17]),
        .O(rd_data[17]));
  OBUF \rd_data_OBUF[18]_inst 
       (.I(rd_data_OBUF[18]),
        .O(rd_data[18]));
  OBUF \rd_data_OBUF[19]_inst 
       (.I(rd_data_OBUF[19]),
        .O(rd_data[19]));
  OBUF \rd_data_OBUF[1]_inst 
       (.I(rd_data_OBUF[1]),
        .O(rd_data[1]));
  OBUF \rd_data_OBUF[20]_inst 
       (.I(rd_data_OBUF[20]),
        .O(rd_data[20]));
  OBUF \rd_data_OBUF[21]_inst 
       (.I(rd_data_OBUF[21]),
        .O(rd_data[21]));
  OBUF \rd_data_OBUF[22]_inst 
       (.I(rd_data_OBUF[22]),
        .O(rd_data[22]));
  OBUF \rd_data_OBUF[23]_inst 
       (.I(rd_data_OBUF[23]),
        .O(rd_data[23]));
  OBUF \rd_data_OBUF[24]_inst 
       (.I(rd_data_OBUF[24]),
        .O(rd_data[24]));
  OBUF \rd_data_OBUF[25]_inst 
       (.I(rd_data_OBUF[25]),
        .O(rd_data[25]));
  OBUF \rd_data_OBUF[26]_inst 
       (.I(rd_data_OBUF[26]),
        .O(rd_data[26]));
  OBUF \rd_data_OBUF[27]_inst 
       (.I(rd_data_OBUF[27]),
        .O(rd_data[27]));
  OBUF \rd_data_OBUF[28]_inst 
       (.I(rd_data_OBUF[28]),
        .O(rd_data[28]));
  OBUF \rd_data_OBUF[29]_inst 
       (.I(rd_data_OBUF[29]),
        .O(rd_data[29]));
  OBUF \rd_data_OBUF[2]_inst 
       (.I(rd_data_OBUF[2]),
        .O(rd_data[2]));
  OBUF \rd_data_OBUF[30]_inst 
       (.I(rd_data_OBUF[30]),
        .O(rd_data[30]));
  OBUF \rd_data_OBUF[31]_inst 
       (.I(rd_data_OBUF[31]),
        .O(rd_data[31]));
  OBUF \rd_data_OBUF[3]_inst 
       (.I(rd_data_OBUF[3]),
        .O(rd_data[3]));
  OBUF \rd_data_OBUF[4]_inst 
       (.I(rd_data_OBUF[4]),
        .O(rd_data[4]));
  OBUF \rd_data_OBUF[5]_inst 
       (.I(rd_data_OBUF[5]),
        .O(rd_data[5]));
  OBUF \rd_data_OBUF[6]_inst 
       (.I(rd_data_OBUF[6]),
        .O(rd_data[6]));
  OBUF \rd_data_OBUF[7]_inst 
       (.I(rd_data_OBUF[7]),
        .O(rd_data[7]));
  OBUF \rd_data_OBUF[8]_inst 
       (.I(rd_data_OBUF[8]),
        .O(rd_data[8]));
  OBUF \rd_data_OBUF[9]_inst 
       (.I(rd_data_OBUF[9]),
        .O(rd_data[9]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[0]),
        .Q(rd_data_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[10] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[10]),
        .Q(rd_data_OBUF[10]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[11] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[11]),
        .Q(rd_data_OBUF[11]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[12] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[12]),
        .Q(rd_data_OBUF[12]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[13] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[13]),
        .Q(rd_data_OBUF[13]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[14] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[14]),
        .Q(rd_data_OBUF[14]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[15] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[15]),
        .Q(rd_data_OBUF[15]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[16] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[16]),
        .Q(rd_data_OBUF[16]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[17] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[17]),
        .Q(rd_data_OBUF[17]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[18] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[18]),
        .Q(rd_data_OBUF[18]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[19] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[19]),
        .Q(rd_data_OBUF[19]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[1]),
        .Q(rd_data_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[20] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[20]),
        .Q(rd_data_OBUF[20]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[21] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[21]),
        .Q(rd_data_OBUF[21]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[22] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[22]),
        .Q(rd_data_OBUF[22]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[23] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[23]),
        .Q(rd_data_OBUF[23]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[24] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[24]),
        .Q(rd_data_OBUF[24]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[25] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[25]),
        .Q(rd_data_OBUF[25]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[26] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[26]),
        .Q(rd_data_OBUF[26]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[27] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[27]),
        .Q(rd_data_OBUF[27]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[28] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[28]),
        .Q(rd_data_OBUF[28]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[29] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[29]),
        .Q(rd_data_OBUF[29]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[2]),
        .Q(rd_data_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[30] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[30]),
        .Q(rd_data_OBUF[30]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[31] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[31]),
        .Q(rd_data_OBUF[31]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[3] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[3]),
        .Q(rd_data_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[4] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[4]),
        .Q(rd_data_OBUF[4]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[5] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[5]),
        .Q(rd_data_OBUF[5]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[6] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[6]),
        .Q(rd_data_OBUF[6]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[7] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[7]),
        .Q(rd_data_OBUF[7]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[8] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[8]),
        .Q(rd_data_OBUF[8]));
  FDCE #(
    .INIT(1'b0)) 
    \rd_data_reg[9] 
       (.C(clk_i_IBUF_BUFG),
        .CE(\rd_data[31]_i_1_n_0 ),
        .CLR(\rd_data[31]_i_2_n_0 ),
        .D(rd_data0[9]),
        .Q(rd_data_OBUF[9]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \rd_ptr[0]_i_1 
       (.I0(rst_n_IBUF),
        .I1(\rd_data[31]_i_1_n_0 ),
        .I2(rd_ptr[0]),
        .O(\rd_ptr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \rd_ptr[1]_i_1 
       (.I0(rd_ptr[0]),
        .I1(rst_n_IBUF),
        .I2(\rd_data[31]_i_1_n_0 ),
        .I3(rd_ptr[1]),
        .O(\rd_ptr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \rd_ptr[2]_i_1 
       (.I0(rd_ptr[0]),
        .I1(rd_ptr[1]),
        .I2(rst_n_IBUF),
        .I3(\rd_data[31]_i_1_n_0 ),
        .I4(rd_ptr[2]),
        .O(\rd_ptr[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_ptr[0]_i_1_n_0 ),
        .Q(rd_ptr[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_ptr[1]_i_1_n_0 ),
        .Q(rd_ptr[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rd_ptr_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\rd_ptr[2]_i_1_n_0 ),
        .Q(rd_ptr[2]),
        .R(1'b0));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  IBUF w_req_IBUF_inst
       (.I(w_req),
        .O(w_req_IBUF));
  IBUF \wr_data_IBUF[0]_inst 
       (.I(wr_data[0]),
        .O(wr_data_IBUF[0]));
  IBUF \wr_data_IBUF[10]_inst 
       (.I(wr_data[10]),
        .O(wr_data_IBUF[10]));
  IBUF \wr_data_IBUF[11]_inst 
       (.I(wr_data[11]),
        .O(wr_data_IBUF[11]));
  IBUF \wr_data_IBUF[12]_inst 
       (.I(wr_data[12]),
        .O(wr_data_IBUF[12]));
  IBUF \wr_data_IBUF[13]_inst 
       (.I(wr_data[13]),
        .O(wr_data_IBUF[13]));
  IBUF \wr_data_IBUF[14]_inst 
       (.I(wr_data[14]),
        .O(wr_data_IBUF[14]));
  IBUF \wr_data_IBUF[15]_inst 
       (.I(wr_data[15]),
        .O(wr_data_IBUF[15]));
  IBUF \wr_data_IBUF[16]_inst 
       (.I(wr_data[16]),
        .O(wr_data_IBUF[16]));
  IBUF \wr_data_IBUF[17]_inst 
       (.I(wr_data[17]),
        .O(wr_data_IBUF[17]));
  IBUF \wr_data_IBUF[18]_inst 
       (.I(wr_data[18]),
        .O(wr_data_IBUF[18]));
  IBUF \wr_data_IBUF[19]_inst 
       (.I(wr_data[19]),
        .O(wr_data_IBUF[19]));
  IBUF \wr_data_IBUF[1]_inst 
       (.I(wr_data[1]),
        .O(wr_data_IBUF[1]));
  IBUF \wr_data_IBUF[20]_inst 
       (.I(wr_data[20]),
        .O(wr_data_IBUF[20]));
  IBUF \wr_data_IBUF[21]_inst 
       (.I(wr_data[21]),
        .O(wr_data_IBUF[21]));
  IBUF \wr_data_IBUF[22]_inst 
       (.I(wr_data[22]),
        .O(wr_data_IBUF[22]));
  IBUF \wr_data_IBUF[23]_inst 
       (.I(wr_data[23]),
        .O(wr_data_IBUF[23]));
  IBUF \wr_data_IBUF[24]_inst 
       (.I(wr_data[24]),
        .O(wr_data_IBUF[24]));
  IBUF \wr_data_IBUF[25]_inst 
       (.I(wr_data[25]),
        .O(wr_data_IBUF[25]));
  IBUF \wr_data_IBUF[26]_inst 
       (.I(wr_data[26]),
        .O(wr_data_IBUF[26]));
  IBUF \wr_data_IBUF[27]_inst 
       (.I(wr_data[27]),
        .O(wr_data_IBUF[27]));
  IBUF \wr_data_IBUF[28]_inst 
       (.I(wr_data[28]),
        .O(wr_data_IBUF[28]));
  IBUF \wr_data_IBUF[29]_inst 
       (.I(wr_data[29]),
        .O(wr_data_IBUF[29]));
  IBUF \wr_data_IBUF[2]_inst 
       (.I(wr_data[2]),
        .O(wr_data_IBUF[2]));
  IBUF \wr_data_IBUF[30]_inst 
       (.I(wr_data[30]),
        .O(wr_data_IBUF[30]));
  IBUF \wr_data_IBUF[31]_inst 
       (.I(wr_data[31]),
        .O(wr_data_IBUF[31]));
  IBUF \wr_data_IBUF[3]_inst 
       (.I(wr_data[3]),
        .O(wr_data_IBUF[3]));
  IBUF \wr_data_IBUF[4]_inst 
       (.I(wr_data[4]),
        .O(wr_data_IBUF[4]));
  IBUF \wr_data_IBUF[5]_inst 
       (.I(wr_data[5]),
        .O(wr_data_IBUF[5]));
  IBUF \wr_data_IBUF[6]_inst 
       (.I(wr_data[6]),
        .O(wr_data_IBUF[6]));
  IBUF \wr_data_IBUF[7]_inst 
       (.I(wr_data[7]),
        .O(wr_data_IBUF[7]));
  IBUF \wr_data_IBUF[8]_inst 
       (.I(wr_data[8]),
        .O(wr_data_IBUF[8]));
  IBUF \wr_data_IBUF[9]_inst 
       (.I(wr_data[9]),
        .O(wr_data_IBUF[9]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \wr_ptr[0]_i_1 
       (.I0(rst_n_IBUF),
        .I1(fifo_mem_reg_0_7_0_5_i_1_n_0),
        .I2(wr_ptr[0]),
        .O(\wr_ptr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \wr_ptr[1]_i_1 
       (.I0(wr_ptr[0]),
        .I1(rst_n_IBUF),
        .I2(fifo_mem_reg_0_7_0_5_i_1_n_0),
        .I3(wr_ptr[1]),
        .O(\wr_ptr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \wr_ptr[2]_i_1 
       (.I0(wr_ptr[0]),
        .I1(wr_ptr[1]),
        .I2(rst_n_IBUF),
        .I3(fifo_mem_reg_0_7_0_5_i_1_n_0),
        .I4(wr_ptr[2]),
        .O(\wr_ptr[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\wr_ptr[0]_i_1_n_0 ),
        .Q(wr_ptr[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\wr_ptr[1]_i_1_n_0 ),
        .Q(wr_ptr[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \wr_ptr_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\wr_ptr[2]_i_1_n_0 ),
        .Q(wr_ptr[2]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
