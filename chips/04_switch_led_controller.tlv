\m5_TLV_version 1d: tl-x.org
\SV
\m5
   use(m5-1.0)

   m4_include_lib(['https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/tlv_lib/fpga_includes.tlv'])

\SV
   m5_makerchip_module
\TLV

|fpga

   @0
      $led[7:0] = $slideswitch[7:0];

\SV
endmodule
