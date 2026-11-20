`timescale 1ns/1ps

module tb_fault_injection;

    reg  [3:0] a;
    reg  [3:0] b;
    reg        fault_enable;
    reg  [2:0] fault_bit;

    wire [4:0] golden_sum;
    wire [4:0] faulty_sum;
    wire       error_detected;

    integer test_number;

    fault_injection dut (
        .a(a),
        .b(b),
        .fault_enable(fault_enable),
        .fault_bit(fault_bit),
        .golden_sum(golden_sum),
        .faulty_sum(faulty_sum),
        .error_detected(error_detected)
    );

    initial begin
        $dumpfile("simulation/fault_injection.vcd");
        $dumpvars(0, tb_fault_injection);

        $display("------------------------------------------------");
        $display(" TENPURA-INSPIRED FAULT INJECTION DEMONSTRATION");
        $display("------------------------------------------------");

        // Test 1: Normal operation; no fault is injected.
        test_number = 1;
        a = 4'd3;
        b = 4'd2;
        fault_enable = 1'b0;
        fault_bit = 3'd0;
        #10;
        show_result();

        // Test 2: Inject a fault into output bit 0.
        test_number = 2;
        a = 4'd3;
        b = 4'd2;
        fault_enable = 1'b1;
        fault_bit = 3'd0;
        #10;
        show_result();

        // Test 3: Inject a fault into output bit 2.
        test_number = 3;
        a = 4'd4;
        b = 4'd3;
        fault_enable = 1'b1;
        fault_bit = 3'd2;
        #10;
        show_result();

        // Test 4: Another normal operation.
        test_number = 4;
        a = 4'd7;
        b = 4'd1;
        fault_enable = 1'b0;
        fault_bit = 3'd2;
        #10;
        show_result();

        $display("------------------------------------------------");
        $display("Simulation completed.");
        $finish;
    end

    task show_result;
        begin
            $display("Test %0d: A=%0d B=%0d FaultEnable=%b FaultBit=%0d",
                     test_number, a, b, fault_enable, fault_bit);
            $display("  Golden output = %0d (%b)", golden_sum, golden_sum);
            $display("  Faulty output = %0d (%b)", faulty_sum, faulty_sum);

            if (error_detected)
                $display("  RESULT: FAULT DETECTED - outputs are different.");
            else
                $display("  RESULT: NO OUTPUT MISMATCH - outputs are equal.");

            $display("");
        end
    endtask

endmodule
