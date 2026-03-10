# TLV Virtual FPGA Board – IGLOO Nano Implementation

## Overview

This repository explores adding support for the **Microchip IGLOO Nano FPGA board** to the TL-Verilog based Virtual FPGA environment used in Makerchip.

The goal of this project is to implement a **custom board visualization layer** that connects TL-Verilog FPGA signals to a graphical board representation, similar to the boards already supported in the Virtual-FPGA-Lab framework.

The implementation includes:

* Custom board visualization for the **IGLOO Nano FPGA board**
* FPGA signal interface definition
* Example FPGA logic modules (LED blink, animations, switch control, button counter)
* Documentation describing board architecture and chip integration

This work is intended as an exploratory implementation to understand how new FPGA boards can be integrated into the Virtual-FPGA-Lab ecosystem.

---

# Repository Structure

```
tlv-virtual-fpga-board
│
├── board
│   └── igloo_board.tlv
│       
├── chips
│   ├── 01_led_blinker.tlv
│   ├── 02_led_animation.tlv
│   ├── 03_button_counter.tlv
│   └── 04_switch_led_controller.tlv   
│
├── docs
│   ├── board_layout.md
│   └── chip_architecture.md       
│
├── images
│   ├── igloo_board.png
│   └── igoo_board.png
│       
├── tlv_lib
│   └── fpga_interface.tlv
│       
└── top.tlv
    
```

---

# Architecture

The repository follows a **three-layer architecture**:

```
FPGA Logic (chips/)
        ↓
FPGA Interface (|fpga signals)
        ↓
Board Visualization (board/igloo_board.tlv)
        ↓
Makerchip Rendering
```

### 1. FPGA Logic Layer

The `chips/` directory contains several example FPGA designs:

| File                           | Description            |
| ------------------------------ | ---------------------- |
| `01_led_blinker.tlv`           | LED counter blink demo |
| `02_led_animation.tlv`         | LED shift animation    |
| `03_button_counter.tlv`        | Button press counter   |
| `04_switch_led_controller.tlv` | Switch controlled LEDs |

These designs interact with the board through the shared FPGA interface.

---

### 2. FPGA Interface

The file:

```
tlv_lib/fpga_interface.tlv
```

defines the shared signal interface:

```
|fpga
   $led[7:0]
   $slideswitch[7:0]
   $push[3:0]
```

This interface acts as the communication layer between the FPGA design and the board visualization.

---

### 3. Board Visualization

The board definition file:

```
board/igloo_board.tlv
```

implements the board visualization using `viz_js`.

Features currently implemented:

* Board image rendering
* LED visualization
* Switch representation
* Push button visualization

The visualization reads FPGA signals such as:

```
/fpga$led
/fpga$slideswitch
/fpga$push
```

and maps them to the graphical board components.

---

# Running the Design

To run the project in **Makerchip**:

1. Open Makerchip
2. Load or paste the contents of `top.tlv`
3. Ensure the repository files are accessible via raw GitHub URLs
4. Run the simulation

The expected behavior is that FPGA signals drive the board visualization elements.

---

# Current Status

This repository represents an **experimental implementation** of a new board backend for the Virtual-FPGA-Lab environment.

Current progress:

✔ Custom board visualization implemented
✔ FPGA interface defined
✔ Example FPGA designs created
✔ Repository structure aligned with Virtual-FPGA-Lab

Open investigation:

* Ensuring full integration of the custom board with Makerchip visualization
* Verifying compatibility with the Virtual-FPGA-Lab board initialization system

---

# Purpose

This project was created to explore how **new FPGA boards can be integrated into the Virtual-FPGA-Lab framework** and to understand the architecture used by existing supported boards.

The IGLOO Nano board was chosen as a test platform to experiment with board visualization and FPGA interface integration.

---

# Author

Kalyan

---

# License

MIT License
