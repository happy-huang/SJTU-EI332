library verilog;
use verilog.vl_types.all;
entity test is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        out1            : out    vl_logic;
        out2            : out    vl_logic
    );
end test;
