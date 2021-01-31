module rom(input [3:0] address,
input read,
input clk,
input rst,
output reg [3:0] data_out);

reg [3:0]mem[0:15];
always@(posedge clk or posedge rst)
	if(rst)
		data_out <= 0;
	else if(read)
		data_out <= mem[address];
initial
begin
	$readmemb("mem.txt", mem);
end
endmodule
