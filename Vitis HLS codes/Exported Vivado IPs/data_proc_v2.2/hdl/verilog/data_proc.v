// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="data_proc_data_proc,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=6.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.909000,HLS_SYN_LAT=10,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=85,HLS_SYN_LUT=319,HLS_VERSION=2022_1}" *)

module data_proc (
        ap_clk,
        ap_rst_n,
        in_stream_TDATA,
        in_stream_TVALID,
        in_stream_TREADY,
        in_stream_TKEEP,
        in_stream_TSTRB,
        in_stream_TLAST,
        out_stream_TDATA,
        out_stream_TVALID,
        out_stream_TREADY,
        out_stream_TKEEP,
        out_stream_TSTRB,
        out_stream_TLAST
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst_n;
input  [63:0] in_stream_TDATA;
input   in_stream_TVALID;
output   in_stream_TREADY;
input  [7:0] in_stream_TKEEP;
input  [7:0] in_stream_TSTRB;
input  [0:0] in_stream_TLAST;
output  [63:0] out_stream_TDATA;
output   out_stream_TVALID;
input   out_stream_TREADY;
output  [7:0] out_stream_TKEEP;
output  [7:0] out_stream_TSTRB;
output  [0:0] out_stream_TLAST;

 reg    ap_rst_n_inv;
reg   [3:0] data_count_V;
reg   [3:0] buffer_V_address0;
reg    buffer_V_ce0;
reg    buffer_V_we0;
wire   [63:0] buffer_V_q0;
reg    in_stream_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    out_stream_TDATA_blk_n;
wire   [0:0] icmp_ln1065_fu_144_p2;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
reg   [0:0] icmp_ln1065_reg_183;
wire    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start;
wire    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_done;
wire    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_idle;
wire    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_ready;
wire    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TREADY;
wire   [63:0] grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TDATA;
wire    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID;
wire   [7:0] grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TKEEP;
wire   [7:0] grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TSTRB;
wire   [0:0] grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TLAST;
wire   [3:0] grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_address0;
wire    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_ce0;
reg    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
wire   [63:0] zext_ln50_fu_139_p1;
wire   [3:0] ret_V_1_fu_166_p3;
reg    ap_block_state5_on_subcall_done;
reg    ap_block_state1;
reg    ap_block_state1_io;
wire   [3:0] ret_V_fu_150_p2;
wire   [0:0] icmp_ln1560_fu_155_p2;
wire   [3:0] add_ln1560_fu_161_p2;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    regslice_both_out_stream_V_data_V_U_apdone_blk;
wire    ap_CS_fsm_state6;
wire    regslice_both_in_stream_V_data_V_U_apdone_blk;
wire   [63:0] in_stream_TDATA_int_regslice;
wire    in_stream_TVALID_int_regslice;
reg    in_stream_TREADY_int_regslice;
wire    regslice_both_in_stream_V_data_V_U_ack_in;
wire    regslice_both_in_stream_V_keep_V_U_apdone_blk;
wire   [7:0] in_stream_TKEEP_int_regslice;
wire    regslice_both_in_stream_V_keep_V_U_vld_out;
wire    regslice_both_in_stream_V_keep_V_U_ack_in;
wire    regslice_both_in_stream_V_strb_V_U_apdone_blk;
wire   [7:0] in_stream_TSTRB_int_regslice;
wire    regslice_both_in_stream_V_strb_V_U_vld_out;
wire    regslice_both_in_stream_V_strb_V_U_ack_in;
wire    regslice_both_in_stream_V_last_V_U_apdone_blk;
wire   [0:0] in_stream_TLAST_int_regslice;
wire    regslice_both_in_stream_V_last_V_U_vld_out;
wire    regslice_both_in_stream_V_last_V_U_ack_in;
reg   [63:0] out_stream_TDATA_int_regslice;
reg    out_stream_TVALID_int_regslice;
wire    out_stream_TREADY_int_regslice;
wire    regslice_both_out_stream_V_data_V_U_vld_out;
wire    regslice_both_out_stream_V_keep_V_U_apdone_blk;
reg   [7:0] out_stream_TKEEP_int_regslice;
wire    regslice_both_out_stream_V_keep_V_U_ack_in_dummy;
wire    regslice_both_out_stream_V_keep_V_U_vld_out;
wire    regslice_both_out_stream_V_strb_V_U_apdone_blk;
reg   [7:0] out_stream_TSTRB_int_regslice;
wire    regslice_both_out_stream_V_strb_V_U_ack_in_dummy;
wire    regslice_both_out_stream_V_strb_V_U_vld_out;
wire    regslice_both_out_stream_V_last_V_U_apdone_blk;
reg   [0:0] out_stream_TLAST_int_regslice;
wire    regslice_both_out_stream_V_last_V_U_ack_in_dummy;
wire    regslice_both_out_stream_V_last_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 data_count_V = 4'd0;
#0 ap_CS_fsm = 6'd1;
#0 grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg = 1'b0;
end

data_proc_buffer_V_RAM_AUTO_1R1W #(
    .DataWidth( 64 ),
    .AddressRange( 10 ),
    .AddressWidth( 4 ))
