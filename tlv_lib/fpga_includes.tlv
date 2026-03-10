\m5_TLV_version 1d: tl-x.org

\SV
\m5
   use(m5-1.0)

   // Visualization colors
   universal_var(RED_LED_COLOR, "#ff4040")
   universal_var(LED_OFF_COLOR, "#404040")

\TLV

|fpga
   $led[7:0]
   $slideswitch[7:0]
   $push[3:0]
