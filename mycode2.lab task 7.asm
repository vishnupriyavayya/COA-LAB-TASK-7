ORG 100h             
; Display message: "Enter the first single digit: "
MOV AH, 09h            ; Function 09h is used to display a string
MOV DX, OFFSET msg_input1 ; Load the address of the input message into DX
INT 21h                ; DOS interrupt to display message
; Read the first single digit from the user
MOV AH, 01h            ; Function 01h is used to read a character from input
INT 21h                ; DOS interrupt to get the character
SUB AL, '0'            ; Convert ASCII digit to actual number
MOV BL, AL             ; Store the first digit in BL
; Display message: "Enter the second single digit: "
MOV AH, 09h            ; Function 09h is used to display a string
MOV DX, OFFSET msg_input2 ; Load the address of the input message into DX
INT 21h                ; DOS interrupt to display message
; Read the second single digit from the user
MOV AH, 01h            ; Function 01h is used to read a character from input
INT 21h                ; DOS interrupt to get the character
SUB AL, '0'            ; Convert ASCII digit to actual number
MOV BH, AL             ; Store the second digit in BH
; Subtract the second digit from the first
SUB BL, BH             ; Subtract BH (second digit) from BL (first digit)
; Display message: "The result of subtraction is: "
MOV AH, 09h            ; Function 09h is used to display a string
MOV DX, OFFSET msg_output ; Load the address of the output message into DX
INT 21h                ; DOS interrupt to display the message
; Check if the result is negative
CMP BL, 0              ; Compare the result with 0
JGE PrintResult        ; If result is >= 0, jump to print result
; If the result is negative, print the minus sign
MOV DL, '-'            ; Load the minus sign into DL
MOV AH, 02h            ; Function 02h to print a single character
INT 21h                ; DOS interrupt to print the minus sign
; Convert the negative result to positive
NEG BL                 ; Negate the result to make it positive
PrintResult:
; Convert result to ASCII and print
ADD BL, '0'            ; Convert result back to ASCII
MOV DL, BL             ; Move result into DL for printing
MOV AH, 02h            ; Function 02h is used to print a single character
INT 21h                ; DOS interrupt to print the result
; End the program
MOV AH, 4Ch            ; Function 4Ch is used to terminate the program
INT 21h                ; DOS interrupt to exit
msg_input1  DB 'Enter the first single digit: $'   
msg_input2  DB 0Dh, 0Ah, 'Enter the second single digit: $'  
msg_output  DB 0Dh, 0Ah, 'The result of subtraction is: $'  
END             
