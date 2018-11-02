module DivisionFrequency
(
clockIn,		//Xung clock vao
clockOut		//Xung clock ra
);

input clockIn;
output clockOut;
reg clockOut;

parameter scale = 4;

integer threshold = scale/2;
integer i = 0;
initial
clockOut = 0;
always @ (negedge clockIn )
begin
	if(i == threshold-1)
	begin
		clockOut <= !clockOut;
		i <= 0;
	end
	else
	i <= i + 1;
end

endmodule

