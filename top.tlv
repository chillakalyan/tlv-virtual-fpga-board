\m4_TLV_version 1d -p verilog --bestsv --noline: tl-x.org

\SV
m4_include_lib(['https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/tlv_lib/fpga_includes.tlv'])

\SV
m4_include_lib(['https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/board/igloo_board.tlv'])

\SV
module top;

\TLV
/board
   /fpga

      @0
         $led[7:0] <= >>1$led + 1
         *led = $led

         *slideswitch = 8'hAA
         *push = 4'hF

\SV
endmodule
