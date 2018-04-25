********************************************************************************************************************.
***  SPSS 16 NLT syntax specifically tailored to assess Implicit Partner Evaluations.                            ***.
***  Main difference being that letter preferences toward partner's initials are examined and                    ***.
***  letter baselines are calculated on individuals whose own *and* partner's initials don't include that letter!***.
********************************************************************************************************************.

***Created by Etienne P. LeBel, August 2008. 

***Please cite: 
*********************************************************************************************************************
***LeBel, E. P., & Campbell, L. (2009). Implicit partner affect, relationship satisfaction, and
*** the prediction of romantic breakup. Journal of Experimental Social Psychology, 45, 1291-1294.
*********************************************************************************************************************.

***INPUT data file requirements to run the syntax are:***.
*1: 26 variables (named A through Z) containing letter ratings for all letters of the alphabet.
*2: Two variables (named init1 and init2) containing participants' first and second name initials without spaces, periods, or any other punctuations.
*3: Two variables (named pinit1 and pinit2) containing participants' romantic partner's first and second name initials without spaces, etc.
***TO SUCCESSFULLY AGGREGATE NLT SCORES, YOU MUST RUN ENTIRE SYNTAX***.

***include only cases with complete data***.
SELECT IF NOT MISSING(a) and NOT MISSING(b) and NOT MISSING(c) and NOT MISSING(d) and NOT MISSING(e) and NOT MISSING(f) and NOT MISSING(g) and NOT MISSING(h) and NOT MISSING(i) and NOT MISSING(j) and NOT MISSING(k) and NOT MISSING(l) and NOT MISSING(m) and NOT MISSING(n) and NOT MISSING(o) and NOT MISSING(p) and NOT MISSING(q) and NOT MISSING(r) and NOT MISSING(s) and NOT MISSING(t) and NOT MISSING(u) and NOT MISSING(v) and NOT MISSING(w) and NOT MISSING(x) and NOT MISSING(y) and NOT MISSING(z)  and init1<>"" and init1<>"." and init1<>".." and init2<>"" and init2<>"." and init2<>".." and pinit1<>"" and pinit1<>"." and pinit1<>".." and pinit2<>"" and pinit2<>"." and pinit2<>".." . 
execute.
***include only nonredundant data***.
SELECT IF NOT(a = b and b=c and c=d and d=e and e=f and f=g and g=h and h=i and i=j and j=k and k=l and l=m and m=n and n=o and o=p and p=q and q=r and r=s and s=t and t=u and u=v and v=w and w=x and x=y and y=z).
execute.

compute init1 = LOWER(init1).
compute init2 = LOWER(init2).
compute pinit1 = LOWER(pinit1).
compute pinit2 = LOWER(pinit2).
execute.

*****************.
***B-algorithm***.
*****************.
***first, calculate normative baselines***.
if (init1<>'a' and init2<>'a' and pinit1<>'a' and pinit2<>'a') pnonA = a.
if (init1<>'b' and init2<>'b' and pinit1<>'b' and pinit2<>'b') pnonB = b.
if (init1<>'c' and init2<>'c' and pinit1<>'c' and pinit2<>'c') pnonC = c.
if (init1<>'d' and init2<>'d' and pinit1<>'d' and pinit2<>'d') pnonD = d.
if (init1<>'e' and init2<>'e' and pinit1<>'e' and pinit2<>'e') pnonE = e.
if (init1<>'f' and init2<>'f' and pinit1<>'f' and pinit2<>'f') pnonF = f.
if (init1<>'g' and init2<>'g' and pinit1<>'g' and pinit2<>'g') pnonG = g.
if (init1<>'h' and init2<>'h' and pinit1<>'h' and pinit2<>'h') pnonH = h.
if (init1<>'i' and init2<>'i' and pinit1<>'i' and pinit2<>'i') pnonI = i.
if (init1<>'j' and init2<>'j' and pinit1<>'j' and pinit2<>'j') pnonJ = j.
if (init1<>'k' and init2<>'k' and pinit1<>'k' and pinit2<>'k') pnonK = k.
if (init1<>'l' and init2<>'l' and pinit1<>'l' and pinit2<>'l') pnonL = l.
if (init1<>'m' and init2<>'m' and pinit1<>'m' and pinit2<>'m') pnonM = m.
if (init1<>'n' and init2<>'n' and pinit1<>'n' and pinit2<>'n') pnonN = n.
if (init1<>'o' and init2<>'o' and pinit1<>'o' and pinit2<>'o') pnonO = o.
if (init1<>'p' and init2<>'p' and pinit1<>'p' and pinit2<>'p') pnonP = p.
if (init1<>'q' and init2<>'q' and pinit1<>'q' and pinit2<>'q') pnonQ = q.
if (init1<>'r' and init2<>'r' and pinit1<>'r' and pinit2<>'r') pnonR = r.
if (init1<>'s' and init2<>'s' and pinit1<>'s' and pinit2<>'s') pnonS = s.
if (init1<>'t' and init2<>'t' and pinit1<>'t' and pinit2<>'t') pnonT = t.
if (init1<>'u' and init2<>'u' and pinit1<>'u' and pinit2<>'u') pnonU = u.
if (init1<>'v' and init2<>'v' and pinit1<>'v' and pinit2<>'v') pnonV = v.
if (init1<>'w' and init2<>'w' and pinit1<>'w' and pinit2<>'w') pnonW = w.
if (init1<>'x' and init2<>'x' and pinit1<>'x' and pinit2<>'x') pnonX = x.
if (init1<>'y' and init2<>'y' and pinit1<>'y' and pinit2<>'y') pnonY = y.
if (init1<>'z' and init2<>'z' and pinit1<>'z' and pinit2<>'z') pnonZ = z.
execute.

