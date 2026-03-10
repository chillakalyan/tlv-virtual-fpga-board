
# IGLOO Nano Board Layout

## Overview

This document describes the visual layout and component mapping for the **IGLOO Nano FPGA board** used in the virtual FPGA environment.

The goal is to reproduce the board structure inside the TL-Verilog visualization system so that FPGA signals can interact with board components.

The board visualization is implemented in:
```
board/igloo_board.tlv
```

and rendered in Makerchip using the `viz_js` visualization system.

---

# Board Components

The IGLOO Nano board contains the following primary components:

| Component | Quantity | Purpose |
|--------|--------|--------|
| LEDs | 8 | Output indicators driven by FPGA |
| DIP Switches | 8 | User input switches |
| Push Buttons | 4 | User input buttons |
| IO Headers | Multiple | External expansion connectors |

In the current implementation, the following elements are visualized:

- LEDs
- Switches
- Push buttons

---

# Visualization Architecture

The visualization is implemented using the `viz_js` system.

The rendering flow is:
```
FPGA signals
↓
Board visualization (igloo_board.tlv)
↓
viz_js components
↓
Interactive board display
```

---

