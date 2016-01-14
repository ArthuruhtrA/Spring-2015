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
-- CREATED		"Thu Mar 19 11:49:35 2015"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY d_latch IS 
	PORT
	(
		D :  IN  STD_LOGIC;
		C :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC;
		Qn :  OUT  STD_LOGIC
	);
END d_latch;

ARCHITECTURE bdf_type OF d_latch IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;


BEGIN 
Q <= SYNTHESIZED_WIRE_3;
Qn <= SYNTHESIZED_WIRE_0;



SYNTHESIZED_WIRE_3 <= NOT(SYNTHESIZED_WIRE_0 AND SYNTHESIZED_WIRE_1);


SYNTHESIZED_WIRE_0 <= NOT(SYNTHESIZED_WIRE_2 AND SYNTHESIZED_WIRE_3);


SYNTHESIZED_WIRE_1 <= NOT(SYNTHESIZED_WIRE_7 AND D);


SYNTHESIZED_WIRE_2 <= NOT(SYNTHESIZED_WIRE_5 AND SYNTHESIZED_WIRE_7);


SYNTHESIZED_WIRE_5 <= NOT(D);



SYNTHESIZED_WIRE_7 <= NOT(C);



END bdf_type;