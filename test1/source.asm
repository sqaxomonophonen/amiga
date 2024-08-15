ExecBase = 4
OpenLibrary = -552
CloseLibrary = -414
Write = -48
Output = -60

init:
        move.l  ExecBase,a2
        move.l  a2,a6
        lea     doslib,a1
        moveq   #0,d0
        jsr     OpenLibrary(a6)
        tst.l   d0
        beq.s   done
        move.l  d0,a6       ; a6 keeps DosBase while we use it
        jsr     Output(a6)
        move.l  d0,d1
        move.l  #msg,d2
        move.l  #msglen,d3
        jsr     Write(a6)
        move.l  a6,a1
        move.l  a2,a6                   ; Exec call
        jsr     CloseLibrary(a6)

done:
	moveq.l #0,d0
        rts

doslib  dc.b    "dos.library",0
msg     dc.b    "Hej verden!",10
msglen = *-msg
