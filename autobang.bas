0 S=54272:V=53280:FORD=1TO9:READX(D),Y(D):NEXT:POKES+24,15:POKES+1,2:POKEV+1,13
1 POKEV,13:POKES,120:INPUT"AUTOBANG!<Z X> Q=QUIT";K$:POKES+5,0:IFK$="Q"THENEND
2 POKES+6,240:POKES+4,33:T=5:C=20:SC=0:FORL=1TO10:PRINT"-STAGE:"L"-":FORN=1TOD
3 FORZ=1TOY(N):T=T+X(N):O=T+L:W=21-L:PRINTSPC(O)"   "SPC(W)"   "
4 POKE55336+C,6:POKE55376+C,6:POKE1064+C,149:SC=SC+L*10:GETK$:IFK$="X"THENC=C+1
5 IFN>1THENFORI=1TORND(1)*L/2:R=RND(1)*W:POKE56257+O+R,5:POKE1985+O+R,65:NEXT
6 IFK$="Z"THENC=C-1:DATA0,30: REM AUTOBANG!2021-BY-DRP**BASIC-10-LINER-CONTEST
7 IFPEEK(1104+C)<>32THENPOKES+4,129:R$="BANG!!! -GAME OVER-":GOTO9
8 NEXTZ,N,L:R$="GOAL!":POKES+1,30:DATA0,30,-.5,10,.5,20,0,30,-2,5,0,9,2,5,-.5,10
9 PRINT""R$" SCORE:"SC:FORI=0TO120:POKEV,I/8:POKES,120-I:NEXT:POKES+4,0:GOTO1