buffer_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(buffer_V_address0),
    .ce0(buffer_V_ce0),
    .we0(buffer_V_we0),
    .d0(in_stream_TDATA_int_regslice),
    .q0(buffer_V_q0)
);

data_proc_data_proc_Pipeline_VITIS_LOOP_67_1 grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start),
    .ap_done(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_done),
    .ap_idle(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_idle),
    .ap_ready(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_ready),
    .out_stream_TREADY(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TREADY),
    .out_stream_TDATA(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TDATA),
    .out_stream_TVALID(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID),
    .out_stream_TKEEP(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TKEEP),
    .out_stream_TSTRB(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TSTRB),
    .out_stream_TLAST(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TLAST),
    .buffer_V_address0(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_address0),
    .buffer_V_ce0(grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_ce0),
    .buffer_V_q0(buffer_V_q0)
);

data_proc_regslice_both #(
    .DataWidth( 64 ))
regslice_both_in_stream_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_stream_TDATA),
    .vld_in(in_stream_TVALID),
    .ack_in(regslice_both_in_stream_V_data_V_U_ack_in),
    .data_out(in_stream_TDATA_int_regslice),
    .vld_out(in_stream_TVALID_int_regslice),
    .ack_out(in_stream_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_stream_V_data_V_U_apdone_blk)
);

data_proc_regslice_both #(
    .DataWidth( 8 ))
regslice_both_in_stream_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_stream_TKEEP),
    .vld_in(in_stream_TVALID),
    .ack_in(regslice_both_in_stream_V_keep_V_U_ack_in),
    .data_out(in_stream_TKEEP_int_regslice),
    .vld_out(regslice_both_in_stream_V_keep_V_U_vld_out),
    .ack_out(in_stream_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_stream_V_keep_V_U_apdone_blk)
);

data_proc_regslice_both #(
    .DataWidth( 8 ))
regslice_both_in_stream_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_stream_TSTRB),
    .vld_in(in_stream_TVALID),
    .ack_in(regslice_both_in_stream_V_strb_V_U_ack_in),
    .data_out(in_stream_TSTRB_int_regslice),
    .vld_out(regslice_both_in_stream_V_strb_V_U_vld_out),
    .ack_out(in_stream_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_stream_V_strb_V_U_apdone_blk)
);

data_proc_regslice_both #(
    .DataWidth( 1 ))
regslice_both_in_stream_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_stream_TLAST),
    .vld_in(in_stream_TVALID),
    .ack_in(regslice_both_in_stream_V_last_V_U_ack_in),
    .data_out(in_stream_TLAST_int_regslice),
    .vld_out(regslice_both_in_stream_V_last_V_U_vld_out),
    .ack_out(in_stream_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_stream_V_last_V_U_apdone_blk)
);

data_proc_regslice_both #(
    .DataWidth( 64 ))
regslice_both_out_stream_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(out_stream_TDATA_int_regslice),
    .vld_in(out_stream_TVALID_int_regslice),
    .ack_in(out_stream_TREADY_int_regslice),
    .data_out(out_stream_TDATA),
    .vld_out(regslice_both_out_stream_V_data_V_U_vld_out),
    .ack_out(out_stream_TREADY),
    .apdone_blk(regslice_both_out_stream_V_data_V_U_apdone_blk)
);

data_proc_regslice_both #(
    .DataWidth( 8 ))
regslice_both_out_stream_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(out_stream_TKEEP_int_regslice),
    .vld_in(out_stream_TVALID_int_regslice),
    .ack_in(regslice_both_out_stream_V_keep_V_U_ack_in_dummy),
    .data_out(out_stream_TKEEP),
    .vld_out(regslice_both_out_stream_V_keep_V_U_vld_out),
    .ack_out(out_stream_TREADY),
    .apdone_blk(regslice_both_out_stream_V_keep_V_U_apdone_blk)
);

data_proc_regslice_both #(
    .DataWidth( 8 ))
regslice_both_out_stream_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(out_stream_TSTRB_int_regslice),
    .vld_in(out_stream_TVALID_int_regslice),
    .ack_in(regslice_both_out_stream_V_strb_V_U_ack_in_dummy),
    .data_out(out_stream_TSTRB),
    .vld_out(regslice_both_out_stream_V_strb_V_U_vld_out),
    .ack_out(out_stream_TREADY),
    .apdone_blk(regslice_both_out_stream_V_strb_V_U_apdone_blk)
);

data_proc_regslice_both #(
    .DataWidth( 1 ))
