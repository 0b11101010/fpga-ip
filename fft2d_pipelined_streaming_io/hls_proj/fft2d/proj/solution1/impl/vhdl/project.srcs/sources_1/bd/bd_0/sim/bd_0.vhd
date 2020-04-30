--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
--Date        : Fri May  1 00:24:03 2020
--Host        : erhan-G3-3779 running 64-bit Ubuntu 18.04.4 LTS
--Command     : generate_target bd_0.bd
--Design      : bd_0
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    xk_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    xk_tlast : out STD_LOGIC_VECTOR ( 0 to 0 );
    xk_tready : in STD_LOGIC;
    xk_tvalid : out STD_LOGIC;
    xn_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    xn_tlast : in STD_LOGIC_VECTOR ( 0 to 0 );
    xn_tready : out STD_LOGIC;
    xn_tvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of bd_0 : entity is "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of bd_0 : entity is "bd_0.hwdef";
end bd_0;

architecture STRUCTURE of bd_0 is
  component bd_0_hls_inst_0 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    xn_TVALID : in STD_LOGIC;
    xn_TREADY : out STD_LOGIC;
    xn_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    xn_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    xk_TVALID : out STD_LOGIC;
    xk_TREADY : in STD_LOGIC;
    xk_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    xk_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bd_0_hls_inst_0;
  signal ap_clk_0_1 : STD_LOGIC;
  signal ap_rst_n_0_1 : STD_LOGIC;
  signal hls_inst_xk_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal hls_inst_xk_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_xk_TREADY : STD_LOGIC;
  signal hls_inst_xk_TVALID : STD_LOGIC;
  signal xn_0_1_TDATA : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal xn_0_1_TLAST : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xn_0_1_TREADY : STD_LOGIC;
  signal xn_0_1_TVALID : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF xk:xn, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 400000000.0, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of xk_tready : signal is "xilinx.com:interface:axis:1.0 xk ";
  attribute X_INTERFACE_INFO of xk_tvalid : signal is "xilinx.com:interface:axis:1.0 xk ";
  attribute X_INTERFACE_INFO of xn_tready : signal is "xilinx.com:interface:axis:1.0 xn ";
  attribute X_INTERFACE_INFO of xn_tvalid : signal is "xilinx.com:interface:axis:1.0 xn ";
  attribute X_INTERFACE_INFO of xk_tdata : signal is "xilinx.com:interface:axis:1.0 xk ";
  attribute X_INTERFACE_PARAMETER of xk_tdata : signal is "XIL_INTERFACENAME xk, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 400000000.0, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of xk_tlast : signal is "xilinx.com:interface:axis:1.0 xk ";
  attribute X_INTERFACE_INFO of xn_tdata : signal is "xilinx.com:interface:axis:1.0 xn ";
  attribute X_INTERFACE_PARAMETER of xn_tdata : signal is "XIL_INTERFACENAME xn, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 400000000.0, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of xn_tlast : signal is "xilinx.com:interface:axis:1.0 xn ";
begin
  ap_clk_0_1 <= ap_clk;
  ap_rst_n_0_1 <= ap_rst_n;
  hls_inst_xk_TREADY <= xk_tready;
  xk_tdata(63 downto 0) <= hls_inst_xk_TDATA(63 downto 0);
  xk_tlast(0) <= hls_inst_xk_TLAST(0);
  xk_tvalid <= hls_inst_xk_TVALID;
  xn_0_1_TDATA(63 downto 0) <= xn_tdata(63 downto 0);
  xn_0_1_TLAST(0) <= xn_tlast(0);
  xn_0_1_TVALID <= xn_tvalid;
  xn_tready <= xn_0_1_TREADY;
hls_inst: component bd_0_hls_inst_0
     port map (
      ap_clk => ap_clk_0_1,
      ap_rst_n => ap_rst_n_0_1,
      xk_TDATA(63 downto 0) => hls_inst_xk_TDATA(63 downto 0),
      xk_TLAST(0) => hls_inst_xk_TLAST(0),
      xk_TREADY => hls_inst_xk_TREADY,
      xk_TVALID => hls_inst_xk_TVALID,
      xn_TDATA(63 downto 0) => xn_0_1_TDATA(63 downto 0),
      xn_TLAST(0) => xn_0_1_TLAST(0),
      xn_TREADY => xn_0_1_TREADY,
      xn_TVALID => xn_0_1_TVALID
    );
end STRUCTURE;
