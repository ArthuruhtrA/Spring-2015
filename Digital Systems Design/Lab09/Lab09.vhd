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
-- CREATED		"Thu Apr 02 13:34:19 2015"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Lab09 IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		RST :  IN  STD_LOGIC;
		SIN :  IN  STD_LOGIC;
		SL :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC;
		B :  IN  STD_LOGIC;
		C :  IN  STD_LOGIC;
		D :  IN  STD_LOGIC;
		QA :  OUT  STD_LOGIC;
		QB :  OUT  STD_LOGIC;
		QC :  OUT  STD_LOGIC;
		QD :  OUT  STD_LOGIC
	);
END Lab09;

ARCHITECTURE bdf_type OF Lab09 IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	DFF_inst1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	DFF_inst2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	DFF_inst3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;


BEGIN 
QA <= DFF_inst1;
QB <= DFF_inst2;
QC <= DFF_inst3;
SYNTHESIZED_WIRE_20 <= '1';




PROCESS(CLK,RST,SYNTHESIZED_WIRE_20)
BEGIN
IF (RST = '0') THEN
	DFF_inst1 <= '0';
ELSIF (SYNTHESIZED_WIRE_20 = '0') THEN
	DFF_inst1 <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	DFF_inst1 <= SYNTHESIZED_WIRE_0;
END IF;
END PROCESS;


SYNTHESIZED_WIRE_13 <= SIN AND SYNTHESIZED_WIRE_2;


SYNTHESIZED_WIRE_12 <= SL AND A;


SYNTHESIZED_WIRE_15 <= DFF_inst1 AND SYNTHESIZED_WIRE_3;


SYNTHESIZED_WIRE_14 <= SL AND B;


SYNTHESIZED_WIRE_17 <= DFF_inst2 AND SYNTHESIZED_WIRE_4;


SYNTHESIZED_WIRE_16 <= SL AND C;


SYNTHESIZED_WIRE_19 <= DFF_inst3 AND SYNTHESIZED_WIRE_5;


SYNTHESIZED_WIRE_18 <= SL AND D;


SYNTHESIZED_WIRE_2 <= NOT(SL);



SYNTHESIZED_WIRE_3 <= NOT(SL);



PROCESS(CLK,RST,SYNTHESIZED_WIRE_20)
BEGIN
IF (RST = '0') THEN
	DFF_inst2 <= '0';
ELSIF (SYNTHESIZED_WIRE_20 = '0') THEN
	DFF_inst2 <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	DFF_inst2 <= SYNTHESIZED_WIRE_6;
END IF;
END PROCESS;


SYNTHESIZED_WIRE_4 <= NOT(SL);



SYNTHESIZED_WIRE_5 <= NOT(SL);



PROCESS(CLK,RST,SYNTHESIZED_WIRE_20)
BEGIN
IF (RST = '0') THEN
	DFF_inst3 <= '0';
ELSIF (SYNTHESIZED_WIRE_20 = '0') THEN
	DFF_inst3 <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	DFF_inst3 <= SYNTHESIZED_WIRE_8;
END IF;
END PROCESS;


PROCESS(CLK,RST,SYNTHESIZED_WIRE_20)
BEGIN
IF (RST = '0') THEN
	QD <= '0';
ELSIF (SYNTHESIZED_WIRE_20 = '0') THEN
	QD <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	QD <= SYNTHESIZED_WIRE_10;
END IF;
END PROCESS;


SYNTHESIZED_WIRE_0 <= SYNTHESIZED_WIRE_12 OR SYNTHESIZED_WIRE_13;


SYNTHESIZED_WIRE_6 <= SYNTHESIZED_WIRE_14 OR SYNTHESIZED_WIRE_15;


SYNTHESIZED_WIRE_8 <= SYNTHESIZED_WIRE_16 OR SYNTHESIZED_WIRE_17;


SYNTHESIZED_WIRE_10 <= SYNTHESIZED_WIRE_18 OR SYNTHESIZED_WIRE_19;


END bdf_type;