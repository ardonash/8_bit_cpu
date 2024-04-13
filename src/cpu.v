module cpu(
    input wire clk,
    input wire rst,
    input wire in_1,
    input wire in_2,
    input wire reg_in,
    input wire PC_Inst,
    input wire inst_wr_en,
    input wire inst_addr,
    input wire wr_en,
    input wire reg_addr,
    input wire op_addr_1,
    input wire op_addr_2,
    
    output wire reg_out,
    output wire inst_out,

);
cpu_registers registers(
    .wr_en  (wr_en),  // input, wire, 
    .rst    (rst),  // input, wire, 
    .addr   (reg_addr),  // input, wire, 
    .in     (reg_in),  // input, wire [3:0], 
    .out    (reg_out)   // output, wire [3:0], 
);
cpu_registers inst_mem (
    .wr_en  (inst_wr_en),  // input, wire, 
    .rst    (rst),  // input, wire, 
    .addr   (inst_addr),  // input, wire, 
    .in     (inst_in),  // input, wire [3:0], 
    .out    (inst_out)   // output, wire [3:0], 
);

alu u_alu (
    .clk    (clk),  // input, wire, 
    .en     (en),
    .opcode (opcode),  // input, wire [2:0], 
    .in_1   (in_1),  // input, wire [3:0], 
    .in_2   (in_2),  // input, wire [3:0], 
    .out    (out)   // output, wire [3:0], 
);


// always @(posedge clk)begin
//     case(PC_Inst)
//     2'b00: //Loading of Instruction + Input Registers
//     2'b01: //Execution of Instruction Set
//     2'b10: //Output of Results
//     2'b11: //Idle where we wait for rst or maintain output
//     endcase
// end
// always @(*)begin
//     case(PC_Inst)
//     2'b00: //Loading of Instruction + Input Registers
        
//     2'b01: //Execution of Instruction Set
//     2'b10: //Output of Results
//     2'b11: //Idle where we wait for rst or maintain output
//     endcase
// end

endmodule