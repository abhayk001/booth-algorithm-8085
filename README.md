# booth-algorithm-8085
This is an implementation of Booth's Algorithm for multiplication of two numbers in 8085 assembly language.
Since 8085 is an 8-bit microprocessor, this algorithm is also only capable of multiplying two 8 bit numbers.
The simulator used for this was GNU8085.
Link to the simulator: https://sourceforge.net/projects/gnusim8085/
The process is pretty straightforward accroding to the Booth's algorithm, except that 8085 assembly language has no arithmetic right shift operator.
To solve this, the "rar" operator, rotate accumulator to right including carry was used, and the sign register was also used.
The last Q-1, Qn+1 bit, however you know of it, is implemented with the carry flag register, as flag registers are the only 1 bit registers you can modify.
The "push psw" and  "pop psw" commands were used to save the status of flag variables.
