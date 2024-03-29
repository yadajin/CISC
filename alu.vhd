LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
ENTITY ALU IS
PORT(
     X: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
     Y: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	 S2,S1,S0: IN STD_LOGIC;
     ALUOUT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0) ;
     CF,ZF: OUT STD_LOGIC
    );
END ALU;

ARCHITECTURE A OF ALU IS
SIGNAL AA,BB,TEMP:STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL TEMP1:STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL TEMP2:STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN 
    PROCESS
	BEGIN 
        IF(S2='0' AND S1='0' AND S0='0') THEN	--ADD
            AA<='0'&X;
            BB<='0'&Y;
            TEMP<=AA+BB;
			ALUOUT<=TEMP(7 DOWNTO 0);
            CF<=TEMP(8);
            IF (TEMP="100000000" OR TEMP="000000000") THEN
                ZF<='1';
            ELSE
                ZF<='0';
            END IF;
		ELSIF(S2='0' AND S1='0' AND S0='1') THEN    --TEST
			CF<=X(7);
			IF (X="00000000") THEN
                ZF<='1';
            ELSE
                ZF<='0';
            END IF;
		
        ELSIF(S2='0' AND S1='1' AND S0='1') THEN     --DEC
            AA<='0'&Y;
            TEMP<=AA-1;
 			ALUOUT<=TEMP(7 DOWNTO 0);
            CF<=TEMP(8);
            IF (TEMP="000000000") THEN
                ZF<='1';
            ELSE
                ZF<='0';
            END IF;
		ELSIF(S2='1' AND S1='0' AND S0='0') THEN     --MUL
            TEMP2<=X * Y;
 			ALUOUT<=TEMP2(7 DOWNTO 0);
         
        ELSIF(S2='1' AND S1='1' AND S0='0') THEN     --Rd->BUS
 			ALUOUT<=Y;
		ELSE
		    ALUOUT<="00000000" ;
		    CF<='0';
            ZF<='0';
        END IF;
    END PROCESS;
END A;

