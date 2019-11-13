LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MUX4_2 IS
PORT(
	 R0,R1,R2,R3:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
     I9,I8:IN STD_LOGIC;
	 X:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END MUX4_2;
ARCHITECTURE A OF MUX4_2 IS
SIGNAL SEL:STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	PROCESS
	BEGIN
		IF(I9='0' AND I8='0')THEN
			X<=R0;
		ELSIF(I9='0' AND I8='1')THEN
			X<=R1;
		ELSIF(I9='1' AND I8='0')THEN
			X<=R2;
		ELSE
			X<=R3;
		END IF;
	END PROCESS;
END A;

