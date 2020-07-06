library verilog;
use verilog.vl_types.all;
entity decode2to4 is
    port(
        Y               : out    vl_logic_vector(3 downto 0);
        Ena             : in     vl_logic;
        A1              : in     vl_logic;
        A2              : in     vl_logic
    );
end decode2to4;
