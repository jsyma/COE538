;*****************************************************************
;* This stationery serves as the framework for a                 *
;* user application (single file, absolute assembly application) *
;* For a more comprehensive program that                         *
;* demonstrates the more advanced functionality of this          *
;* processor, please see the demonstration applications          *
;* located in the examples subdirectory of the                   *
;* Freescale CodeWarrior for the HC12 Program directory          *
;*****************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions 
		INCLUDE 'derivative.inc' 

            ORG   $3000


Entry:
_Startup:
            ORG   $4000
            
            BSET  DDRP,%11111111  ;Configure Port P for output (LED2 cntrl)
            BSET  DDRE,%00010000  ;Configure Pin PE4 for output (enable bit)
            BCLR  PORTE,%00010000 ;Enable keypad
            
Loop        LDAA  PTS
            LSRA                  ;Read a key code into AccA
            LSRA                  ;Shift Right AccA
            LSRA                  ;Shift Right AccA
            LSRA                  ;Shift Right AccA
            STAA  PTP             ;Output AccA content to LED2
            BRA   Loop            ;Loop

;**************************************************************
;*                 Interrupt Vectors                          *
;**************************************************************
            ORG   $FFFE
            DC.W  Entry           ; Reset Vector
