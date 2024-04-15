module alu(
    input wire clk,
    input wire en,
    input wire [7:0] opcode,
    input wire [3:0] in_1,
    input wire [3:0] in_2,
    output reg [7:0] out
);
 
always @(posedge clk) begin
    if (en) begin
        case (opcode) 
        8'b00000000: //Forward of first input
            out = in_1;
        8'b00000001: // Addition
            out = in_1 + in_2; 
        8'b00000010: // Subtraction
            out = in_1 - in_2;
        8'b00000011: // Logical NOT of first input
            out = ~in_1;
        8'b00000100: //Logical OR 
            out = in_1 | in_2;
        8'b00000101: //Logical AND
            out = in_1 & in_2;
        8'b00000110: //Logical XOR
            out = in_1 ^ in_2;
        8'b00000111: //left shift by two
            out = in_1<<2 ;
        endcase
    end
end

endmodule
