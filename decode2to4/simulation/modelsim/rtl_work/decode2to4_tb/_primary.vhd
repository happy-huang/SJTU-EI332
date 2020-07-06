library verilog;
use verilog.vl_types.all;
entity decode2to4_tb is
    port(
        Y               : out    vl_logic_vector(3 downto 0)
    );
end decode2to4_tb;
