// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Jul 19 21:47:44 2021
// Host        : LiuYang-Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               E:/Project/Doing/ProgrammingExercise/HDLBits/00-MyPractice/asyn_FIFO/asyn_FIFO.sim/sim_1/synth/func/xsim/fifo_async_tb_func_synth.v
// Design      : fifo_async
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ASIZE = "4" *) (* DSIZE = "8" *) 
(* NotValidForBitStream *)
module fifo_async
   (rclk,
    rrst_n,
    rq,
    wclk,
    wrst_n,
    wq,
    write_data,
    read_data,
    wfull,
    rempty);
  input rclk;
  input rrst_n;
  input rq;
  input wclk;
  input wrst_n;
  input wq;
  input [7:0]write_data;
  output [7:0]read_data;
  output wfull;
  output rempty;

  wire p_0_in;
  wire rclk;
  wire rclk_IBUF;
  wire rclk_IBUF_BUFG;
  wire [7:0]read_data;
  wire [7:0]read_data_OBUF;
  wire rempty;
  wire rempty_OBUF;
  wire [3:0]rptr;
  wire rptr_empty_n_1;
  wire rptr_empty_n_10;
  wire rptr_empty_n_2;
  wire rptr_empty_n_7;
  wire rptr_empty_n_8;
  wire rptr_empty_n_9;
  wire rq;
  wire [4:0]rq2_wptr;
  wire rq_IBUF;
  wire rrst_n;
  wire rrst_n_IBUF;
  wire wclk;
  wire wclk_IBUF;
  wire wclk_IBUF_BUFG;
  wire wfull;
  wire wfull_OBUF;
  wire [3:0]wptr;
  wire wptr_full_n_1;
  wire wptr_full_n_10;
  wire wptr_full_n_11;
  wire wptr_full_n_2;
  wire wptr_full_n_8;
  wire wptr_full_n_9;
  wire wq;
  wire [4:0]wq2_rptr;
  wire wq_IBUF;
  wire [7:0]write_data;
  wire [7:0]write_data_IBUF;
  wire wrst_n;
  wire wrst_n_IBUF;

  fifomem fifomem
       (.out({rptr_empty_n_7,rptr_empty_n_8,rptr_empty_n_9,rptr_empty_n_10}),
        .p_0_in(p_0_in),
        .read_data(read_data_OBUF),
        .\read_data[7] ({wptr_full_n_8,wptr_full_n_9,wptr_full_n_10,wptr_full_n_11}),
        .wclk(wclk_IBUF_BUFG),
        .write_data(write_data_IBUF));
  BUFG rclk_IBUF_BUFG_inst
       (.I(rclk_IBUF),
        .O(rclk_IBUF_BUFG));
  IBUF rclk_IBUF_inst
       (.I(rclk),
        .O(rclk_IBUF));
  OBUF \read_data_OBUF[0]_inst 
       (.I(read_data_OBUF[0]),
        .O(read_data[0]));
  OBUF \read_data_OBUF[1]_inst 
       (.I(read_data_OBUF[1]),
        .O(read_data[1]));
  OBUF \read_data_OBUF[2]_inst 
       (.I(read_data_OBUF[2]),
        .O(read_data[2]));
  OBUF \read_data_OBUF[3]_inst 
       (.I(read_data_OBUF[3]),
        .O(read_data[3]));
  OBUF \read_data_OBUF[4]_inst 
       (.I(read_data_OBUF[4]),
        .O(read_data[4]));
  OBUF \read_data_OBUF[5]_inst 
       (.I(read_data_OBUF[5]),
        .O(read_data[5]));
  OBUF \read_data_OBUF[6]_inst 
       (.I(read_data_OBUF[6]),
        .O(read_data[6]));
  OBUF \read_data_OBUF[7]_inst 
       (.I(read_data_OBUF[7]),
        .O(read_data[7]));
  OBUF rempty_OBUF_inst
       (.I(rempty_OBUF),
        .O(rempty));
  rptr_empty rptr_empty
       (.CLK(rclk_IBUF_BUFG),
        .Q(rptr),
        .out({rptr_empty_n_7,rptr_empty_n_8,rptr_empty_n_9,rptr_empty_n_10}),
        .\rbin_reg[4]_0 (rptr_empty_n_2),
        .rempty_OBUF(rempty_OBUF),
        .rempty_reg_0(rq2_wptr),
        .rq_IBUF(rq_IBUF),
        .rrst_n(rptr_empty_n_1),
        .rrst_n_IBUF(rrst_n_IBUF));
  IBUF rq_IBUF_inst
       (.I(rq),
        .O(rq_IBUF));
  IBUF rrst_n_IBUF_inst
       (.I(rrst_n),
        .O(rrst_n_IBUF));
  sync_r2w sync_r2w
       (.CLK(wclk_IBUF_BUFG),
        .D({rptr_empty_n_2,rptr}),
        .Q(wq2_rptr),
        .\wq1_rptr_reg[0]_0 (wptr_full_n_1));
  sync_w2r sync_w2r
       (.CLK(rclk_IBUF_BUFG),
        .Q(wptr),
        .\rq1_rptr_reg[4]_0 (wptr_full_n_2),
        .\rq2_wptr_reg[0]_0 (rptr_empty_n_1),
        .\rq2_wptr_reg[4]_0 (rq2_wptr));
  BUFG wclk_IBUF_BUFG_inst
       (.I(wclk_IBUF),
        .O(wclk_IBUF_BUFG));
  IBUF wclk_IBUF_inst
       (.I(wclk),
        .O(wclk_IBUF));
  OBUF wfull_OBUF_inst
       (.I(wfull_OBUF),
        .O(wfull));
  wptr_full wptr_full
       (.CLK(wclk_IBUF_BUFG),
        .Q(wptr),
        .out({wptr_full_n_8,wptr_full_n_9,wptr_full_n_10,wptr_full_n_11}),
        .p_0_in(p_0_in),
        .\wbin_reg[4]_0 (wptr_full_n_2),
        .wfull_OBUF(wfull_OBUF),
        .wfull_reg_0(wq2_rptr),
        .wq_IBUF(wq_IBUF),
        .wrst_n(wptr_full_n_1),
        .wrst_n_IBUF(wrst_n_IBUF));
  IBUF wq_IBUF_inst
       (.I(wq),
        .O(wq_IBUF));
  IBUF \write_data_IBUF[0]_inst 
       (.I(write_data[0]),
        .O(write_data_IBUF[0]));
  IBUF \write_data_IBUF[1]_inst 
       (.I(write_data[1]),
        .O(write_data_IBUF[1]));
  IBUF \write_data_IBUF[2]_inst 
       (.I(write_data[2]),
        .O(write_data_IBUF[2]));
  IBUF \write_data_IBUF[3]_inst 
       (.I(write_data[3]),
        .O(write_data_IBUF[3]));
  IBUF \write_data_IBUF[4]_inst 
       (.I(write_data[4]),
        .O(write_data_IBUF[4]));
  IBUF \write_data_IBUF[5]_inst 
       (.I(write_data[5]),
        .O(write_data_IBUF[5]));
  IBUF \write_data_IBUF[6]_inst 
       (.I(write_data[6]),
        .O(write_data_IBUF[6]));
  IBUF \write_data_IBUF[7]_inst 
       (.I(write_data[7]),
        .O(write_data_IBUF[7]));
  IBUF wrst_n_IBUF_inst
       (.I(wrst_n),
        .O(wrst_n_IBUF));
