module vedic4x4_8bitFA(
    input [3:0] a,b,
    output [8:0] s
);

wire [3:0] v_out [3:0];
wire [7:0] a_out [1:0];
wire [1:0] c;


vedic2x2 u1 (a[1:0],b[1:0],v_out[0]);
vedic2x2 u2 (a[1:0],b[3:2],v_out[1]);
vedic2x2 u3 (a[3:2],b[1:0],v_out[2]);
vedic2x2 u4 (a[3:2],b[3:2],v_out[3]);

FA_generic #(.N(8)) u5 ({4'd0,v_out[0]},{2'd0,v_out[1],2'd0},1'b0,a_out[0],c[0]);

FA_generic #(.N(8)) u6 ({v_out[3],4'd0},{2'd0,v_out[2],2'd0},1'b0,a_out[1],c[1]);

FA_generic #(.N(8)) u7 (a_out[0],a_out[1],|c,s[7:0],s[8]);



endmodule
