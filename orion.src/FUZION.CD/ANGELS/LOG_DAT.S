	lea	logo+34,a0
	lea	buf_log,a1
	move.w	#64*20-1,d0
cop	move.w	(a0),(a1)+
	lea	8(a0),a0
	dbf	d0,cop
	
	clr.w	-(sp)
	pea	nom
	move.w	#$3c,-(sp)
	trap	#1
	lea	8(sp),sp
	move.w	d0,d7
	
	pea	buf_log
	move.l	#64*20*2,-(sp)
	move.w	d7,-(sp)
	move	#$40,-(sp)
	trap	#1
	lea	12(sp),sp
	
	move.w	d7,-(sp)
	move	#$3e,-(sp)
	trap	#1
	addq	#4,sp	
	
	clr.l	-(sp)
	trap	#1
	
logo	incbin	logo_def.pi1
buf_log	ds.b	64*20*2
nom	dc.b	"logo.dat",0