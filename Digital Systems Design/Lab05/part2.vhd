-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"
-- CREATED		"Tue Feb 24 16:48:18 2015"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY part2 IS 
	PORT
	(
		A :  IN  STD_LOGIC;
		B :  IN  STD_LOGIC;
		C :  IN  STD_LOGIC;
		D :  IN  STD_LOGIC;
		F :  OUT  STD_LOGIC
	);
END part2;

ARCHITECTURE bdf_type OF part2 IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_5 <= B AND C;


SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_0 AND SYNTHESIZED_WIRE_1;


SYNTHESIZED_WIRE_3 <= A AND SYNTHESIZED_WIRE_2;


SYNTHESIZED_WIRE_6 <= D AND SYNTHESIZED_WIRE_3;


SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_4 OR SYNTHESIZED_WIRE_5;


F <= SYNTHESIZED_WIRE_6 OR SYNTHESIZED_WIRE_7;


SYNTHESIZED_WIRE_0 <= NOT(A);



SYNTHESIZED_WIRE_1 <= NOT(D);



SYNTHESIZED_WIRE_2 <= NOT(C);



END bdf_type;