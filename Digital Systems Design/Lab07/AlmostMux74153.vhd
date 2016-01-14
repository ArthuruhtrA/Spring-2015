-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 14.1.1 Build 190 01/19/2015 SJ Web Edition"
-- CREATED		"Wed Mar 18 21:12:15 2015"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY AlmostMux74153 IS 
	PORT
	(
		B :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC;
		Y :  OUT  STD_LOGIC
	);
END AlmostMux74153;

ARCHITECTURE bdf_type OF AlmostMux74153 IS 

SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_15 <= '0';
SYNTHESIZED_WIRE_17 <= '1';



PROCESS(SYNTHESIZED_WIRE_15,SYNTHESIZED_WIRE_16)
BEGIN
if (SYNTHESIZED_WIRE_16 = '1') THEN
	SYNTHESIZED_WIRE_19 <= SYNTHESIZED_WIRE_15;
ELSE
	SYNTHESIZED_WIRE_19 <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_17,A)
BEGIN
if (A = '1') THEN
	SYNTHESIZED_WIRE_19 <= SYNTHESIZED_WIRE_17;
ELSE
	SYNTHESIZED_WIRE_19 <= 'Z';
END IF;
END PROCESS;



PROCESS(SYNTHESIZED_WIRE_18,SYNTHESIZED_WIRE_5)
BEGIN
if (SYNTHESIZED_WIRE_5 = '1') THEN
	Y <= SYNTHESIZED_WIRE_18;
ELSE
	Y <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_17,SYNTHESIZED_WIRE_16)
BEGIN
if (SYNTHESIZED_WIRE_16 = '1') THEN
	SYNTHESIZED_WIRE_20 <= SYNTHESIZED_WIRE_17;
ELSE
	SYNTHESIZED_WIRE_20 <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_15,A)
BEGIN
if (A = '1') THEN
	SYNTHESIZED_WIRE_20 <= SYNTHESIZED_WIRE_15;
ELSE
	SYNTHESIZED_WIRE_20 <= 'Z';
END IF;
END PROCESS;


SYNTHESIZED_WIRE_11 <= NOT(B);



SYNTHESIZED_WIRE_16 <= NOT(A);



PROCESS(SYNTHESIZED_WIRE_19,SYNTHESIZED_WIRE_11)
BEGIN
if (SYNTHESIZED_WIRE_11 = '1') THEN
	SYNTHESIZED_WIRE_18 <= SYNTHESIZED_WIRE_19;
ELSE
	SYNTHESIZED_WIRE_18 <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_20,B)
BEGIN
if (B = '1') THEN
	SYNTHESIZED_WIRE_18 <= SYNTHESIZED_WIRE_20;
ELSE
	SYNTHESIZED_WIRE_18 <= 'Z';
END IF;
END PROCESS;


SYNTHESIZED_WIRE_5 <= NOT(SYNTHESIZED_WIRE_15);




END bdf_type;