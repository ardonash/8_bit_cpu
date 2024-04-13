module alu(
    input wire clk,
    input wire en,
    input wire [2:0] opcode,
    input wire [3:0] in_1,
    input wire [3:0] in_2,
    output reg [3:0] out
);
 
always @(posedge clk) begin
    if (en) begin
        case (opcode) 
        3'b000: //Forward of first input
            out = in_1;
        3'b001: // Addition
            out = in_1 + in_2; 
        3'b010: // Subtraction
            out = in_1 - in_2;
        3'b011: // Logical NOT of first input
            out = ~in_1;
        3'b100: //Logical OR 
            out = in_1 | in_2;
        3'b101: //Logical AND
            out = in_1 & in_2;
        3'b110: //Logical XOR
            out = in_1 ^ in_2;
        3'b111: //left shift by two
            out = in_1<<2 ;
        endcase
    end
end

endmodule
