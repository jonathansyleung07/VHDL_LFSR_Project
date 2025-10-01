# 32-Bit Linear Feedback Shift Register in VHDL
This project implements a 32-bit Linear Feedback Shift Register (LFSR) in VHDL.
* On each rising clock edge (when enabled), the register shifts right by one bit and inserts a feedback bit generated from selected “tap” positions (bits 31, 21, 1, and 0).
* The module outputs the current 32-bit value as a pseudo-random sequence.
* A non-zero seed is loaded on reset to prevent the register from locking up at zero.
<img width="2849" height="1624" alt="image" src="https://github.com/user-attachments/assets/14852a0d-324a-4d4a-9c0b-815cdea0becb" />
