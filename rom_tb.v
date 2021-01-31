module rom_tb;
reg clk;
reg rst;
reg [3:0]address;
wire [3:0]data_out;
reg read;
integer fd, i;


rom rom_i(.clk(clk),
.rst(rst), .read(read),
.address(address), .data_out(data_out));

initial
begin
	clk = 0;
	forever #4 clk = ~clk;
end

initial
begin
	#3 rst = 1;
	#5 rst = 0; read = 1;
end
initial
begin

	$dumpfile("rom_tb.vcd");
	$dumpvars();
	#1000 $finish;

end

initial
begin
	address = 0;
	repeat(15)
	begin
	     #15  address = address+1;
	end
end
initial
begin
	#20;
	fd = $fopen("./mm.txt","w");
	#10 repeat(15) #1 
	for(i=0; i<16; i = i+1)
	begin
		$fwrite(fd,"%b\n  ",i);
	end

	$fclose(fd);
	#10;
end
endmodule
