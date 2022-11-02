;*****************************************************************
;* This stationery serves as the framework for a                 *
;* user application (single file, absolute assembly application) *
;* For a more comprehensive program that                         *
;* demonstrates the more advanced functionality of this          *
;* processor, please see the demonstration applications          *
;* located in the examples subdirectory of the                   *
;* Freescale CodeWarrior for the HC12 Program directory          *
;*****************************************************************


;*****************************************************************
;* This is an unsigned multiply operation                        *          
;*****************************************************************



; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc'                      
                                                 

              
                ORG    $3000         
              
MULTIPLICAND    FCB    05            ;Set the multiplicand to be 5, first digit of student ID
MULTIPLIER      FCB    07            ;Set the multiplier to be 7, last digit of student ID
PRODUCT         FDB    1             ;Reserve two bytes of memory for the Product 


                ORG    $4000

Entry:
_Startup:

              
                
                LDAA  MULTIPLICAND    ;Load multiplicand into accumulator A
                LDAB  MULTIPLIER      ;Load multiplier into accumulator B
                MUL                   ;Multiply accumulator A and B 
                STD   PRODUCT         ;Store product into accumulator D
                SWI
            

;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
