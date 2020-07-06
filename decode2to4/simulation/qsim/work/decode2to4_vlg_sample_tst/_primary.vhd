library verilog;
use verilog.vl_types.all;
entity decode2to4_vlg_sample_tst is
    port(
        A1              : in     vl_logic;
        A2              : in     vl_logic;
        Ena             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end decode2to4_vlg_sample_tst;
