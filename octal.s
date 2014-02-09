OCTAL:	
	# make sure registers are zero'd
	lui $r0 0  
	lui $r1 0
	lui $r2 0
	
	lw $r0 0($r0)
	# load 7,8,9 bits into r2
	addi $r1 $r1 0x6
	addi $r2 $r2 0x7
	sllv $r2 $r2 $r1
	and $r2 $r2 $r0
	
	# shift r2 by 2
	lui $r1 0
	addi $r1 $r1 2
	sllv $r2 $r2 $r1
	
	#load 4,5,6 bits into r1 and shift 1
	andi $r1 $r0 0x38
	lui $r0 0
	addi $r0 $r0 1
	sllv $r1 $r1 $r0
	
	lui $r0 0
	lw $r0 0($r0)
	andi $r0 $r0 7
	or $r0 $r0 $r1
	or $r2 $r2 $r0
	
	disp $r2 0
	jr   $r3
