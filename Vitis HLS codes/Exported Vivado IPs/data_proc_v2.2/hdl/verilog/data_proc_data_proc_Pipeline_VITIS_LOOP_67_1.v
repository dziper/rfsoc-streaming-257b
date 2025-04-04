// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module data_proc_data_proc_Pipeline_VITIS_LOOP_67_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        out_stream_TREADY,
        out_stream_TDATA,
        out_stream_TVALID,
        out_stream_TKEEP,
        out_stream_TSTRB,
        out_stream_TLAST,
        buffer_V_address0,
        buffer_V_ce0,
        buffer_V_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   out_stream_TREADY;
output  [63:0] out_stream_TDATA;
output   out_stream_TVALID;
output  [7:0] out_stream_TKEEP;
output  [7:0] out_stream_TSTRB;
output  [0:0] out_stream_TLAST;
output  [3:0] buffer_V_address0;
output   buffer_V_ce0;
input  [63:0] buffer_V_q0;

reg ap_idle;
reg out_stream_TVALID;
reg buffer_V_ce0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] icmp_ln67_reg_149;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state2_io;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln67_fu_108_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    out_stream_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] tmp_last_V_fu_131_p2;
reg   [0:0] tmp_last_V_reg_158;
reg   [0:0] ap_phi_mux_output_word_last_V_phi_fu_93_p4;
wire    ap_loop_init;
wire   [63:0] i_cast_fu_120_p1;
reg   [3:0] i_fu_54;
wire   [3:0] add_ln67_fu_114_p2;
reg   [3:0] ap_sig_allocacmp_i_1;
reg    ap_block_pp0_stage0_01001;
wire   [0:0] icmp_ln69_fu_125_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_169;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

data_proc_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln67_fu_108_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_54 <= add_ln67_fu_114_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_54 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln67_reg_149 <= icmp_ln67_fu_108_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln67_fu_108_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_last_V_reg_158 <= tmp_last_V_fu_131_p2;
    end
end

always @ (*) begin
    if (((icmp_ln67_fu_108_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_169)) begin
            ap_phi_mux_output_word_last_V_phi_fu_93_p4 = tmp_last_V_reg_158;
        end else if ((ap_loop_init == 1'b1)) begin
            ap_phi_mux_output_word_last_V_phi_fu_93_p4 = 1'd0;
        end else begin
            ap_phi_mux_output_word_last_V_phi_fu_93_p4 = tmp_last_V_reg_158;
        end
    end else begin
        ap_phi_mux_output_word_last_V_phi_fu_93_p4 = tmp_last_V_reg_158;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_1 = 4'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_54;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        buffer_V_ce0 = 1'b1;
    end else begin
        buffer_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln67_reg_149 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_TDATA_blk_n = out_stream_TREADY;
    end else begin
        out_stream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln67_reg_149 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_stream_TVALID = 1'b1;
    end else begin
        out_stream_TVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln67_fu_114_p2 = (ap_sig_allocacmp_i_1 + 4'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((icmp_ln67_reg_149 == 1'd0) & (out_stream_TREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((icmp_ln67_reg_149 == 1'd0) & (out_stream_TREADY == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((icmp_ln67_reg_149 == 1'd0) & (out_stream_TREADY == 1'b0))));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_io = ((icmp_ln67_reg_149 == 1'd0) & (out_stream_TREADY == 1'b0));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((icmp_ln67_reg_149 == 1'd0) & (out_stream_TREADY == 1'b0));
end

always @ (*) begin
    ap_condition_169 = ((1'b0 == ap_block_pp0_stage0) & (icmp_ln67_reg_149 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign buffer_V_address0 = i_cast_fu_120_p1;

assign i_cast_fu_120_p1 = ap_sig_allocacmp_i_1;

assign icmp_ln67_fu_108_p2 = ((ap_sig_allocacmp_i_1 == 4'd10) ? 1'b1 : 1'b0);

assign icmp_ln69_fu_125_p2 = ((ap_sig_allocacmp_i_1 == 4'd9) ? 1'b1 : 1'b0);

assign out_stream_TDATA = buffer_V_q0;

assign out_stream_TKEEP = 8'd255;

assign out_stream_TLAST = tmp_last_V_reg_158;

assign out_stream_TSTRB = 8'd0;

assign tmp_last_V_fu_131_p2 = (icmp_ln69_fu_125_p2 | ap_phi_mux_output_word_last_V_phi_fu_93_p4);

endmodule //data_proc_data_proc_Pipeline_VITIS_LOOP_67_1