COMPUTE nobreak=1.
AGGREGATE OUTFILE='c:\temp.sav'
	/PRESORTED
	/BREAK=nobreak
	/pbaseA=MEAN(pnonA)
	/pbaseB=MEAN(pnonB)
	/pbaseC=MEAN(pnonC)
	/pbaseD=MEAN(pnonD)
	/pbaseE=MEAN(pnonE)
	/pbaseF=MEAN(pnonF)
	/pbaseG=MEAN(pnonG)
	/pbaseH=MEAN(pnonH)
	/pbaseI=MEAN(pnonI)
	/pbaseJ=MEAN(pnonJ)
	/pbaseK=MEAN(pnonK)
	/pbaseL=MEAN(pnonL)
	/pbaseM=MEAN(pnonM)
	/pbaseN=MEAN(pnonN)
	/pbaseO=MEAN(pnonO)
	/pbaseP=MEAN(pnonP)
	/pbaseQ=MEAN(pnonQ)
	/pbaseR=MEAN(pnonR)
	/pbaseS=MEAN(pnonS)
	/pbaseT=MEAN(pnonT)
	/pbaseU=MEAN(pnonU)
	/pbaseV=MEAN(pnonV)
	/pbaseW=MEAN(pnonW)
	/pbaseX=MEAN(pnonX)
	/pbaseY=MEAN(pnonY)
	/pbaseZ=MEAN(pnonZ).
execute.

MATCH FILES FILE=*
	/TABLE='c:\temp.sav'
	/BY=nobreak.
execute.

***assign respective raw letter ratings***.
do if (pinit1='a').
compute pinit1RAW = a.
else if (pinit1='b').
compute pinit1RAW = b.
else if (pinit1='c').
compute pinit1RAW = c.
else if (pinit1='d').
compute pinit1RAW = d.
else if (pinit1='e').
compute pinit1RAW = e.
else if (pinit1='f').
compute pinit1RAW = f.
else if (pinit1='g').
compute pinit1RAW = g.
else if (pinit1='h').
compute pinit1RAW = h.
else if (pinit1='i').
compute pinit1RAW = i.
else if (pinit1='j').
compute pinit1RAW = j.
else if (pinit1='k').
compute pinit1RAW = k.
else if (pinit1='l').
compute pinit1RAW = l.
else if (pinit1='m').
compute pinit1RAW = m.
else if (pinit1='n').
compute pinit1RAW = n.
else if (pinit1='o').
compute pinit1RAW = o.
else if (pinit1='p').
compute pinit1RAW = p.
else if (pinit1='q').
compute pinit1RAW = q.
else if (pinit1='r').
compute pinit1RAW = r.
else if (pinit1='s').
compute pinit1RAW = s.
else if (pinit1='t').
compute pinit1RAW = t.
else if (pinit1='u').
compute pinit1RAW = u.
else if (pinit1='v').
compute pinit1RAW = v.
else if (pinit1='w').
compute pinit1RAW = w.
else if (pinit1='x').
compute pinit1RAW = x.
else if (pinit1='y').
compute pinit1RAW = y.
else if (pinit1='z').
compute pinit1RAW = z.
end if.
execute.

