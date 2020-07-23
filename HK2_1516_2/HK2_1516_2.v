module HK2_1516_2(clk,Tred,Tyellow,Tgreen,R1,Y1,G1,R2,Y2,G2);
    input clk;
    input [7:0]Tred,Tyellow,Tgreen;
    output R1,Y1,G1,R2,Y2,G2;
    reg [7:0] count=0;
    reg R1=0,R2=0,G1=0,G2=0,Y1=0,Y2=0;
    always @(posedge clk) begin
        count<=count+1;
        if ((count>=Tgreen)&&(count<Tred))
            {R1,Y1,G1,R2,Y2,G2}=6'b010100;
        if ((count>=Tred)&&(count<(2*Tred-Tyellow)))
            {R1,Y1,G1,R2,Y2,G2}=6'b100001;
        if ((count>=(2*Tred-Tyellow))&&(count<(2*Tred)))
            {R1,Y1,G1,R2,Y2,G2}=6'b100010;
        if (count>=(2*Tred)) begin
            {R1,Y1,G1,R2,Y2,G2}=6'b001100;
            count<=0;
        end
    end
endmodule
