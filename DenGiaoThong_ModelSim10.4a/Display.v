module Display
(
ledSingle,			// Input led don	
controlLed7Seg1,	// Input led 7 thanh hang chuc
controlLed7Seg0,	// Input led 7 thanh hang don vi
ledRed,				// Output led do
ledGreen,			// Output led xanh
ledYellow,			// Output led vang
led7Seg1,			// Output led 7 thanh hang chuc
led7Seg0			// Output led 7 thanh hang don vi
);

input [2:0] ledSingle;
input [3:0] controlLed7Seg1,controlLed7Seg0;
output ledRed,ledGreen,ledYellow;
output reg [6:0] led7Seg1,led7Seg0;

parameter 	  num0 = 7'b1111110, //7E
		  num1 = 7'b0110000, //30
		  num2 = 7'b1101101, //6D
		  num3 = 7'b1111001, //79
		  num4 = 7'b0110011, //33
		  num5 = 7'b1011011, //5B
		  num6 = 7'b0111111, //5F
		  num7 = 7'b1110000, //70
		  num8 = 7'b1111111, //7F
		  num9 = 7'b1111011; //7B

assign ledGreen 	= ledSingle[2];
assign ledYellow 	= ledSingle[1];
assign ledRed 		= ledSingle[0];

always @ (controlLed7Seg1)
begin
		case(controlLed7Seg1)
			4'b0000 : led7Seg1 = num0;
			4'b0001 : led7Seg1 = num1;
			4'b0010 : led7Seg1 = num2;
			4'b0011 : led7Seg1 = num3;
			4'b0100 : led7Seg1 = num4;
			4'b0101 : led7Seg1 = num5;
			4'b0110 : led7Seg1 = num6;
			4'b0111 : led7Seg1 = num7;
			4'b1000 : led7Seg1 = num8;
			4'b1001 : led7Seg1 = num9;
			default : led7Seg1 = num0;
		endcase
end

always @ (controlLed7Seg0)
begin
		case(controlLed7Seg0)
			4'b0000 : led7Seg0 = num0;
			4'b0001 : led7Seg0 = num1;
			4'b0010 : led7Seg0 = num2;
			4'b0011 : led7Seg0 = num3;
			4'b0100 : led7Seg0 = num4;
			4'b0101 : led7Seg0 = num5;
			4'b0110 : led7Seg0 = num6;
			4'b0111 : led7Seg0 = num7;
			4'b1000 : led7Seg0 = num8;
			4'b1001 : led7Seg0 = num9;
			default : led7Seg0 = num0;
		endcase
end

endmodule