do if (pinit2='a').
compute pinit2RAW = a.
else if (pinit2='b').
compute pinit2RAW = b.
else if (pinit2='c').
compute pinit2RAW = c.
else if (pinit2='d').
compute pinit2RAW = d.
else if (pinit2='e').
compute pinit2RAW = e.
else if (pinit2='f').
compute pinit2RAW = f.
else if (pinit2='g').
compute pinit2RAW = g.
else if (pinit2='h').
compute pinit2RAW = h.
else if (pinit2='i').
compute pinit2RAW = i.
else if (pinit2='j').
compute pinit2RAW = j.
else if (pinit2='k').
compute pinit2RAW = k.
else if (pinit2='l').
compute pinit2RAW = l.
else if (pinit2='m').
compute pinit2RAW = m.
else if (pinit2='n').
compute pinit2RAW = n.
else if (pinit2='o').
compute pinit2RAW = o.
else if (pinit2='p').
compute pinit2RAW = p.
else if (pinit2='q').
compute pinit2RAW = q.
else if (pinit2='r').
compute pinit2RAW = r.
else if (pinit2='s').
compute pinit2RAW = s.
else if (pinit2='t').
compute pinit2RAW = t.
else if (pinit2='u').
compute pinit2RAW = u.
else if (pinit2='v').
compute pinit2RAW = v.
else if (pinit2='w').
compute pinit2RAW = w.
else if (pinit2='x').
compute pinit2RAW = x.
else if (pinit2='y').
compute pinit2RAW = y.
else if (pinit2='z').
compute pinit2RAW = z.
end if.
execute.

if (pinit1='a') pnltB1=pinit1RAW-pbaseA.
if (pinit1='b') pnltB1=pinit1RAW-pbaseB.
if (pinit1='c') pnltB1=pinit1RAW-pbaseC.
if (pinit1='d') pnltB1=pinit1RAW-pbaseD.
if (pinit1='e') pnltB1=pinit1RAW-pbaseE.
if (pinit1='f') pnltB1=pinit1RAW-pbaseF.
if (pinit1='g') pnltB1=pinit1RAW-pbaseG.
if (pinit1='h') pnltB1=pinit1RAW-pbaseH.
if (pinit1='i') pnltB1=pinit1RAW-pbaseI.
if (pinit1='j') pnltB1=pinit1RAW-pbaseJ.
if (pinit1='k') pnltB1=pinit1RAW-pbaseK.
if (pinit1='l') pnltB1=pinit1RAW-pbaseL.
if (pinit1='m') pnltB1=pinit1RAW-pbaseM.
if (pinit1='n') pnltB1=pinit1RAW-pbaseN.
if (pinit1='o') pnltB1=pinit1RAW-pbaseO.
if (pinit1='p') pnltB1=pinit1RAW-pbaseP.
if (pinit1='q') pnltB1=pinit1RAW-pbaseQ.
if (pinit1='r') pnltB1=pinit1RAW-pbaseR.
if (pinit1='s') pnltB1=pinit1RAW-pbaseS.
if (pinit1='t') pnltB1=pinit1RAW-pbaseT.
if (pinit1='u') pnltB1=pinit1RAW-pbaseU.
if (pinit1='v') pnltB1=pinit1RAW-pbaseV.
if (pinit1='w') pnltB1=pinit1RAW-pbaseW.
if (pinit1='x') pnltB1=pinit1RAW-pbaseX.
if (pinit1='y') pnltB1=pinit1RAW-pbaseY.
if (pinit1='z') pnltB1=pinit1RAW-pbaseZ.
execute.

