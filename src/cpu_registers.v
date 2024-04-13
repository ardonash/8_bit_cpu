module cpu_registers(
    input wire wr_en,
    input wire rst,
    input wire [7:0]addr,
    input wire [3:0] in,
    output wire [3:0] out
);
reg [3:0] RAM[7:0];
always @(posedge clk) begin
    if (!rst) begin
      out <= 4'b0;
      for (int i = 0; i < (8); i++) begin
        RAM[i] <= 4'b0;
      end
    end else begin
        if (wr_en) begin
            RAM[addr] <= in;
        end
        out <= RAM[addr];
    end
end
endmodule