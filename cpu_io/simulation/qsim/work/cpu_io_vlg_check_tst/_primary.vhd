library verilog;
use verilog.vl_types.all;
entity cpu_io_vlg_check_tst is
    port(
        HL              : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end cpu_io_vlg_check_tst;
