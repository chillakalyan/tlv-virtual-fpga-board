

---

# Chip Architecture

## Overview

This document describes the architecture of the FPGA logic modules implemented in this repository.

The repository contains several example FPGA designs that interact with the virtual IGLOO Nano board.

Each design connects to the board through a shared FPGA signal interface.

---

# Architecture Layers

The system is organized into three main layers:
```
FPGA Logic (chips/)
↓
FPGA Interface Signals
↓
Board Visualization (board/)
↓
Makerchip Simulation
```

This separation allows the FPGA logic to remain independent from the board visualization.

---

# FPGA Interface

The FPGA interface is defined in:
```
tlv_lib/fpga_interface.tlv
```


This file defines the shared signals used by all chip designs.
```
|fpga
  $led[7:0]
  $slideswitch[7:0]
  $push[3:0]
```

These signals act as the communication bridge between the FPGA design and the board.

---

# Chip Modules

The `chips/` directory contains several example FPGA modules.

## 1. LED Blinker

File:
```
chips/01_led_blinker.tlv
```

Description:

- Uses a counter to generate LED blinking patterns.
- Demonstrates simple FPGA output control.

Functionality:
```
counter → LED output
```

---

## 2. LED Animation

File:
```
chips/02_led_animation.tlv
```

Description:

- Creates a moving LED pattern across the board.
- Demonstrates sequential LED control.

Functionality:
```
counter → position register → LED shift
```

---

## 3. Button Counter

File:
```
chips/03_button_counter.tlv
```

Description:

- Counts button presses.
- Displays the count value on LEDs.

Functionality:
```
button press → edge detection → counter → LED output
```

---

## 4. Switch LED Controller

File:
```
chips/04_switch_led_controller.tlv
```

Description:

- Directly maps switch inputs to LED outputs.
- Demonstrates basic FPGA IO interaction.

Functionality:
```
slideswitch → LED
```

---

# Signal Flow

The data flow between the FPGA design and board visualization is:
```
User input (switch / button)
↓
FPGA logic module
↓
LED output signals
↓
Board visualization
```

---

# Design Goals

The chip architecture is designed to:

- Demonstrate simple FPGA logic examples
- Provide interaction with board inputs and outputs
- Validate the FPGA interface used by the board visualization

---

# Conclusion

The chip modules serve as example FPGA designs that interact with the virtual IGLOO Nano board through a standardized interface. This modular architecture allows different FPGA designs to be tested easily within the same board visualization environment.
