/* Module Top level entity
* Den Giao thong
*/

module DenGiaoThong
(
clock, 		//Clock 40 MHz
reset, 		//Reset
ledRed, 	//Led don
ledGreen,
ledYellow,
led7Seg1, 	//Led 7 thanh hang chuc
led7Seg0	//Led 7 thanh hang don vi
);

// Khai bao tin hieu
input clock, reset;
output ledRed,ledGreen,ledYellow;
output [6:0] led7Seg1,led7Seg0;
wire [6:0] led7Seg1,led7Seg0;

wire clock1hz;
wire [3:0] controlLed7Seg1, controlLed7Seg0;
wire [2:0] ledSingle;
// Gan tin hieu vao cac khoi

DivisionFrequency T1
(
.clockIn			(clock),
.clockOut			(clock1hz)
);

Controller T2
(
.clock				(clock1hz),
.reset				(reset),
.ledSingle			(ledSingle),
.controlLed7Seg1		(controlLed7Seg1),
.controlLed7Seg0		(controlLed7Seg0)
);

Display T3
(
.ledSingle			(ledSingle),
.controlLed7Seg1		(controlLed7Seg1),
.controlLed7Seg0		(controlLed7Seg0),
.ledRed				(ledRed),
.ledGreen			(ledGreen),
.ledYellow			(ledYellow),
.led7Seg1			(led7Seg1),
.led7Seg0			(led7Seg0)
);

endmodule

