library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LFSR is
    Port (
        clk    : in  STD_LOGIC;
        rst    : in  STD_LOGIC;
        enable : in  STD_LOGIC;
        rnd    : out STD_LOGIC_VECTOR(31 downto 0)
    );
end LSFR;

architecture BEHAV of LFSR is
    signal lfsr_reg : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal feedback : STD_LOGIC;
begin

    feedback <= lfsr_reg(31) xor lfsr_reg(21) xor lfsr_reg(1) xor lfsr_reg(0);

    process(clk, rst)
    begin
        if rst = '1' then
            lfsr_reg <= x"ACE1ACE1";
        elsif rising_edge(clk) then
            if enable = '1' then
                lfsr_reg <= feedback & lfsr_reg(31 downto 1);
            end if;
        end if;
    end process;

    rnd <= lfsr_reg;

end BEHAV;

