\m5_TLV_version 1d: tl-x.org

\SV
\m5
   use(m5-1.0)

   // Visualization constants
   universal_var(RED_LED_COLOR, "#ff4040")
   universal_var(LED_OFF_COLOR, "#404040")

\TLV


// -------------------------------------------------
// FPGA INTERFACE
// -------------------------------------------------

|fpga
   $led[7:0]
   $slideswitch[7:0]
   $push[3:0]


// -------------------------------------------------
// HEARTBEAT GENERATOR
// -------------------------------------------------

fpga_heartbeat($_pulse, #_delay)

   $count[31:0] =
      *reset ? 0 :
      >>1$count + 1;

   $_pulse =
      ($count == #_delay);


// -------------------------------------------------
// DEFAULT LED LOGIC (fallback demo)
// -------------------------------------------------

/default_led_logic

   @0
      $counter[31:0] =
         *reset ? 0 :
         >>1$counter + 1;

   @1
      $led[7:0] =
         >>1$counter[27:20];



\SV
// -------------------------------------------------
// SYSTEMVERILOG WRAPPER
// -------------------------------------------------

module top(
   input wire clk,
   input wire reset,
   input wire [31:0] cyc_cnt,
   output wire passed,
   output wire failed
);

assign passed = cyc_cnt > 200;
assign failed = 1'b0;

endmodule
