
module Controller
(
clock,				// Clock 40MHz
reset,				// Reset tich cuc duong
ledSingle,			// Tin hieu led don
controlLed7Seg1,	// Tin hieu led 7 thanh hang chuc
controlLed7Seg0		// Tin hieu led 7 thanh hang don vi
);

// Khai bao tin hieu
input clock, reset;
output reg [2:0] ledSingle;
output reg [3:0] controlLed7Seg1,controlLed7Seg0;


parameter GreenTime 	= 40;
parameter YellowTime 	= 10;
parameter RedTime 	= 50;
 

parameter GreenState 	= 2'b00;
parameter YellowState 	= 2'b01;
parameter RedState 	= 2'b10;


reg [1:0] currentState, nextState;


// D-FlipFlop
initial
begin
currentState = GreenState;
nextState = YellowState;
controlLed7Seg1 <= GreenTime / 10;
controlLed7Seg0 <= GreenTime % 10;
end



always @ (negedge clock or posedge reset)
begin
	if(reset)
		begin
			currentState = GreenState;
			controlLed7Seg1 <= GreenTime / 10;
			controlLed7Seg0 <= GreenTime % 10;
		end
	else
		if( controlLed7Seg1 == 0 && controlLed7Seg0 == 0)
			begin
				currentState <= nextState;
			end
		else
			begin
			if (controlLed7Seg0 == 0)
				begin
					controlLed7Seg1 = controlLed7Seg1 - 1;
					controlLed7Seg0 = 9;
				end
			else
				controlLed7Seg0 = controlLed7Seg0 - 1;
			end
end






always @ (currentState)
begin
		case(currentState)
			GreenState: 
				begin 
					nextState = YellowState;
					controlLed7Seg1 = GreenTime / 10;
					controlLed7Seg0 = GreenTime % 10;
				end
			YellowState: 
				begin 
					nextState = RedState;
					controlLed7Seg1 = YellowTime / 10;
					controlLed7Seg0 = YellowTime % 10;
				end
			RedState: 
				begin 
					nextState = GreenState; 
					controlLed7Seg1 = RedTime / 10;
					controlLed7Seg0 = RedTime % 10;
				end
		endcase
end




always @ (currentState)
begin
	case(currentState)
		GreenState: ledSingle 	= 3'b100;
		YellowState: ledSingle	= 3'b010;
		RedState: ledSingle	= 3'b001;
	endcase
end

endmodule






