\m5_TLV_version 1d: tl-x.org
\m5
   use(m5-1.0)

\SV
   m4_include_lib(['https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/tlv_lib/fpga_includes.tlv'])

   m5_makerchip_module
\TLV

|fpga

   @0
      $counter[31:0] = *reset ? 0 : >>1$counter + 1;

   @1
      $led[7:0] = >>1$counter[27:20];

\SV
endmodule