if (pinit2='a') pnltB2=pinit2RAW-pbaseA.
if (pinit2='b') pnltB2=pinit2RAW-pbaseB.
if (pinit2='c') pnltB2=pinit2RAW-pbaseC.
if (pinit2='d') pnltB2=pinit2RAW-pbaseD.
if (pinit2='e') pnltB2=pinit2RAW-pbaseE.
if (pinit2='f') pnltB2=pinit2RAW-pbaseF.
if (pinit2='g') pnltB2=pinit2RAW-pbaseG.
if (pinit2='h') pnltB2=pinit2RAW-pbaseH.
if (pinit2='i') pnltB2=pinit2RAW-pbaseI.
if (pinit2='j') pnltB2=pinit2RAW-pbaseJ.
if (pinit2='k') pnltB2=pinit2RAW-pbaseK.
if (pinit2='l') pnltB2=pinit2RAW-pbaseL.
if (pinit2='m') pnltB2=pinit2RAW-pbaseM.
if (pinit2='n') pnltB2=pinit2RAW-pbaseN.
if (pinit2='o') pnltB2=pinit2RAW-pbaseO.
if (pinit2='p') pnltB2=pinit2RAW-pbaseP.
if (pinit2='q') pnltB2=pinit2RAW-pbaseQ.
if (pinit2='r') pnltB2=pinit2RAW-pbaseR.
if (pinit2='s') pnltB2=pinit2RAW-pbaseS.
if (pinit2='t') pnltB2=pinit2RAW-pbaseT.
if (pinit2='u') pnltB2=pinit2RAW-pbaseU.
if (pinit2='v') pnltB2=pinit2RAW-pbaseV.
if (pinit2='w') pnltB2=pinit2RAW-pbaseW.
if (pinit2='x') pnltB2=pinit2RAW-pbaseX.
if (pinit2='y') pnltB2=pinit2RAW-pbaseY.
if (pinit2='z') pnltB2=pinit2RAW-pbaseZ.
execute.



*****************.
***I-algorithm***.
*****************.

***compute mean non-initial and non-partnerInitial ratings within-participant***.
compute pmeanNonInitials = mean(pnonA,pnonB,pnonC,pnonD,pnonE,pnonF,pnonG,pnonH,pnonI,pnonJ,pnonK,pnonL,pnonM,pnonN,pnonO,pnonP,pnonQ,pnonR,pnonS,pnonT,pnonU,pnonV,pnonW,pnonX,pnonY,pnonZ).
execute.

***to adjust for mean non-initials within-participants before computing normative baselines***.
compute pips_a = a - pmeanNonInitials.
compute pips_b = b - pmeanNonInitials.
compute pips_c = c - pmeanNonInitials.
compute pips_d = d - pmeanNonInitials.
compute pips_e = e - pmeanNonInitials.
compute pips_f = f - pmeanNonInitials.
compute pips_g = g - pmeanNonInitials.
compute pips_h = h - pmeanNonInitials.
compute pips_i = i - pmeanNonInitials.
compute pips_j = j - pmeanNonInitials.
compute pips_k = k - pmeanNonInitials.
compute pips_l = l - pmeanNonInitials.
compute pips_m = m - pmeanNonInitials.
compute pips_n = n - pmeanNonInitials.
compute pips_o = o - pmeanNonInitials.
compute pips_p = p - pmeanNonInitials.
compute pips_q = q - pmeanNonInitials.
compute pips_r = r - pmeanNonInitials.
compute pips_s = s - pmeanNonInitials.
compute pips_t = t - pmeanNonInitials.
compute pips_u = u - pmeanNonInitials.
compute pips_v = v - pmeanNonInitials.
compute pips_w = w - pmeanNonInitials.
compute pips_x = x - pmeanNonInitials.
compute pips_y = y - pmeanNonInitials.
compute pips_z = z - pmeanNonInitials.
execute.

