LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY PC IS
PORT(
       LOAD,LDPC,CLR: IN STD_LOGIC;
       D: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       Q: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
     );
END PC;

ARCHITECTURE A OF PC IS
SIGNAL QOUT: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    PROCESS(LDPC,CLR,LOAD)
    BEGIN 
         IF(CLR='0') THEN
            QOUT<="00000000";
         ELSIF(LDPC'EVENT AND LDPC='1') THEN
            IF(LOAD='0') THEN
                QOUT<=D;  --BUS->PC
            ELSE
                QOUT<=QOUT+1; --PC+1
            END IF;
         END IF;
    END PROCESS;
    Q<=QOUT;
END A;

