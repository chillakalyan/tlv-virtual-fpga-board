\TLV

/board

   \viz_js
      init() {

         return {

            board_img: this.newImageFromURL(
               "https://raw.githubusercontent.com/chillakalyan/tlv-virtual-fpga-board/main/images/igloo_board.png",
               "",
               {
                  left: 0,
                  top: 0,
                  width: 1200,
                  height: 650
               }
            )

         }

      }

   /leds[7:0]

      $viz_led = /fpga$led[#leds]

      \viz_js
         box: {
            width: 14,
            height: 14,
            fill: "#ff4040",
            rx: 4,
            ry: 4,
            strokeWidth: 0
         }

         layout: {left: -32}

         renderFill() {

            return '$viz_led'.asBool() ? "#ff4040" : "#202020"

         }

         where: {
            left: 350,
            top: 520,
            scale: 3
         }

   /switch[7:0]

      $viz_switch = /fpga$slideswitch[#switch]

      \viz_js
         box: {
            width: 18,
            height: 35,
            fill: "#333",
            strokeWidth: 0
         }

         init() {

            let slot = new fabric.Rect({
               top: 10,
               left: 9,
               originX: "center",
               originY: "center",
               width: 12,
               height: 24,
               fill: "#222"
            })

            let knob = new fabric.Rect({
               top: 22,
               left: 9,
               originX: "center",
               originY: "center",
               width: 12,
               height: 10,
               fill: "#aaa"
            })

            return {slot, knob}

         }

         render(){

            this.getInitObjects().knob.set(
               '$viz_switch'.asBool() ? {top:8} : {top:24}
            )

         }

         where:{
            left:450,
            top:550,
            scale:3
         }

   /push

      \viz_js
         box:{height:30,width:33,strokeWidth:0}

         where:{left:900,top:420,scale:3}

      /pb[3:0]

         $viz_pressed = /fpga$push[#pb]

         \viz_js
            box:{
               width:14,
               height:14,
               fill:"#888",
               rx:4,
               ry:4
            }

            render(){

               this.set({
                  fill: '$viz_pressed'.asBool() ? "red" : "#888"
               })

            }

            layout:{
               left:function(i){ return i*25 }
            }