if (init1<>'a' and init2<>'a' and pinit1<>'a' and pinit2<>'a') pnonIpsA = pips_a.
if (init1<>'b' and init2<>'b' and pinit1<>'b' and pinit2<>'b') pnonIpsB = pips_b.
if (init1<>'c' and init2<>'c' and pinit1<>'c' and pinit2<>'c') pnonIpsC = pips_c.
if (init1<>'d' and init2<>'d' and pinit1<>'d' and pinit2<>'d') pnonIpsD = pips_d.
if (init1<>'e' and init2<>'e' and pinit1<>'e' and pinit2<>'e') pnonIpsE = pips_e.
if (init1<>'f' and init2<>'f' and pinit1<>'f' and pinit2<>'f') pnonIpsF = pips_f.
if (init1<>'g' and init2<>'g' and pinit1<>'g' and pinit2<>'g') pnonIpsG = pips_g.
if (init1<>'h' and init2<>'h' and pinit1<>'h' and pinit2<>'h') pnonIpsH = pips_h.
if (init1<>'i' and init2<>'i' and pinit1<>'i' and pinit2<>'i') pnonIpsI = pips_i.
if (init1<>'j' and init2<>'j' and pinit1<>'j' and pinit2<>'j') pnonIpsJ = pips_j.
if (init1<>'k' and init2<>'k' and pinit1<>'k' and pinit2<>'k') pnonIpsK = pips_k.
if (init1<>'l' and init2<>'l' and pinit1<>'l' and pinit2<>'l') pnonIpsL = pips_l.
if (init1<>'m' and init2<>'m' and pinit1<>'m' and pinit2<>'m') pnonIpsM = pips_m.
if (init1<>'n' and init2<>'n' and pinit1<>'n' and pinit2<>'n') pnonIpsN = pips_n.
if (init1<>'o' and init2<>'o' and pinit1<>'o' and pinit2<>'o') pnonIpsO = pips_o.
if (init1<>'p' and init2<>'p' and pinit1<>'p' and pinit2<>'p') pnonIpsP = pips_p.
if (init1<>'q' and init2<>'q' and pinit1<>'q' and pinit2<>'q') pnonIpsQ = pips_q.
if (init1<>'r' and init2<>'r' and pinit1<>'r' and pinit2<>'r') pnonIpsR = pips_r.
if (init1<>'s' and init2<>'s' and pinit1<>'s' and pinit2<>'s') pnonIpsS = pips_s.
if (init1<>'t' and init2<>'t' and pinit1<>'t' and pinit2<>'t') pnonIpsT = pips_t.
if (init1<>'u' and init2<>'u' and pinit1<>'u' and pinit2<>'u') pnonIpsU = pips_u.
if (init1<>'v' and init2<>'v' and pinit1<>'v' and pinit2<>'v') pnonIpsV = pips_v.
if (init1<>'w' and init2<>'w' and pinit1<>'w' and pinit2<>'w') pnonIpsW = pips_w.
if (init1<>'x' and init2<>'x' and pinit1<>'x' and pinit2<>'x') pnonIpsX = pips_x.
if (init1<>'y' and init2<>'y' and pinit1<>'y' and pinit2<>'y') pnonIpsY = pips_y.
if (init1<>'z' and init2<>'z' and pinit1<>'z' and pinit2<>'z') pnonIpsZ = pips_z.
execute.

AGGREGATE OUTFILE='c:\temp2.sav'
	/PRESORTED
	/BREAK=nobreak
	/pbaseIpsA=MEAN(pnonIpsA)
	/pbaseIpsB=MEAN(pnonIpsB)
	/pbaseIpsC=MEAN(pnonIpsC)
	/pbaseIpsD=MEAN(pnonIpsD)
	/pbaseIpsE=MEAN(pnonIpsE)
	/pbaseIpsF=MEAN(pnonIpsF)
	/pbaseIpsG=MEAN(pnonIpsG)
	/pbaseIpsH=MEAN(pnonIpsH)
	/pbaseIpsI=MEAN(pnonIpsI)
	/pbaseIpsJ=MEAN(pnonIpsJ)
	/pbaseIpsK=MEAN(pnonIpsK)
	/pbaseIpsL=MEAN(pnonIpsL)
	/pbaseIpsM=MEAN(pnonIpsM)
	/pbaseIpsN=MEAN(pnonIpsN)
	/pbaseIpsO=MEAN(pnonIpsO)
	/pbaseIpsP=MEAN(pnonIpsP)
	/pbaseIpsQ=MEAN(pnonIpsQ)
	/pbaseIpsR=MEAN(pnonIpsR)
	/pbaseIpsS=MEAN(pnonIpsS)
	/pbaseIpsT=MEAN(pnonIpsT)
	/pbaseIpsU=MEAN(pnonIpsU)
	/pbaseIpsV=MEAN(pnonIpsV)
	/pbaseIpsW=MEAN(pnonIpsW)
	/pbaseIpsX=MEAN(pnonIpsX)
	/pbaseIpsY=MEAN(pnonIpsY)
	/pbaseIpsZ=MEAN(pnonIpsZ).
execute.

MATCH FILES FILE=*
	/TABLE='c:\temp2.sav'
	/BY=nobreak.
