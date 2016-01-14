--------------------------------------------------
-- Company      : RIT
-- Author       : Ari Sanders
-- Created      : 15:55:00 04/21/2015
--
-- Project name : Lab11
-- File         : full_adder.vhd
--
-- Entity       : full_adder
-- Architecture : df (data flow)
--
-- Tool version : VHDL'93
-- Description  : The following is the entity and
--                behavioral description of a
--                1-bit full adder.
--
-- Notes        :
--------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
port (
    f_a     : in std_logic;
    f_b     : in std_logic;
    f_ci    : in std_logic;

    f_s     : out std_logic;
    f_co    : out std_logic
    );
end full_adder;

architecture df of full_adder is
-- signal declarations
signal s_1, s_2, s_3  : std_logic:='0';
begin
  -- model of a 2-input XOR gate to calculate Sum
  f_s <= f_a xor f_b;

  -- three instances of a 2-input AND gate models
  -- intermediate calculations for Cout
  s_1 <= A and B;
  s_2 <= A and Cin;
  s_3 <= B and Cin;

  -- model of a 3-input OR gate to calculate Cout
  Cout <= s_1 or s_2 or s_3;

  --alternative model for calculating Cout
  --Cout <= (A and B) or (A and Cin) or (B and Cin);
end;

architecture struct of full_adder is
-- component declaration for the full adder circuit
component hadder is
port  (A, B : in std_logic;
       Y    : out std_logic);
end component;

component or_gate is
port  (A, B : in std_logic;
       Y    : out std_logic);
end component;

--signal declarations
signal s_1, s_2, s_3  : std_logic:='0';

begin
-- component instantiation for calculating Sum
xor3_instance1  : xor3 port map (A=>A,  B=>B, C=>Cin, Y=>Sum);

-- component instantioations for calculating Cout
and2_instance1  : and2 port map (A=>A,  B=>B, Y=>s_1);
and2_instance2  : and2 port map (A=>A,  B=>Cin, Y=>s_2);
and2_instance3  : and2 port map (A=>Cin,  B=>B, Y=>s_3);

or3_instance1 : or3 port map (A=>s_1, B=>s_2, C=>s_3, Y=>Cout);

end;
