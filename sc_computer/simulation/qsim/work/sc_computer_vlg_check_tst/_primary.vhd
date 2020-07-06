library verilog;
use verilog.vl_types.all;
entity sc_computer_vlg_check_tst is
    port(
        aluout          : in     vl_logic_vector(31 downto 0);
        dmem_clk        : in     vl_logic;
        imem_clk        : in     vl_logic;
        inst            : in     vl_logic_vector(31 downto 0);
        io_read_data    : in     vl_logic_vector(31 downto 0);
        mem_dataout     : in     vl_logic_vector(31 downto 0);
        memout          : in     vl_logic_vector(31 downto 0);
        out_port0       : in     vl_logic_vector(31 downto 0);
        out_port1       : in     vl_logic_vector(31 downto 0);
        out_port2       : in     vl_logic_vector(31 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end sc_computer_vlg_check_tst;
