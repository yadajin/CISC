LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY MCOMMAND IS
PORT(
     T2,T3,T4:IN STD_LOGIC; 
     D:IN STD_LOGIC_VECTOR(19 DOWNTO 0);
     LOAD,LDPC,LDAR,LDIR,LDRI,LDPSW,RS_B,S2,S1,S0:OUT STD_LOGIC;
     ALU_B,SW_B,LED_B,RD_D,CS_D,RAM_B,CS_I,ADDR_B,P1,P2:OUT STD_LOGIC        
    );
END  MCOMMAND;
ARCHITECTURE A OF MCOMMAND IS
SIGNAL DATAOUT:STD_LOGIC_VECTOR(19 DOWNTO 0);
BEGIN 
PROCESS(T2)
    BEGIN
        IF(T2'EVENT AND T2='1') THEN
             DATAOUT(19 DOWNTO 0)<=D(19 DOWNTO 0);
        END IF;
        LOAD<=DATAOUT(19);
        LDPC<=DATAOUT(18) AND T4;
        LDAR<=DATAOUT(17) AND T3;
        LDIR<=DATAOUT(16) AND T3;
        LDRI<=DATAOUT(15) AND T4;
        LDPSW<=DATAOUT(14) AND T4;
        RS_B<=DATAOUT(13);
        S2<=DATAOUT(12);
        S1<=DATAOUT(11);
        S0<=DATAOUT(10);
        ALU_B<=DATAOUT(9);
        SW_B<=DATAOUT(8);
        LED_B<=DATAOUT(7);
        RD_D<=NOT(NOT DATAOUT(6) AND (T2 OR T3));
        CS_D<=NOT(NOT DATAOUT(5) AND T3);
        RAM_B<=DATAOUT(4);
        CS_I<=DATAOUT(3);
        ADDR_B<=DATAOUT(2);
        P1<=DATAOUT(1);
        P2<=DATAOUT(0);
    END PROCESS;
END A;