execute.

***assign respective ipsatized letter ratings***.
do if (pinit1='a').
compute pinit1_Ips = pips_a.
else if (pinit1='b').
compute pinit1_Ips = pips_b.
else if (pinit1='c').
compute pinit1_Ips = pips_c.
else if (pinit1='d').
compute pinit1_Ips = pips_d.
else if (pinit1='e').
compute pinit1_Ips = pips_e.
else if (pinit1='f').
compute pinit1_Ips = pips_f.
else if (pinit1='g').
compute pinit1_Ips = pips_g.
else if (pinit1='h').
compute pinit1_Ips = pips_h.
else if (pinit1='i').
compute pinit1_Ips = pips_i.
else if (pinit1='j').
compute pinit1_Ips = pips_j.
else if (pinit1='k').
compute pinit1_Ips = pips_k.
else if (pinit1='l').
compute pinit1_Ips = pips_l.
else if (pinit1='m').
compute pinit1_Ips = pips_m.
else if (pinit1='n').
compute pinit1_Ips = pips_n.
else if (pinit1='o').
compute pinit1_Ips = pips_o.
else if (pinit1='p').
compute pinit1_Ips = pips_p.
else if (pinit1='q').
compute pinit1_Ips = pips_q.
else if (pinit1='r').
compute pinit1_Ips = pips_r.
else if (pinit1='s').
compute pinit1_Ips = pips_s.
else if (pinit1='t').
compute pinit1_Ips = pips_t.
else if (pinit1='u').
compute pinit1_Ips = pips_u.
else if (pinit1='v').
compute pinit1_Ips = pips_v.
else if (pinit1='w').
compute pinit1_Ips = pips_w.
else if (pinit1='x').
compute pinit1_Ips = pips_x.
else if (pinit1='y').
compute pinit1_Ips = pips_y.
else if (pinit1='z').
compute pinit1_Ips = pips_z.
end if.
execute.

do if (pinit2='a').
compute pinit2_Ips = pips_a.
else if (pinit2='b').
compute pinit2_Ips = pips_b.
else if (pinit2='c').
compute pinit2_Ips = pips_c.
else if (pinit2='d').
compute pinit2_Ips = pips_d.
else if (pinit2='e').
compute pinit2_Ips = pips_e.
else if (pinit2='f').
compute pinit2_Ips = pips_f.
else if (pinit2='g').
compute pinit2_Ips = pips_g.
else if (pinit2='h').
compute pinit2_Ips = pips_h.
else if (pinit2='i').
compute pinit2_Ips = pips_i.
else if (pinit2='j').
compute pinit2_Ips = pips_j.
else if (pinit2='k').
compute pinit2_Ips = pips_k.
else if (pinit2='l').
compute pinit2_Ips = pips_l.
else if (pinit2='m').
compute pinit2_Ips = pips_m.
else if (pinit2='n').
compute pinit2_Ips = pips_n.
else if (pinit2='o').
compute pinit2_Ips = pips_o.
else if (pinit2='p').
compute pinit2_Ips = pips_p.
else if (pinit2='q').
compute pinit2_Ips = pips_q.
else if (pinit2='r').
compute pinit2_Ips = pips_r.
else if (pinit2='s').
compute pinit2_Ips = pips_s.
else if (pinit2='t').
compute pinit2_Ips = pips_t.
else if (pinit2='u').
compute pinit2_Ips = pips_u.
else if (pinit2='v').
compute pinit2_Ips = pips_v.
else if (pinit2='w').
compute pinit2_Ips = pips_w.
else if (pinit2='x').
compute pinit2_Ips = pips_x.
else if (pinit2='y').
compute pinit2_Ips = pips_y.
else if (pinit2='z').
compute pinit2_Ips = pips_z.
end if.
execute.

