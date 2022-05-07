    .data     #data segment
    .align 2  #aling the next string on a word boundary
outpAuth: .asciiz "Gino Chiudioni presenting nthFibonacci.\n"
    .align 2  #aling the next string on a word boundary
outpPrompt: .asciiz "Enter an integer greater than 0:  "
    .align 2  #aling the next string on a word boundary
outpN: .asciiz "You entered: "
    .align 2  #aling the next string on a word boundary
outpResult: .asciiz "Your fibonacci number is "
    .align 2  #aling the next string on a word boundary
newLine: .asciiz "\n"	
    .text #code section
    .globl    main

main:

# Sys call displaying author

  la $a0, outpAuth  #print str sys call needs address of string in $a0
  li $v0, 4         #4 in $v0 for print string system call
  syscall

# Sys call to promp input

  la $a0, outpPrompt
  li $v0, 4
  syscall
  
# store user inputted integer

  li $v0, 5         # system call 5 for inputting integer
                    # get return values
  syscall
  move $s5, $v0     # move entered value into $s5

# display user entered integer

  la $a0, outpN
  li $v0, 4
  syscall
  la $a0, ($s5)
  li $v0, 1
  syscall
  la $a0, newLine
  li $v0, 4
  syscall
  
# nth fibonacci code

  li $t2, 0                 #0th fibonacci number; n==0
  li $t3, 1                 #st fibonacci number; n==1
                            # $s5 stores n
  beq $s5, $0, nZero        #if n==0 result is 0; end
  beq $s5, $1, nOne         #if n==1 result is 1; end
  li $t1, 3                 #set iterator to 3
  j for_loop                #ensure jump to for_loop
 
  for_loop:                 # for loop for if n is greater than 1
    bgt $t1, $s5, end_for   #if iterator is greater than n, jump to end
    add $s4, $t2, $t3       # add $t2 and $t3 for next fibonacci number
    move $t2, $t3           #numbers shift down for next iteration
    move $t3, $s4           #numbers shift down for next iteration
    addi $t1, $t1, 1        #iterate $t1
    j for_loop              #beginning of loop
  
                            #if value entered is 0:
  nZero:
    li $s4, 0               #result is 0
    j end_for               #end
    
                            #if value entered is 1:
  nOne:
    li $s4, 0              #result is 0
    j end_for               #end
    
  end_for:
    la $a0, outpResult      #string for result in $a0
    li $v0, 4               # $v0 is 4 for outputting string
    syscall
    
    la $a0, ($s4)             # load result in $a0
    li $v0, 1               # $v0 is 1 for int print sys call
    syscall
    
    li $v0, 10              #system code for exit
    syscall
    