regslice_both_out_stream_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(out_stream_TLAST_int_regslice),
    .vld_in(out_stream_TVALID_int_regslice),
    .ack_in(regslice_both_out_stream_V_last_V_U_ack_in_dummy),
    .data_out(out_stream_TLAST),
    .vld_out(regslice_both_out_stream_V_last_V_U_vld_out),
    .ack_out(out_stream_TREADY),
    .apdone_blk(regslice_both_out_stream_V_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg <= 1'b1;
        end else if ((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_ready == 1'b1)) begin
            grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state5) & (1'b0 == ap_block_state5_on_subcall_done))) begin
        data_count_V <= ret_V_1_fu_166_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        icmp_ln1065_reg_183 <= icmp_ln1065_fu_144_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_block_state1_io) | (in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((out_stream_TREADY_int_regslice == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((out_stream_TREADY_int_regslice == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_block_state5_on_subcall_done)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b1)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        buffer_V_address0 = zext_ln50_fu_139_p1;
    end else if (((icmp_ln1065_reg_183 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        buffer_V_address0 = grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_address0;
    end else begin
        buffer_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | (in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        buffer_V_ce0 = 1'b1;
    end else if (((icmp_ln1065_reg_183 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        buffer_V_ce0 = grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_ce0;
    end else begin
        buffer_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | (in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        buffer_V_we0 = 1'b1;
    end else begin
        buffer_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        in_stream_TDATA_blk_n = in_stream_TVALID_int_regslice;
    end else begin
        in_stream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state1_io) | (in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        in_stream_TREADY_int_regslice = 1'b1;
    end else begin
        in_stream_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        out_stream_TDATA_blk_n = out_stream_TREADY_int_regslice;
    end else begin
        out_stream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((out_stream_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        out_stream_TDATA_int_regslice = 64'd4272816128;
    end else if ((~((in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0))) & (icmp_ln1065_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        out_stream_TDATA_int_regslice = 64'd18446744073709486080;
    end else if (((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID == 1'b1) & (icmp_ln1065_reg_183 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        out_stream_TDATA_int_regslice = grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TDATA;
    end else begin
        out_stream_TDATA_int_regslice = 'bx;
    end
end

always @ (*) begin
    if (((~((in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0))) & (icmp_ln1065_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((out_stream_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state2)))) begin
        out_stream_TKEEP_int_regslice = 8'd255;
    end else if (((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID == 1'b1) & (icmp_ln1065_reg_183 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        out_stream_TKEEP_int_regslice = grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TKEEP;
    end else begin
        out_stream_TKEEP_int_regslice = 'bx;
    end
end

always @ (*) begin
    if (((~((in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0))) & (icmp_ln1065_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((out_stream_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state2)))) begin
        out_stream_TLAST_int_regslice = 1'd0;
    end else if (((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID == 1'b1) & (icmp_ln1065_reg_183 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        out_stream_TLAST_int_regslice = grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TLAST;
    end else begin
        out_stream_TLAST_int_regslice = 'bx;
    end
end

always @ (*) begin
    if (((~((in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0))) & (icmp_ln1065_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((out_stream_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state2)))) begin
        out_stream_TSTRB_int_regslice = 8'd0;
    end else if (((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID == 1'b1) & (icmp_ln1065_reg_183 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        out_stream_TSTRB_int_regslice = grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TSTRB;
    end else begin
        out_stream_TSTRB_int_regslice = 'bx;
    end
end

always @ (*) begin
    if ((((out_stream_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state2)) | (~((1'b1 == ap_block_state1_io) | (in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0))) & (icmp_ln1065_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        out_stream_TVALID_int_regslice = 1'b1;
    end else if (((icmp_ln1065_reg_183 == 1'd1) & (1'b1 == ap_CS_fsm_state5))) begin
        out_stream_TVALID_int_regslice = grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID;
    end else begin
        out_stream_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((1'b1 == ap_block_state1_io) | (in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0))) & (icmp_ln1065_fu_144_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else if ((~((1'b1 == ap_block_state1_io) | (in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0))) & (icmp_ln1065_fu_144_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((out_stream_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((out_stream_TREADY_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (1'b0 == ap_block_state5_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln1560_fu_161_p2 = (data_count_V + 4'd7);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_block_state1 = ((in_stream_TVALID_int_regslice == 1'b0) | ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state1_io = ((icmp_ln1065_fu_144_p2 == 1'd1) & (out_stream_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state5_on_subcall_done = ((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_done == 1'b0) & (icmp_ln1065_reg_183 == 1'd1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start = grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg;

assign grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TREADY = (out_stream_TREADY_int_regslice & ap_CS_fsm_state5);

assign icmp_ln1065_fu_144_p2 = ((data_count_V == 4'd9) ? 1'b1 : 1'b0);

assign icmp_ln1560_fu_155_p2 = ((ret_V_fu_150_p2 < 4'd10) ? 1'b1 : 1'b0);

assign in_stream_TREADY = regslice_both_in_stream_V_data_V_U_ack_in;

assign out_stream_TVALID = regslice_both_out_stream_V_data_V_U_vld_out;

assign ret_V_1_fu_166_p3 = ((icmp_ln1560_fu_155_p2[0:0] == 1'b1) ? ret_V_fu_150_p2 : add_ln1560_fu_161_p2);

assign ret_V_fu_150_p2 = (data_count_V + 4'd1);

assign zext_ln50_fu_139_p1 = data_count_V;


reg find_kernel_block = 0;
// synthesis translate_off
`include "data_proc_hls_deadlock_kernel_monitor_top.vh"
// synthesis translate_on

endmodule //data_proc

