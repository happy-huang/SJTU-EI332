library verilog;
use verilog.vl_types.all;
entity counter18_vlg_check_tst is
    port(
        counter         : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end counter18_vlg_check_tst;
