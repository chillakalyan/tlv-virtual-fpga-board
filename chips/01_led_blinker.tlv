\m5_TLV_version 1d: tl-x.org
\SV
\m5
   use(m5-1.0)

   // load your repo library
   m4_include_lib(['https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/tlv_lib/fpga_includes.tlv'])

\SV
   m5_makerchip_module
\TLV

|fpga

   // connect reset
   @0
      $reset = *reset;

   // counter
   @1
      $counter[31:0] = $reset ? 0 : >>1$counter + 1;

   // LED output
   @2
      $led[7:0] = >>1$counter[27:20];

\SV
endmodule
