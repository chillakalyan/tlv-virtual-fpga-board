\TLV

/board

   \viz_js
      init() {
         return {
            board: this.newImageFromURL(
               "https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/images/igloo_board.png",
               "",
               { left:0, top:0, width:1200, height:600 }
            )
         }
      }

/leds[7:0]

   $viz_lit = /fpga$led[#leds]

   \viz_js
      box:{width:14,height:14,fill:"red",strokeWidth:0}

      renderFill(){
         return '$viz_lit'.asBool() ? "red" : "transparent"
      }

      where:{left:350, top:520, scale:3}