if (pinit1='a') pnltI1=pinit1_Ips-pbaseIpsA.
if (pinit1='b') pnltI1=pinit1_Ips-pbaseIpsB.
if (pinit1='c') pnltI1=pinit1_Ips-pbaseIpsC.
if (pinit1='d') pnltI1=pinit1_Ips-pbaseIpsD.
if (pinit1='e') pnltI1=pinit1_Ips-pbaseIpsE.
if (pinit1='f') pnltI1=pinit1_Ips-pbaseIpsF.
if (pinit1='g') pnltI1=pinit1_Ips-pbaseIpsG.
if (pinit1='h') pnltI1=pinit1_Ips-pbaseIpsH.
if (pinit1='i') pnltI1=pinit1_Ips-pbaseIpsI.
if (pinit1='j') pnltI1=pinit1_Ips-pbaseIpsJ.
if (pinit1='k') pnltI1=pinit1_Ips-pbaseIpsK.
if (pinit1='l') pnltI1=pinit1_Ips-pbaseIpsL.
if (pinit1='m') pnltI1=pinit1_Ips-pbaseIpsM.
if (pinit1='n') pnltI1=pinit1_Ips-pbaseIpsN.
if (pinit1='o') pnltI1=pinit1_Ips-pbaseIpsO.
if (pinit1='p') pnltI1=pinit1_Ips-pbaseIpsP.
if (pinit1='q') pnltI1=pinit1_Ips-pbaseIpsQ.
if (pinit1='r') pnltI1=pinit1_Ips-pbaseIpsR.
if (pinit1='s') pnltI1=pinit1_Ips-pbaseIpsS.
if (pinit1='t') pnltI1=pinit1_Ips-pbaseIpsT.
if (pinit1='u') pnltI1=pinit1_Ips-pbaseIpsU.
if (pinit1='v') pnltI1=pinit1_Ips-pbaseIpsV.
if (pinit1='w') pnltI1=pinit1_Ips-pbaseIpsW.
if (pinit1='x') pnltI1=pinit1_Ips-pbaseIpsX.
if (pinit1='y') pnltI1=pinit1_Ips-pbaseIpsY.
if (pinit1='z') pnltI1=pinit1_Ips-pbaseIpsZ.
execute.

if (pinit2='a') pnltI2=pinit2_Ips-pbaseIpsA.
if (pinit2='b') pnltI2=pinit2_Ips-pbaseIpsB.
if (pinit2='c') pnltI2=pinit2_Ips-pbaseIpsC.
if (pinit2='d') pnltI2=pinit2_Ips-pbaseIpsD.
if (pinit2='e') pnltI2=pinit2_Ips-pbaseIpsE.
if (pinit2='f') pnltI2=pinit2_Ips-pbaseIpsF.
if (pinit2='g') pnltI2=pinit2_Ips-pbaseIpsG.
if (pinit2='h') pnltI2=pinit2_Ips-pbaseIpsH.
if (pinit2='i') pnltI2=pinit2_Ips-pbaseIpsI.
if (pinit2='j') pnltI2=pinit2_Ips-pbaseIpsJ.
if (pinit2='k') pnltI2=pinit2_Ips-pbaseIpsK.
if (pinit2='l') pnltI2=pinit2_Ips-pbaseIpsL.
if (pinit2='m') pnltI2=pinit2_Ips-pbaseIpsM.
if (pinit2='n') pnltI2=pinit2_Ips-pbaseIpsN.
if (pinit2='o') pnltI2=pinit2_Ips-pbaseIpsO.
if (pinit2='p') pnltI2=pinit2_Ips-pbaseIpsP.
if (pinit2='q') pnltI2=pinit2_Ips-pbaseIpsQ.
if (pinit2='r') pnltI2=pinit2_Ips-pbaseIpsR.
if (pinit2='s') pnltI2=pinit2_Ips-pbaseIpsS.
if (pinit2='t') pnltI2=pinit2_Ips-pbaseIpsT.
if (pinit2='u') pnltI2=pinit2_Ips-pbaseIpsU.
if (pinit2='v') pnltI2=pinit2_Ips-pbaseIpsV.
if (pinit2='w') pnltI2=pinit2_Ips-pbaseIpsW.
if (pinit2='x') pnltI2=pinit2_Ips-pbaseIpsX.
if (pinit2='y') pnltI2=pinit2_Ips-pbaseIpsY.
if (pinit2='z') pnltI2=pinit2_Ips-pbaseIpsZ.
execute.



compute pnltB = MEAN(pnltB1,pnltB2).
compute pnltI = MEAN(pnltI1,pnltI2).
execute.

SAVE OUTFILE="c:\pNLT_OUTPUT.sav".

RELIABILITY
  /VARIABLES=pnltB1 pnltB2
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA.

RELIABILITY
  /VARIABLES=pnltI1 pnltI2
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA.



