module DenGiaoThong_tb;

reg 		clock, 		//Clock 40 MHz
		reset; 		//Reset
wire		ledRed, 	//Led don
		ledGreen,
		ledYellow;
wire [6:0]	led7Seg1, 	//Led 7 thanh hang chuc
		led7Seg0;

DenGiaoThong DUT
(
.clock		(clock), 		//Clock 40 MHz
.reset		(reset), 		//Reset
.ledRed		(ledRed), 	//Led don
.ledGreen	(ledGreen),
.ledYellow	(ledYellow),
.led7Seg1	(led7Seg1), 	//Led 7 thanh hang chuc
.led7Seg0	(led7Seg0)	//Led 7 thanh hang don vi
);

initial
begin
	clock = 0;
	reset = 1;
#10
	reset = 0;
	
end

always
#1 clock = !clock;



endmodule

