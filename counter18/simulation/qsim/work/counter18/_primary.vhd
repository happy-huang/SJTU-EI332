library verilog;
use verilog.vl_types.all;
entity counter18 is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        ld              : in     vl_logic;
        counter         : out    vl_logic_vector(4 downto 0);
        data            : in     vl_logic_vector(4 downto 0)
    );
end counter18;
