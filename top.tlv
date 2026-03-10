\m5_TLV_version 1d: tl-x.org

\SV
\m5
   use(m5-1.0)

   // include helper macros
   m4_include_lib(['https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/tlv_lib/fpga_includes.tlv'])

   // include board visualization
   m4_include_lib(['https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/board/igloo_board.tlv'])

\SV
   m5_makerchip_module

\TLV

|fpga

   @0
      $led[7:0] = >>1$led + 1;

      $slideswitch[7:0] = 8'hAA;

      $push[3:0] = 4'hF;

\SV
endmodule