endmodule

module fifomem
   (read_data,
    wclk,
    p_0_in,
    write_data,
    out,
    \read_data[7] );
  output [7:0]read_data;
  input wclk;
  input p_0_in;
  input [7:0]write_data;
  input [3:0]out;
  input [3:0]\read_data[7] ;

  wire [3:0]out;
  wire p_0_in;
  wire [7:0]read_data;
  wire [3:0]\read_data[7] ;
  wire wclk;
  wire [7:0]write_data;
  wire [1:0]NLW_mem_reg_0_15_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_15_6_7_DOB_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_15_6_7_DOC_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_15_6_7_DOD_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    mem_reg_0_15_0_5
       (.ADDRA({1'b0,out}),
        .ADDRB({1'b0,out}),
        .ADDRC({1'b0,out}),
        .ADDRD({1'b0,\read_data[7] }),
        .DIA(write_data[1:0]),
        .DIB(write_data[3:2]),
        .DIC(write_data[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(read_data[1:0]),
        .DOB(read_data[3:2]),
        .DOC(read_data[5:4]),
        .DOD(NLW_mem_reg_0_15_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(wclk),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "7" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    mem_reg_0_15_6_7
       (.ADDRA({1'b0,out}),
        .ADDRB({1'b0,out}),
        .ADDRC({1'b0,out}),
        .ADDRD({1'b0,\read_data[7] }),
        .DIA(write_data[7:6]),
        .DIB({1'b0,1'b0}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(read_data[7:6]),
        .DOB(NLW_mem_reg_0_15_6_7_DOB_UNCONNECTED[1:0]),
        .DOC(NLW_mem_reg_0_15_6_7_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_mem_reg_0_15_6_7_DOD_UNCONNECTED[1:0]),
        .WCLK(wclk),
        .WE(p_0_in));
endmodule

module rptr_empty
   (rempty_OBUF,
    rrst_n,
    \rbin_reg[4]_0 ,
    Q,
    out,
    CLK,
    rrst_n_IBUF,
    rempty_reg_0,
    rq_IBUF);
  output rempty_OBUF;
  output rrst_n;
  output \rbin_reg[4]_0 ;
  output [3:0]Q;
  output [3:0]out;
  input CLK;
  input rrst_n_IBUF;
  input [4:0]rempty_reg_0;
  input rq_IBUF;

  wire CLK;
  wire [3:0]Q;
  wire [3:0]out;
  wire \rbin_reg[4]_0 ;
  wire [4:4]rbinnext;
  wire [3:0]rbinnext__0;
  wire rempty_OBUF;
  wire rempty_i_2_n_0;
  wire [4:0]rempty_reg_0;
  wire rempty_val;
  wire [3:0]rgraynext;
  wire \rptr[3]_i_3_n_0 ;
  wire rq_IBUF;
  wire rrst_n;
  wire rrst_n_IBUF;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \rbin[0]_i_1 
       (.I0(out[0]),
        .I1(rempty_OBUF),
        .I2(rq_IBUF),
        .O(rbinnext__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hF708)) 
    \rbin[1]_i_1 
       (.I0(out[0]),
        .I1(rq_IBUF),
        .I2(rempty_OBUF),
        .I3(out[1]),
        .O(rbinnext__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hBFFF4000)) 
    \rbin[2]_i_1 
       (.I0(rempty_OBUF),
        .I1(rq_IBUF),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[2]),
        .O(rbinnext__0[2]));
  LUT6 #(
    .INIT(64'hFF7FFFFF00800000)) 
    \rbin[3]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(rq_IBUF),
        .I3(rempty_OBUF),
        .I4(out[2]),
        .I5(out[3]),
        .O(rbinnext__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \rbin[4]_i_1 
       (.I0(\rptr[3]_i_3_n_0 ),
        .I1(out[3]),
        .I2(\rbin_reg[4]_0 ),
        .O(rbinnext));
  FDCE #(
    .INIT(1'b0)) 
    \rbin_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rrst_n),
        .D(rbinnext__0[0]),
        .Q(out[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rbin_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rrst_n),
        .D(rbinnext__0[1]),
        .Q(out[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rbin_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rrst_n),
        .D(rbinnext__0[2]),
        .Q(out[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rbin_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rrst_n),
        .D(rbinnext__0[3]),
        .Q(out[3]));
  FDCE #(
    .INIT(1'b0)) 
    \rbin_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rrst_n),
        .D(rbinnext),
        .Q(\rbin_reg[4]_0 ));
  LUT6 #(
    .INIT(64'h0480400840088004)) 
    rempty_i_1
       (.I0(rempty_reg_0[3]),
        .I1(rempty_i_2_n_0),
        .I2(rempty_reg_0[4]),
        .I3(\rbin_reg[4]_0 ),
        .I4(out[3]),
        .I5(\rptr[3]_i_3_n_0 ),
        .O(rempty_val));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    rempty_i_2
       (.I0(rgraynext[0]),
        .I1(rempty_reg_0[0]),
        .I2(rempty_reg_0[2]),
        .I3(rgraynext[2]),
        .I4(rempty_reg_0[1]),
        .I5(rgraynext[1]),
        .O(rempty_i_2_n_0));
  FDPE #(
    .INIT(1'b1)) 
    rempty_reg
       (.C(CLK),
        .CE(1'b1),
        .D(rempty_val),
        .PRE(rrst_n),
        .Q(rempty_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h559A)) 
    \rptr[0]_i_1 
       (.I0(out[1]),
        .I1(rempty_OBUF),
        .I2(rq_IBUF),
        .I3(out[0]),
        .O(rgraynext[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h66665666)) 
    \rptr[1]_i_1 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(rq_IBUF),
        .I4(rempty_OBUF),
        .O(rgraynext[1]));
  LUT6 #(
    .INIT(64'h6566666666666666)) 
    \rptr[2]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(rempty_OBUF),
        .I3(rq_IBUF),
        .I4(out[0]),
        .I5(out[1]),
        .O(rgraynext[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h56)) 
    \rptr[3]_i_1 
       (.I0(\rbin_reg[4]_0 ),
        .I1(out[3]),
        .I2(\rptr[3]_i_3_n_0 ),
        .O(rgraynext[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \rptr[3]_i_2 
       (.I0(rrst_n_IBUF),
        .O(rrst_n));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \rptr[3]_i_3 
       (.I0(out[2]),
        .I1(rempty_OBUF),
        .I2(rq_IBUF),
        .I3(out[0]),
        .I4(out[1]),
        .O(\rptr[3]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rrst_n),
        .D(rgraynext[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rrst_n),
        .D(rgraynext[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rrst_n),
        .D(rgraynext[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rptr_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(rrst_n),
        .D(rgraynext[3]),
        .Q(Q[3]));
endmodule

module sync_r2w
   (Q,
    D,
    CLK,
    \wq1_rptr_reg[0]_0 );
  output [4:0]Q;
  input [4:0]D;
  input CLK;
  input \wq1_rptr_reg[0]_0 ;

  wire CLK;
  wire [4:0]D;
  wire [4:0]Q;
  wire [4:0]wq1_rptr;
  wire \wq1_rptr_reg[0]_0 ;

  FDCE #(
    .INIT(1'b0)) 
    \wq1_rptr_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\wq1_rptr_reg[0]_0 ),
        .D(D[0]),
        .Q(wq1_rptr[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wq1_rptr_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\wq1_rptr_reg[0]_0 ),
        .D(D[1]),
        .Q(wq1_rptr[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wq1_rptr_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\wq1_rptr_reg[0]_0 ),
        .D(D[2]),
        .Q(wq1_rptr[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wq1_rptr_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\wq1_rptr_reg[0]_0 ),
        .D(D[3]),
        .Q(wq1_rptr[3]));
  FDCE #(
    .INIT(1'b0)) 
    \wq1_rptr_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\wq1_rptr_reg[0]_0 ),
        .D(D[4]),
        .Q(wq1_rptr[4]));
  FDCE #(
    .INIT(1'b0)) 
    \wq2_rptr_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\wq1_rptr_reg[0]_0 ),
        .D(wq1_rptr[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wq2_rptr_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\wq1_rptr_reg[0]_0 ),
        .D(wq1_rptr[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wq2_rptr_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\wq1_rptr_reg[0]_0 ),
        .D(wq1_rptr[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wq2_rptr_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\wq1_rptr_reg[0]_0 ),
        .D(wq1_rptr[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \wq2_rptr_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\wq1_rptr_reg[0]_0 ),
        .D(wq1_rptr[4]),
        .Q(Q[4]));
endmodule

module sync_w2r
   (\rq2_wptr_reg[4]_0 ,
    \rq1_rptr_reg[4]_0 ,
    CLK,
    \rq2_wptr_reg[0]_0 ,
    Q);
  output [4:0]\rq2_wptr_reg[4]_0 ;
  input \rq1_rptr_reg[4]_0 ;
  input CLK;
  input \rq2_wptr_reg[0]_0 ;
  input [3:0]Q;

  wire CLK;
  wire [3:0]Q;
  wire [4:0]rq1_rptr;
  wire \rq1_rptr_reg[4]_0 ;
  wire \rq2_wptr_reg[0]_0 ;
  wire [4:0]\rq2_wptr_reg[4]_0 ;

  FDCE #(
    .INIT(1'b0)) 
    \rq1_rptr_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\rq2_wptr_reg[0]_0 ),
        .D(Q[0]),
        .Q(rq1_rptr[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rq1_rptr_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\rq2_wptr_reg[0]_0 ),
        .D(Q[1]),
        .Q(rq1_rptr[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rq1_rptr_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\rq2_wptr_reg[0]_0 ),
        .D(Q[2]),
        .Q(rq1_rptr[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rq1_rptr_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\rq2_wptr_reg[0]_0 ),
        .D(Q[3]),
        .Q(rq1_rptr[3]));
  FDCE #(
    .INIT(1'b0)) 
    \rq1_rptr_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\rq2_wptr_reg[0]_0 ),
        .D(\rq1_rptr_reg[4]_0 ),
        .Q(rq1_rptr[4]));
  FDCE #(
    .INIT(1'b0)) 
    \rq2_wptr_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\rq2_wptr_reg[0]_0 ),
        .D(rq1_rptr[0]),
        .Q(\rq2_wptr_reg[4]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \rq2_wptr_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\rq2_wptr_reg[0]_0 ),
        .D(rq1_rptr[1]),
        .Q(\rq2_wptr_reg[4]_0 [1]));
  FDCE #(
    .INIT(1'b0)) 
    \rq2_wptr_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\rq2_wptr_reg[0]_0 ),
        .D(rq1_rptr[2]),
        .Q(\rq2_wptr_reg[4]_0 [2]));
  FDCE #(
    .INIT(1'b0)) 
    \rq2_wptr_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\rq2_wptr_reg[0]_0 ),
        .D(rq1_rptr[3]),
        .Q(\rq2_wptr_reg[4]_0 [3]));
  FDCE #(
    .INIT(1'b0)) 
    \rq2_wptr_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(\rq2_wptr_reg[0]_0 ),
        .D(rq1_rptr[4]),
        .Q(\rq2_wptr_reg[4]_0 [4]));
endmodule

module wptr_full
   (wfull_OBUF,
    wrst_n,
    \wbin_reg[4]_0 ,
    p_0_in,
    Q,
    out,
    CLK,
    wrst_n_IBUF,
    wq_IBUF,
    wfull_reg_0);
  output wfull_OBUF;
  output wrst_n;
  output \wbin_reg[4]_0 ;
  output p_0_in;
  output [3:0]Q;
  output [3:0]out;
  input CLK;
  input wrst_n_IBUF;
  input wq_IBUF;
  input [4:0]wfull_reg_0;

  wire CLK;
  wire [3:0]Q;
  wire [3:0]out;
  wire p_0_in;
  wire \wbin_reg[4]_0 ;
  wire [4:4]wbinnext;
  wire [3:0]wbinnext__0;
  wire wfull_OBUF;
  wire wfull_i_2_n_0;
  wire wfull_i_3_n_0;
  wire [4:0]wfull_reg_0;
  wire wfull_val;
  wire [3:0]wgraynext;
  wire wq_IBUF;
  wire wrst_n;
  wire wrst_n_IBUF;

  LUT2 #(
    .INIT(4'h2)) 
    mem_reg_0_15_0_5_i_1
       (.I0(wq_IBUF),
        .I1(wfull_OBUF),
        .O(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \wbin[0]_i_1 
       (.I0(out[0]),
        .I1(wfull_OBUF),
        .I2(wq_IBUF),
        .O(wbinnext__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hF708)) 
    \wbin[1]_i_1 
       (.I0(out[0]),
        .I1(wq_IBUF),
        .I2(wfull_OBUF),
        .I3(out[1]),
        .O(wbinnext__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hBFFF4000)) 
    \wbin[2]_i_1 
       (.I0(wfull_OBUF),
        .I1(wq_IBUF),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[2]),
        .O(wbinnext__0[2]));
  LUT6 #(
    .INIT(64'hFF7FFFFF00800000)) 
    \wbin[3]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(wq_IBUF),
        .I3(wfull_OBUF),
        .I4(out[2]),
        .I5(out[3]),
        .O(wbinnext__0[3]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \wbin[4]_i_1 
       (.I0(out[2]),
        .I1(p_0_in),
        .I2(out[0]),
        .I3(out[1]),
        .I4(out[3]),
        .I5(\wbin_reg[4]_0 ),
        .O(wbinnext));
  FDCE #(
    .INIT(1'b0)) 
    \wbin_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(wrst_n),
        .D(wbinnext__0[0]),
        .Q(out[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wbin_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(wrst_n),
        .D(wbinnext__0[1]),
        .Q(out[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wbin_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(wrst_n),
        .D(wbinnext__0[2]),
        .Q(out[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wbin_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(wrst_n),
        .D(wbinnext__0[3]),
        .Q(out[3]));
  FDCE #(
    .INIT(1'b0)) 
    \wbin_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(wrst_n),
        .D(wbinnext),
        .Q(\wbin_reg[4]_0 ));
  LUT6 #(
    .INIT(64'h8004084008400480)) 
    wfull_i_1
       (.I0(wfull_reg_0[3]),
        .I1(wfull_i_2_n_0),
        .I2(wfull_reg_0[4]),
        .I3(\wbin_reg[4]_0 ),
        .I4(out[3]),
        .I5(wfull_i_3_n_0),
        .O(wfull_val));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    wfull_i_2
       (.I0(wgraynext[0]),
        .I1(wfull_reg_0[0]),
        .I2(wfull_reg_0[2]),
        .I3(wgraynext[2]),
        .I4(wfull_reg_0[1]),
        .I5(wgraynext[1]),
        .O(wfull_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    wfull_i_3
       (.I0(out[2]),
        .I1(wfull_OBUF),
        .I2(wq_IBUF),
        .I3(out[0]),
        .I4(out[1]),
        .O(wfull_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    wfull_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(wrst_n),
        .D(wfull_val),
        .Q(wfull_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h559A)) 
    \wptr[0]_i_1 
       (.I0(out[1]),
        .I1(wfull_OBUF),
        .I2(wq_IBUF),
        .I3(out[0]),
        .O(wgraynext[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h66665666)) 
    \wptr[1]_i_1 
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(wq_IBUF),
        .I4(wfull_OBUF),
        .O(wgraynext[1]));
  LUT6 #(
    .INIT(64'h6566666666666666)) 
    \wptr[2]_i_1 
       (.I0(out[3]),
        .I1(out[2]),
        .I2(wfull_OBUF),
        .I3(wq_IBUF),
        .I4(out[0]),
        .I5(out[1]),
        .O(wgraynext[2]));
  LUT6 #(
    .INIT(64'h5666666666666666)) 
    \wptr[3]_i_1 
       (.I0(\wbin_reg[4]_0 ),
        .I1(out[3]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(p_0_in),
        .I5(out[2]),
        .O(wgraynext[3]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(wrst_n),
        .D(wgraynext[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(wrst_n),
        .D(wgraynext[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(wrst_n),
        .D(wgraynext[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wptr_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(wrst_n),
        .D(wgraynext[3]),
        .Q(Q[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \wq1_rptr[4]_i_1 
       (.I0(wrst_n_IBUF),
        .O(wrst_n));
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
