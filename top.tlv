\m5_TLV_version 1d: tl-x.org

\SV
\m5
   use(m5-1.0)

   // include FPGA interface
   m4_include_lib(['https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/tlv_lib/fpga_includes.tlv'])

   // include IGLOO board visualization
   m4_include_lib(['https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/board/igloo_board.tlv'])

\SV
   m5_makerchip_module

\TLV

|fpga

   // simple counter demo
   @0
      $counter[31:0] = *reset ? 0 : >>1$counter + 1;

   @1
      $led[7:0] = >>1$counter[27:20];

   // default inputs
   @0
      $slideswitch[7:0] = 0;
      $push[3:0] = 0;

\SV
endmodule
