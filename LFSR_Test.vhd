library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_lsfr is
-- Testbenches have no ports
end tb_lsfr;

architecture Behavioral of tb_lsfr is

    -- Component declaration for the DUT (your LFSR)
    component LSFR
        Port (
            clk    : in  STD_LOGIC;
            rst    : in  STD_LOGIC;
            enable : in  STD_LOGIC;
            rnd    : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    -- Signals to drive the DUT
    signal clk_tb    : STD_LOGIC := '0';
    signal rst_tb    : STD_LOGIC := '0';
    signal enable_tb : STD_LOGIC := '0';
    signal rnd_tb    : STD_LOGIC_VECTOR(31 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the DUT
    uut: LSFR
        Port map (
            clk    => clk_tb,
            rst    => rst_tb,
            enable => enable_tb,
            rnd    => rnd_tb
        );

    -- Clock generation: toggles clk_tb every 5 ns (period = 10 ns)
    clk_process: process
    begin
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Apply reset
        rst_tb <= '1';
        enable_tb <= '0';
        wait for 20 ns;

        rst_tb <= '0';
        wait for 10 ns;

        -- Enable shifting
        enable_tb <= '1';

        -- Let it run for 100 clock cycles
        wait for 100 * clk_period;

        -- Disable shifting for a while
        enable_tb <= '0';
        wait for 50 ns;

        -- Re-enable shifting
        enable_tb <= '1';
        wait for 50 * clk_period;

        -- Finish simulation
        wait;
    end process;

end Behavioral;
