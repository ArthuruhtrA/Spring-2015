--------------------------------------------------
-- Company      : RIT
-- Author       : Marcin Lukowiak
-- Created      : 10:15:00 03/12/2013
--
-- Project name : lab6_1
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
port (                        -- full adder inputs;
      A     : in std_logic;   -- A, active high
      B     : in std_logic;   -- B, active high
      Cin   : in std_logic;   -- Carry In, active high
        
                              -- full adder outputs:
      Sum   : out std_logic;  -- Sum, active high
      Cout  : out std_logic); -- Carry Out, active high
end full_adder;

architecture df of full_adder is
-- signal declarations
signal s_1, s_2, s_3  : std_logic:='0';
begin
  -- model of a 3-input XOR gate to calculate Sum
  Sum <= A xor B xor Cin;
    
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
component xor3 is
port  (A, B, C  : in std_logic;
       Y        : out std_logic);
end component;

component and2 is
port  (A, B : in std_logic;
       Y    : out std_logic);
end component;

component or3 is
port  (A, B, C  : in std_logic;
       Y        : out std_logic);
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

architecture ari of full_adder is
-- component declaration for the full adder circuit
component hadder is
port  (h_a, h_b  : in std_logic;
       h_s, h_co : out std_logic);
end component;

component or_gate is
port  (or_a, or_b : in std_logic;
       or_x       : out std_logic);
end component;

--signal declarations
signal s1, s2, s3  : std_logic:='0';

begin
-- component instantiation for calculating f_s
hadder_instance1  : hadder port map (h_a=>A,  h_b=>B, h_s=>s1, h_co=>s2);
hadder_instance2  : hadder port map (h_a=>s1,  h_b=>Cin, h_s=>Sum, h_co=>s3);

-- component instantioations for calculating f_co
or_gate_instance1 : or_gate port map (or_a=>s3, or_b=>s2, or_x=>Cout);

end;
