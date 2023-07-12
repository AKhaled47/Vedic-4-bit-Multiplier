module vedic4x4_tb;

reg [3:0] a,b;
wire [8:0] s;

vedic4x4 u1 (a,b,s);
integer i,j;
initial begin
    $monitor("A= %d , B= %d , S=%d",a,b,s);
    for(i=0;i<16;i=i+1) begin
        for (j=0;j<16;j=j+1) begin
            a=i;
            b=j;
            #1;
        end
    end
    $finish;
end
endmodule