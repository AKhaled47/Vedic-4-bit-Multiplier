module vedic4x4_tb;
reg [3:0] a,b;
wire [8:0] s;

vedic4x4 u1 (a,b,s);
integer i,j,ref_mul;
initial begin
    $monitor("A= %d , B= %d , S=%d",a,b,s);
    for(i=0;i<16;i=i+1) begin
        for (j=0;j<16;j=j+1) begin
            a=i;
            b=j;
            ref_mul=a*b;
            #1;
            if(ref_mul==s)
            $display("Pass");
            else
            $display("Failed : a = %d, b = %d, s = %d is not right, the right is %d",a,b,s,ref_mul);
            #1;
        end
    end
    $finish;
end
endmodule
