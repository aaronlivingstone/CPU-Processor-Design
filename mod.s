MOD:

	lui $r2 0       # make sure $r2 is 0
	lw $r0 0($r2)    #load mem 0 and 1
	lw $r1 1($r2)
	sw $r3 0($r2)
	lui $r3 0       # make sure $r3 is 0 
	
	slt $r2 $r1 $r3
	beq $r2 $r3 EXITABS  # if not less than 0, skip abs func

ABS:
	addi $r2 $r1 0
	sub $r1 $r1 $r2
	sub $r1 $r1 $r2
EXITABS:

SUBCYCLE:
	sub $r2 $r0 $r1
	slt $r2 $r2 $r3
	bne $r2 $r3 EXITSUBCYCLE
	sub $r0 $r0 $r1	
	j SUBCYCLE
EXITSUBCYCLE:
	sw $r0 2($r3)
	
	
	lui $r0 0
	lw $r3 0($r0)
	jr $r3
	