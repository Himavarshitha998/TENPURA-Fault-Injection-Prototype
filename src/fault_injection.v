`timescale 1ns/1ps

// Small educational fault-injection demonstration.
// Golden output = normal 4-bit addition.
// Faulty output = golden output with one selected bit inverted.
module fault_injection (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       fault_enable,
    input  wire [2:0] fault_bit,
    output wire [4:0] golden_sum,
    output reg  [4:0] faulty_sum,
    output wire       error_detected
);

    assign golden_sum = {1'b0, a} + {1'b0, b};

    always @* begin
        faulty_sum = golden_sum;

        if (fault_enable) begin
            if (fault_bit < 5)
                faulty_sum[fault_bit] = ~golden_sum[fault_bit];
        end
    end

    assign error_detected = (golden_sum != faulty_sum);

endmodule
