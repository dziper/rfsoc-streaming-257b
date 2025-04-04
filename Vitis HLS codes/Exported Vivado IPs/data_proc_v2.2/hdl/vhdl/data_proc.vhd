-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity data_proc is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    in_stream_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    in_stream_TVALID : IN STD_LOGIC;
    in_stream_TREADY : OUT STD_LOGIC;
    in_stream_TKEEP : IN STD_LOGIC_VECTOR (7 downto 0);
    in_stream_TSTRB : IN STD_LOGIC_VECTOR (7 downto 0);
    in_stream_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    out_stream_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    out_stream_TVALID : OUT STD_LOGIC;
    out_stream_TREADY : IN STD_LOGIC;
    out_stream_TKEEP : OUT STD_LOGIC_VECTOR (7 downto 0);
    out_stream_TSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    out_stream_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of data_proc is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "data_proc_data_proc,hls_ip_2022_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=6.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.909000,HLS_SYN_LAT=10,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=85,HLS_SYN_LUT=319,HLS_VERSION=2022_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv64_FFFFFFFFFFFF0000 : STD_LOGIC_VECTOR (63 downto 0) := "1111111111111111111111111111111111111111111111110000000000000000";
    constant ap_const_lv64_FEAE0000 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000011111110101011100000000000000000";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv4_9 : STD_LOGIC_VECTOR (3 downto 0) := "1001";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv4_A : STD_LOGIC_VECTOR (3 downto 0) := "1010";
    constant ap_const_lv4_7 : STD_LOGIC_VECTOR (3 downto 0) := "0111";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";

    signal ap_rst_n_inv : STD_LOGIC;
    signal data_count_V : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal buffer_V_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal buffer_V_ce0 : STD_LOGIC;
    signal buffer_V_we0 : STD_LOGIC;
    signal buffer_V_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal in_stream_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal out_stream_TDATA_blk_n : STD_LOGIC;
    signal icmp_ln1065_fu_144_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal icmp_ln1065_reg_183 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start : STD_LOGIC;
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_done : STD_LOGIC;
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_idle : STD_LOGIC;
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_ready : STD_LOGIC;
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TREADY : STD_LOGIC;
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TDATA : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID : STD_LOGIC;
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TKEEP : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TSTRB : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_ce0 : STD_LOGIC;
    signal grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal zext_ln50_fu_139_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ret_V_1_fu_166_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_block_state5_on_subcall_done : BOOLEAN;
    signal ap_block_state1 : BOOLEAN;
    signal ap_block_state1_io : BOOLEAN;
    signal ret_V_fu_150_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal icmp_ln1560_fu_155_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln1560_fu_161_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal regslice_both_out_stream_V_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal regslice_both_in_stream_V_data_V_U_apdone_blk : STD_LOGIC;
    signal in_stream_TDATA_int_regslice : STD_LOGIC_VECTOR (63 downto 0);
    signal in_stream_TVALID_int_regslice : STD_LOGIC;
    signal in_stream_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_in_stream_V_data_V_U_ack_in : STD_LOGIC;
    signal regslice_both_in_stream_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal in_stream_TKEEP_int_regslice : STD_LOGIC_VECTOR (7 downto 0);
    signal regslice_both_in_stream_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_in_stream_V_keep_V_U_ack_in : STD_LOGIC;
    signal regslice_both_in_stream_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal in_stream_TSTRB_int_regslice : STD_LOGIC_VECTOR (7 downto 0);
    signal regslice_both_in_stream_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_in_stream_V_strb_V_U_ack_in : STD_LOGIC;
    signal regslice_both_in_stream_V_last_V_U_apdone_blk : STD_LOGIC;
    signal in_stream_TLAST_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_in_stream_V_last_V_U_vld_out : STD_LOGIC;
    signal regslice_both_in_stream_V_last_V_U_ack_in : STD_LOGIC;
    signal out_stream_TDATA_int_regslice : STD_LOGIC_VECTOR (63 downto 0);
    signal out_stream_TVALID_int_regslice : STD_LOGIC;
    signal out_stream_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_out_stream_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_out_stream_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal out_stream_TKEEP_int_regslice : STD_LOGIC_VECTOR (7 downto 0);
    signal regslice_both_out_stream_V_keep_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_out_stream_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_out_stream_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal out_stream_TSTRB_int_regslice : STD_LOGIC_VECTOR (7 downto 0);
    signal regslice_both_out_stream_V_strb_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_out_stream_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_out_stream_V_last_V_U_apdone_blk : STD_LOGIC;
    signal out_stream_TLAST_int_regslice : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_out_stream_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_out_stream_V_last_V_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component data_proc_data_proc_Pipeline_VITIS_LOOP_67_1 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        out_stream_TREADY : IN STD_LOGIC;
        out_stream_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
        out_stream_TVALID : OUT STD_LOGIC;
        out_stream_TKEEP : OUT STD_LOGIC_VECTOR (7 downto 0);
        out_stream_TSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
        out_stream_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
        buffer_V_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
        buffer_V_ce0 : OUT STD_LOGIC;
        buffer_V_q0 : IN STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component data_proc_buffer_V_RAM_AUTO_1R1W IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (3 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (63 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component data_proc_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    buffer_V_U : component data_proc_buffer_V_RAM_AUTO_1R1W
    generic map (
        DataWidth => 64,
        AddressRange => 10,
        AddressWidth => 4)
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        address0 => buffer_V_address0,
        ce0 => buffer_V_ce0,
        we0 => buffer_V_we0,
        d0 => in_stream_TDATA_int_regslice,
        q0 => buffer_V_q0);

    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116 : component data_proc_data_proc_Pipeline_VITIS_LOOP_67_1
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start,
        ap_done => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_done,
        ap_idle => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_idle,
        ap_ready => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_ready,
        out_stream_TREADY => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TREADY,
        out_stream_TDATA => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TDATA,
        out_stream_TVALID => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID,
        out_stream_TKEEP => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TKEEP,
        out_stream_TSTRB => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TSTRB,
        out_stream_TLAST => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TLAST,
        buffer_V_address0 => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_address0,
        buffer_V_ce0 => grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_ce0,
        buffer_V_q0 => buffer_V_q0);

    regslice_both_in_stream_V_data_V_U : component data_proc_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => in_stream_TDATA,
        vld_in => in_stream_TVALID,
        ack_in => regslice_both_in_stream_V_data_V_U_ack_in,
        data_out => in_stream_TDATA_int_regslice,
        vld_out => in_stream_TVALID_int_regslice,
        ack_out => in_stream_TREADY_int_regslice,
        apdone_blk => regslice_both_in_stream_V_data_V_U_apdone_blk);

    regslice_both_in_stream_V_keep_V_U : component data_proc_regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => in_stream_TKEEP,
        vld_in => in_stream_TVALID,
        ack_in => regslice_both_in_stream_V_keep_V_U_ack_in,
        data_out => in_stream_TKEEP_int_regslice,
        vld_out => regslice_both_in_stream_V_keep_V_U_vld_out,
        ack_out => in_stream_TREADY_int_regslice,
        apdone_blk => regslice_both_in_stream_V_keep_V_U_apdone_blk);

    regslice_both_in_stream_V_strb_V_U : component data_proc_regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => in_stream_TSTRB,
        vld_in => in_stream_TVALID,
        ack_in => regslice_both_in_stream_V_strb_V_U_ack_in,
        data_out => in_stream_TSTRB_int_regslice,
        vld_out => regslice_both_in_stream_V_strb_V_U_vld_out,
        ack_out => in_stream_TREADY_int_regslice,
        apdone_blk => regslice_both_in_stream_V_strb_V_U_apdone_blk);

    regslice_both_in_stream_V_last_V_U : component data_proc_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => in_stream_TLAST,
        vld_in => in_stream_TVALID,
        ack_in => regslice_both_in_stream_V_last_V_U_ack_in,
        data_out => in_stream_TLAST_int_regslice,
        vld_out => regslice_both_in_stream_V_last_V_U_vld_out,
        ack_out => in_stream_TREADY_int_regslice,
        apdone_blk => regslice_both_in_stream_V_last_V_U_apdone_blk);

    regslice_both_out_stream_V_data_V_U : component data_proc_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => out_stream_TDATA_int_regslice,
        vld_in => out_stream_TVALID_int_regslice,
        ack_in => out_stream_TREADY_int_regslice,
        data_out => out_stream_TDATA,
        vld_out => regslice_both_out_stream_V_data_V_U_vld_out,
        ack_out => out_stream_TREADY,
        apdone_blk => regslice_both_out_stream_V_data_V_U_apdone_blk);

    regslice_both_out_stream_V_keep_V_U : component data_proc_regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => out_stream_TKEEP_int_regslice,
        vld_in => out_stream_TVALID_int_regslice,
        ack_in => regslice_both_out_stream_V_keep_V_U_ack_in_dummy,
        data_out => out_stream_TKEEP,
        vld_out => regslice_both_out_stream_V_keep_V_U_vld_out,
        ack_out => out_stream_TREADY,
        apdone_blk => regslice_both_out_stream_V_keep_V_U_apdone_blk);

    regslice_both_out_stream_V_strb_V_U : component data_proc_regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => out_stream_TSTRB_int_regslice,
        vld_in => out_stream_TVALID_int_regslice,
        ack_in => regslice_both_out_stream_V_strb_V_U_ack_in_dummy,
        data_out => out_stream_TSTRB,
        vld_out => regslice_both_out_stream_V_strb_V_U_vld_out,
        ack_out => out_stream_TREADY,
        apdone_blk => regslice_both_out_stream_V_strb_V_U_apdone_blk);

    regslice_both_out_stream_V_last_V_U : component data_proc_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        data_in => out_stream_TLAST_int_regslice,
        vld_in => out_stream_TVALID_int_regslice,
        ack_in => regslice_both_out_stream_V_last_V_U_ack_in_dummy,
        data_out => out_stream_TLAST,
        vld_out => regslice_both_out_stream_V_last_V_U_vld_out,
        ack_out => out_stream_TREADY,
        apdone_blk => regslice_both_out_stream_V_last_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_ready = ap_const_logic_1)) then 
                    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state5) and (ap_const_boolean_0 = ap_block_state5_on_subcall_done))) then
                data_count_V <= ret_V_1_fu_166_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                icmp_ln1065_reg_183 <= icmp_ln1065_fu_144_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_state1, icmp_ln1065_fu_144_p2, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state5, ap_block_state5_on_subcall_done, ap_block_state1_io, regslice_both_out_stream_V_data_V_U_apdone_blk, ap_CS_fsm_state6, in_stream_TVALID_int_regslice, out_stream_TREADY_int_regslice)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_const_boolean_1 = ap_block_state1_io) or (in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)))) and (icmp_ln1065_fu_144_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                elsif ((not(((ap_const_boolean_1 = ap_block_state1_io) or (in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)))) and (icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((out_stream_TREADY_int_regslice = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((out_stream_TREADY_int_regslice = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state5) and (ap_const_boolean_0 = ap_block_state5_on_subcall_done))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state6) and (regslice_both_out_stream_V_data_V_U_apdone_blk = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    add_ln1560_fu_161_p2 <= std_logic_vector(unsigned(data_count_V) + unsigned(ap_const_lv4_7));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);

    ap_ST_fsm_state1_blk_assign_proc : process(icmp_ln1065_fu_144_p2, ap_block_state1_io, in_stream_TVALID_int_regslice, out_stream_TREADY_int_regslice)
    begin
        if (((ap_const_boolean_1 = ap_block_state1_io) or (in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(out_stream_TREADY_int_regslice)
    begin
        if ((out_stream_TREADY_int_regslice = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state3_blk_assign_proc : process(out_stream_TREADY_int_regslice)
    begin
        if ((out_stream_TREADY_int_regslice = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state4_blk <= ap_const_logic_0;

    ap_ST_fsm_state5_blk_assign_proc : process(ap_block_state5_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state5_on_subcall_done)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state6_blk_assign_proc : process(regslice_both_out_stream_V_data_V_U_apdone_blk)
    begin
        if ((regslice_both_out_stream_V_data_V_U_apdone_blk = ap_const_logic_1)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(icmp_ln1065_fu_144_p2, in_stream_TVALID_int_regslice, out_stream_TREADY_int_regslice)
    begin
                ap_block_state1 <= ((in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state1_io_assign_proc : process(icmp_ln1065_fu_144_p2, out_stream_TREADY_int_regslice)
    begin
                ap_block_state1_io <= ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state5_on_subcall_done_assign_proc : process(icmp_ln1065_reg_183, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_done)
    begin
                ap_block_state5_on_subcall_done <= ((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_done = ap_const_logic_0) and (icmp_ln1065_reg_183 = ap_const_lv1_1));
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    buffer_V_address0_assign_proc : process(ap_CS_fsm_state1, icmp_ln1065_reg_183, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_address0, ap_CS_fsm_state5, zext_ln50_fu_139_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            buffer_V_address0 <= zext_ln50_fu_139_p1(4 - 1 downto 0);
        elsif (((icmp_ln1065_reg_183 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            buffer_V_address0 <= grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_address0;
        else 
            buffer_V_address0 <= "XXXX";
        end if; 
    end process;


    buffer_V_ce0_assign_proc : process(ap_CS_fsm_state1, icmp_ln1065_fu_144_p2, icmp_ln1065_reg_183, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_ce0, ap_CS_fsm_state5, ap_block_state1_io, in_stream_TVALID_int_regslice, out_stream_TREADY_int_regslice)
    begin
        if ((not(((ap_const_boolean_1 = ap_block_state1_io) or (in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            buffer_V_ce0 <= ap_const_logic_1;
        elsif (((icmp_ln1065_reg_183 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            buffer_V_ce0 <= grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_buffer_V_ce0;
        else 
            buffer_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    buffer_V_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln1065_fu_144_p2, ap_block_state1_io, in_stream_TVALID_int_regslice, out_stream_TREADY_int_regslice)
    begin
        if ((not(((ap_const_boolean_1 = ap_block_state1_io) or (in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            buffer_V_we0 <= ap_const_logic_1;
        else 
            buffer_V_we0 <= ap_const_logic_0;
        end if; 
    end process;

    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start <= grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_ap_start_reg;
    grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TREADY <= (out_stream_TREADY_int_regslice and ap_CS_fsm_state5);
    icmp_ln1065_fu_144_p2 <= "1" when (data_count_V = ap_const_lv4_9) else "0";
    icmp_ln1560_fu_155_p2 <= "1" when (unsigned(ret_V_fu_150_p2) < unsigned(ap_const_lv4_A)) else "0";

    in_stream_TDATA_blk_n_assign_proc : process(ap_CS_fsm_state1, in_stream_TVALID_int_regslice)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            in_stream_TDATA_blk_n <= in_stream_TVALID_int_regslice;
        else 
            in_stream_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    in_stream_TREADY <= regslice_both_in_stream_V_data_V_U_ack_in;

    in_stream_TREADY_int_regslice_assign_proc : process(ap_CS_fsm_state1, icmp_ln1065_fu_144_p2, ap_block_state1_io, in_stream_TVALID_int_regslice, out_stream_TREADY_int_regslice)
    begin
        if ((not(((ap_const_boolean_1 = ap_block_state1_io) or (in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            in_stream_TREADY_int_regslice <= ap_const_logic_1;
        else 
            in_stream_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    out_stream_TDATA_blk_n_assign_proc : process(ap_CS_fsm_state1, icmp_ln1065_fu_144_p2, ap_CS_fsm_state2, ap_CS_fsm_state3, out_stream_TREADY_int_regslice)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            out_stream_TDATA_blk_n <= out_stream_TREADY_int_regslice;
        else 
            out_stream_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    out_stream_TDATA_int_regslice_assign_proc : process(ap_CS_fsm_state1, icmp_ln1065_fu_144_p2, ap_CS_fsm_state2, icmp_ln1065_reg_183, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TDATA, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID, ap_CS_fsm_state5, in_stream_TVALID_int_regslice, out_stream_TREADY_int_regslice)
    begin
        if (((out_stream_TREADY_int_regslice = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            out_stream_TDATA_int_regslice <= ap_const_lv64_FEAE0000;
        elsif ((not(((in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)))) and (icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            out_stream_TDATA_int_regslice <= ap_const_lv64_FFFFFFFFFFFF0000;
        elsif (((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID = ap_const_logic_1) and (icmp_ln1065_reg_183 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            out_stream_TDATA_int_regslice <= grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TDATA;
        else 
            out_stream_TDATA_int_regslice <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    out_stream_TKEEP_int_regslice_assign_proc : process(ap_CS_fsm_state1, icmp_ln1065_fu_144_p2, ap_CS_fsm_state2, icmp_ln1065_reg_183, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TKEEP, ap_CS_fsm_state5, in_stream_TVALID_int_regslice, out_stream_TREADY_int_regslice)
    begin
        if (((not(((in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)))) and (icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((out_stream_TREADY_int_regslice = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            out_stream_TKEEP_int_regslice <= ap_const_lv8_FF;
        elsif (((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID = ap_const_logic_1) and (icmp_ln1065_reg_183 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            out_stream_TKEEP_int_regslice <= grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TKEEP;
        else 
            out_stream_TKEEP_int_regslice <= "XXXXXXXX";
        end if; 
    end process;


    out_stream_TLAST_int_regslice_assign_proc : process(ap_CS_fsm_state1, icmp_ln1065_fu_144_p2, ap_CS_fsm_state2, icmp_ln1065_reg_183, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TLAST, ap_CS_fsm_state5, in_stream_TVALID_int_regslice, out_stream_TREADY_int_regslice)
    begin
        if (((not(((in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)))) and (icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((out_stream_TREADY_int_regslice = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            out_stream_TLAST_int_regslice <= ap_const_lv1_0;
        elsif (((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID = ap_const_logic_1) and (icmp_ln1065_reg_183 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            out_stream_TLAST_int_regslice <= grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TLAST;
        else 
            out_stream_TLAST_int_regslice <= "X";
        end if; 
    end process;


    out_stream_TSTRB_int_regslice_assign_proc : process(ap_CS_fsm_state1, icmp_ln1065_fu_144_p2, ap_CS_fsm_state2, icmp_ln1065_reg_183, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TSTRB, ap_CS_fsm_state5, in_stream_TVALID_int_regslice, out_stream_TREADY_int_regslice)
    begin
        if (((not(((in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)))) and (icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((out_stream_TREADY_int_regslice = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            out_stream_TSTRB_int_regslice <= ap_const_lv8_0;
        elsif (((grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID = ap_const_logic_1) and (icmp_ln1065_reg_183 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            out_stream_TSTRB_int_regslice <= grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TSTRB;
        else 
            out_stream_TSTRB_int_regslice <= "XXXXXXXX";
        end if; 
    end process;

    out_stream_TVALID <= regslice_both_out_stream_V_data_V_U_vld_out;

    out_stream_TVALID_int_regslice_assign_proc : process(ap_CS_fsm_state1, icmp_ln1065_fu_144_p2, ap_CS_fsm_state2, icmp_ln1065_reg_183, grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID, ap_CS_fsm_state5, ap_block_state1_io, in_stream_TVALID_int_regslice, out_stream_TREADY_int_regslice)
    begin
        if ((((out_stream_TREADY_int_regslice = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2)) or (not(((ap_const_boolean_1 = ap_block_state1_io) or (in_stream_TVALID_int_regslice = ap_const_logic_0) or ((icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (out_stream_TREADY_int_regslice = ap_const_logic_0)))) and (icmp_ln1065_fu_144_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            out_stream_TVALID_int_regslice <= ap_const_logic_1;
        elsif (((icmp_ln1065_reg_183 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            out_stream_TVALID_int_regslice <= grp_data_proc_Pipeline_VITIS_LOOP_67_1_fu_116_out_stream_TVALID;
        else 
            out_stream_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    ret_V_1_fu_166_p3 <= 
        ret_V_fu_150_p2 when (icmp_ln1560_fu_155_p2(0) = '1') else 
        add_ln1560_fu_161_p2;
    ret_V_fu_150_p2 <= std_logic_vector(unsigned(data_count_V) + unsigned(ap_const_lv4_1));
    zext_ln50_fu_139_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(data_count_V),64));
end behav;
