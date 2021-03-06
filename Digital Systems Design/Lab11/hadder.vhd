--------------------------------------------------
-- Company      : RIT
-- Author       : Ari Sanders
-- Created      : 16:17:00 04/21/2015
--
-- Project name : Lab11
-- File         : hadder.vhd
--
-- Entity       : hadder
-- Architecture : df (data flow)
--
-- Tool version : VHDL'93
-- Description  : The following is the entity and
--                behavioral description of a
--                1-bit half adder.
--
-- Notes        :
--------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity hadder is
port (                        -- half adder inputs;
      h_a     : in std_logic;   -- A, active high
      h_b     : in std_logic;   -- B, active high

                              -- half adder outputs:
      h_s   : out std_logic;  -- Sum, active high
      h_co  : out std_logic); -- Carry Out, active high
end hadder;

architecture df of hadder is
begin
  -- model of a 2-input XOR gate to calculate Sum
  h_s <= h_a xor h_b;

  -- model of a 2-input AND gate to calculate Cout
  h_co <= h_a and h_b;
end;

architecture struct of hadder is
-- component declaration for the half adder circuit
component xor2 is
port  (A, B  : in std_logic;
       Y        : out std_logic);
end component;

component and2 is
port  (A, B : in std_logic;
       Y    : out std_logic);
end component;

begin
-- component instantiation for calculating Sum
xor2_instance1  : xor2 port map (A=>h_a,  B=>h_b, Y=>h_s);

-- component instantioations for calculating Cout
and2_instance1  : and2 port map (A=>h_a,  B=>h_b, Y=>h_co);

end;
