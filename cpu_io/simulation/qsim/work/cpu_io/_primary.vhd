library verilog;
use verilog.vl_types.all;
entity cpu_io is
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        HL              : out    vl_logic_vector(31 downto 0)
    );
end cpu_io;
