# gcc -O3 -o assignment3.exe assignment3.s

.section .data        # memory variables

input: .asciz "%d"    # number of elements input (Integer)
doubleInput: .asciz "%lf" # Elements input (Double)
outsum: .asciz "sum=%f "     # sum output
outavg: .asciz "avg=%f\n"     # avg output
n: .int 0             
avg: .double 0.0         
s: .double 0.0
sum: .double 0.0

.section .text        
.globl _main          

_main:                
	pushl $n
	pushl $input      
	call _scanf       
	add $8, %esp	    
	movl $0 ,%ecx
	#############################Sum Double Values###################################################
	loop1:
		fldl sum           
		pushl %ecx        
		pushl $s+4          
		pushl $s
		pushl $doubleInput      
		call _scanf       
		add $12, %esp		
		faddl s
		fstpl sum
		popl %ecx          
		add $1, %ecx
		cmpl %ecx, n       
		ja loop1      
   ################################################################################################
	pushl sum+4
	pushl sum
	pushl $outsum      
	call _printf       
	add $12, %esp   
   ################################################################################################
   ####################################Calculate the avg###########################################
    fildl n           
	fldl sum
    fdivp %st(0), %st(1)  
	fstpl avg
   ################################################################################################
	pushl avg+4
	pushl avg
	pushl $outavg      
	call _printf       
	add $12, %esp   
	ret
