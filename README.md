🔢 1Hz BCD LED Counter on ZedBoard Zynq-7000
This project implements a simple 1Hz decimal (BCD) counter in VHDL on the ZedBoard Zynq-7000. It uses a 100 MHz system clock to increment a counter from 0 to 9 in binary-coded decimal format and displays the result using 4 onboard LEDs (LD0–LD3). Like the previous project, this design uses an enable-based counter rather than a clock divider and is entirely implemented in the PL (Programmable Logic) of the ZedBoard.

---

📦 Project Details
- **Top Module:** `bcd_counter_leds`
- **Clock Input:** 100 MHz onboard oscillator
- **Output:** LD0–LD3 display BCD values from 0 to 9
- **Reset Pin:** SW5 (T18) — active-high synchronous reset
- **Design Goal:** Demonstrate use of BCD counters, LED display, and enable-based timing logic without dividing the clock

---

🛠️ Tools Used
- Vivado Design Suite (e.g., Vivado 2023.x)
- VHDL for hardware description
- Optional: GHDL/GTKWave for simulation

---

📐 How the Design Works
The design uses a 100 MHz input clock to create a 1Hz enable signal using a counter. This signal updates a 4-bit binary-coded decimal (BCD) counter, which wraps around after reaching 9 (`1001`). The output value is connected to LEDs LD0 through LD3, showing the binary equivalent of decimal numbers 0 to 9.

- **LD3:LD0** show the current count value (e.g., `0101` = 5)
- The counter increments once per second when the enable signal is asserted

➕ Reset Behavior
- Pressing **SW0 (T22)** will:
  - Reset the internal 1Hz enable counter
  - Reset the BCD counter to 0 (`0000`)
  - Turn OFF all LEDs temporarily

---

🔌 Vivado Build & Program Steps

1. **Open Project in Vivado**
   - Launch Vivado
   - Open the `.xpr` project file inside the `vivado_project/` folder

2. **Run Synthesis & Implementation**
   - Click **Run Synthesis**
   - Click **Run Implementation**
   - Check timing and power summaries

3. **Generate Bitstream**
   - Click **Generate Bitstream**

4. **Program the FPGA**
   - Connect your ZedBoard via JTAG
   - Go to **Open Hardware Manager → Open Target → Auto Connect**
   - Click **Program Device** and select the generated `.bit` file

5. **Observe Output**
   - LD0–LD3 display binary values of 0 to 9
   - Values increment once per second
   - Press **SW5 (T18)** to reset the counter

---

✅ This project reinforces enable-driven timing, counters, binary display, and I/O constraint mapping in Vivado for Zynq-7000 devices.
