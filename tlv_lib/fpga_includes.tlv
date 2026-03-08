\m5_TLV_version 1d: tl-x.org
\SV
\m5
   use(m5-1.0)

   // Include IGLOO board visualization
   m4_include_lib(['https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/board/igloo_board.tlv'])

   // Macro constants for visualization
   universal_var(RED_LED_COLOR, "#ff4040")
   universal_var(LED_OFF_COLOR, "#404040")

   // Simple FPGA module wrapper
   macro(fpga_top, ['

      module top(
         input wire clk,
         input wire reset,
         input wire [31:0] cyc_cnt,
         output wire passed,
         output wire failed
      );

      logic [7:0] led;
      logic [7:0] slideswitch;
      logic [3:0] push;

   '])
\TLV

// Simple heartbeat signal
fpga_heartbeat($_pulse, #_delay)

   $count[31:0] =
      *reset ? 0 :
      >>1$count + 1;

   $_pulse =
      ($count == #_delay) ? 1 : 0;


// Default LED driver for visualization
/default_led_logic

   @0
      $counter[31:0] =
         *reset ? 0 :
         >>1$counter + 1;

   @1
      $led[7:0] =
         >>1$counter[27:20];

\SV

   assign passed = cyc_cnt > 200;
   assign failed = 1'b0;

endmodule
