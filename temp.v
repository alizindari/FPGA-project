module temp();
reg [1:0] a = 2'b10;
reg b=1;
reg c=0;
initial begin



if (a == {b,c})
   $display("hello");

end

endmodule
