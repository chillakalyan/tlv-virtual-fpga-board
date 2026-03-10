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
      $btn = $push[0];

   @1
      $btn_edge = $btn & ~>>1$btn;

   @2
      $count[7:0] =
         *reset ? 0 :
         $btn_edge ? >>1$count + 1 :
                     >>1$count;

   @3
      $led[7:0] = $count;

\SV
endmodule
