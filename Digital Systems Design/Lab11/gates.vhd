-----------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity xor3 is
port (A, B, C : in std_logic;
      Y       : out std_logic);
end xor3;
  
architecture df of xor3 is
begin
  Y <= A xor B xor C after 7 ns;
end;
-----------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity xor2 is
port (A, B : in std_logic;
      Y    : out std_logic);
end xor2;

architecture df of xor2 is
begin
  Y <= A xor B after 5 ns;
end;
-----------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity and2 is
port  (A, B : in std_logic;
       Y    : out std_logic);
end and2;

architecture df of and2 is
begin
    Y <= A and B after 2 ns;
end;
-----------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity or3 is
port  (A, B, C  : in std_logic;
       Y        : out std_logic);
end or3;

architecture df of or3 is
begin
Y <= A or B or C after 3 ns;
end;
-----------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
port  (or_a, or_b  : in std_logic;
       or_x     : out std_logic);
end or_gate;

architecture df of or_gate is
begin
or_x <= or_a or or_b after 2 ns;
end;
