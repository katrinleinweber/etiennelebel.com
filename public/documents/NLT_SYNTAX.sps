***SPSS 15 syntax to compute NLT scores for 5 different scoring algorithms***.
***Created by Etienne LeBel, June 18, 2008. 

***Please cite: 
***********************************************************************************
***LeBel, E. P., & Gawronski, B. (2009). How to find what's in a name: 
***Scrutinizing the optimality of five scoring algorithms for the name-letter task. 
***European Journal of Personality, 23, 85-106.
***********************************************************************************.

***INPUT data file requirements to run the syntax are:***.
*1: 26 variables (named A through Z) containing letter ratings for all letters of the alphabet.
*2: A variable (named initials) containing participants' first and second initials without spaces, periods, or any other punctuations.
***[OR two variables (named init1 and init2) containing participants' first and second initials, respectively (again without punctuations)].
***TO SUCCESSFULLY AGGREGATE NLT SCORES, YOU MUST RUN ENTIRE SYNTAX***.

***this section creates two separate string variables for first and second initials***.
***if you already have init1 and init2 variables, this code will be ignored***.
STRING init1 (A1).
COMPUTE init1 = SUBSTR(initials,1) .
EXECUTE .
STRING init2 (A1).
COMPUTE init2 = SUBSTR(initials,2) .
EXECUTE . 

***this command includes only cases with complete and nonredundant data***.
SELECT IF NOT MISSING(a) and NOT MISSING(b) and NOT MISSING(c) and NOT MISSING(d) and NOT MISSING(e) and NOT MISSING(f) and NOT MISSING(g) and NOT MISSING(h) and NOT MISSING(i) and NOT MISSING(j) and NOT MISSING(k) and NOT MISSING(l) and NOT MISSING(m) and NOT MISSING(n) and NOT MISSING(o) and NOT MISSING(p) and NOT MISSING(q) and NOT MISSING(r) and NOT MISSING(s) and NOT MISSING(t) and NOT MISSING(u) and NOT MISSING(v) and NOT MISSING(w) and NOT MISSING(x) and NOT MISSING(y) and NOT MISSING(z)  and init1<>"" and init2<>"" and init1<>"." and init2<>"." and init1<>".." and init2<>".." and NOT(a = b and b=c and c=d and d=e and e=f and f=g and g=h and h=i and i=j and j=k and k=l and l=m and m=n and n=o and o=p and p=q and q=r and r=s and s=t and t=u and u=v and v=w and w=x and x=y and y=z).
execute.

SAVE OUTFILE="c:\NLT_OUTPUT.sav".

compute init1 = LOWER(init1).
compute init2 = LOWER(init2).
execute.

*****************.
***B-algorithm***.
*****************.
***first, calculate normative baselines***.
if (init1<>'a' and init2<>'a') nonA = a.
if (init1<>'b' and init2<>'b') nonB = b.
if (init1<>'c' and init2<>'c') nonC = c.
if (init1<>'d' and init2<>'d') nonD = d.
if (init1<>'e' and init2<>'e') nonE = e.
if (init1<>'f' and init2<>'f') nonF = f.
if (init1<>'g' and init2<>'g') nonG = g.
if (init1<>'h' and init2<>'h') nonH = h.
if (init1<>'i' and init2<>'i') nonI = i.
if (init1<>'j' and init2<>'j') nonJ = j.
if (init1<>'k' and init2<>'k') nonK = k.
if (init1<>'l' and init2<>'l') nonL = l.
if (init1<>'m' and init2<>'m') nonM = m.
if (init1<>'n' and init2<>'n') nonN = n.
if (init1<>'o' and init2<>'o') nonO = o.
if (init1<>'p' and init2<>'p') nonP = p.
if (init1<>'q' and init2<>'q') nonQ = q.
if (init1<>'r' and init2<>'r') nonR = r.
if (init1<>'s' and init2<>'s') nonS = s.
if (init1<>'t' and init2<>'t') nonT = t.
if (init1<>'u' and init2<>'u') nonU = u.
if (init1<>'v' and init2<>'v') nonV = v.
if (init1<>'w' and init2<>'w') nonW = w.
if (init1<>'x' and init2<>'x') nonX = x.
if (init1<>'y' and init2<>'y') nonY = y.
if (init1<>'z' and init2<>'z') nonZ = z.
execute.

COMPUTE nobreak=1.
AGGREGATE OUTFILE='c:\temp.sav'
	/PRESORTED
	/BREAK=nobreak
	/baseA=MEAN(nonA)
	/baseB=MEAN(nonB)
	/baseC=MEAN(nonC)
	/baseD=MEAN(nonD)
	/baseE=MEAN(nonE)
	/baseF=MEAN(nonF)
	/baseG=MEAN(nonG)
	/baseH=MEAN(nonH)
	/baseI=MEAN(nonI)
	/baseJ=MEAN(nonJ)
	/baseK=MEAN(nonK)
	/baseL=MEAN(nonL)
	/baseM=MEAN(nonM)
	/baseN=MEAN(nonN)
	/baseO=MEAN(nonO)
	/baseP=MEAN(nonP)
	/baseQ=MEAN(nonQ)
	/baseR=MEAN(nonR)
	/baseS=MEAN(nonS)
	/baseT=MEAN(nonT)
	/baseU=MEAN(nonU)
	/baseV=MEAN(nonV)
	/baseW=MEAN(nonW)
	/baseX=MEAN(nonX)
	/baseY=MEAN(nonY)
	/baseZ=MEAN(nonZ).
execute.

MATCH FILES FILE=*
	/TABLE='c:\temp.sav'
	/BY=nobreak.
execute.

***assign respective raw letter ratings***.
do if (init1='a').
compute init1RAW = a.
else if (init1='b').
compute init1RAW = b.
else if (init1='c').
compute init1RAW = c.
else if (init1='d').
compute init1RAW = d.
else if (init1='e').
compute init1RAW = e.
else if (init1='f').
compute init1RAW = f.
else if (init1='g').
compute init1RAW = g.
else if (init1='h').
compute init1RAW = h.
else if (init1='i').
compute init1RAW = i.
else if (init1='j').
compute init1RAW = j.
else if (init1='k').
compute init1RAW = k.
else if (init1='l').
compute init1RAW = l.
else if (init1='m').
compute init1RAW = m.
else if (init1='n').
compute init1RAW = n.
else if (init1='o').
compute init1RAW = o.
else if (init1='p').
compute init1RAW = p.
else if (init1='q').
compute init1RAW = q.
else if (init1='r').
compute init1RAW = r.
else if (init1='s').
compute init1RAW = s.
else if (init1='t').
compute init1RAW = t.
else if (init1='u').
compute init1RAW = u.
else if (init1='v').
compute init1RAW = v.
else if (init1='w').
compute init1RAW = w.
else if (init1='x').
compute init1RAW = x.
else if (init1='y').
compute init1RAW = y.
else if (init1='z').
compute init1RAW = z.
end if.
execute.

do if (init2='a').
compute init2RAW = a.
else if (init2='b').
compute init2RAW = b.
else if (init2='c').
compute init2RAW = c.
else if (init2='d').
compute init2RAW = d.
else if (init2='e').
compute init2RAW = e.
else if (init2='f').
compute init2RAW = f.
else if (init2='g').
compute init2RAW = g.
else if (init2='h').
compute init2RAW = h.
else if (init2='i').
compute init2RAW = i.
else if (init2='j').
compute init2RAW = j.
else if (init2='k').
compute init2RAW = k.
else if (init2='l').
compute init2RAW = l.
else if (init2='m').
compute init2RAW = m.
else if (init2='n').
compute init2RAW = n.
else if (init2='o').
compute init2RAW = o.
else if (init2='p').
compute init2RAW = p.
else if (init2='q').
compute init2RAW = q.
else if (init2='r').
compute init2RAW = r.
else if (init2='s').
compute init2RAW = s.
else if (init2='t').
compute init2RAW = t.
else if (init2='u').
compute init2RAW = u.
else if (init2='v').
compute init2RAW = v.
else if (init2='w').
compute init2RAW = w.
else if (init2='x').
compute init2RAW = x.
else if (init2='y').
compute init2RAW = y.
else if (init2='z').
compute init2RAW = z.
end if.
execute.

if (init1='a') nltB1=init1RAW-baseA.
if (init1='b') nltB1=init1RAW-baseB.
if (init1='c') nltB1=init1RAW-baseC.
if (init1='d') nltB1=init1RAW-baseD.
if (init1='e') nltB1=init1RAW-baseE.
if (init1='f') nltB1=init1RAW-baseF.
if (init1='g') nltB1=init1RAW-baseG.
if (init1='h') nltB1=init1RAW-baseH.
if (init1='i') nltB1=init1RAW-baseI.
if (init1='j') nltB1=init1RAW-baseJ.
if (init1='k') nltB1=init1RAW-baseK.
if (init1='l') nltB1=init1RAW-baseL.
if (init1='m') nltB1=init1RAW-baseM.
if (init1='n') nltB1=init1RAW-baseN.
if (init1='o') nltB1=init1RAW-baseO.
if (init1='p') nltB1=init1RAW-baseP.
if (init1='q') nltB1=init1RAW-baseQ.
if (init1='r') nltB1=init1RAW-baseR.
if (init1='s') nltB1=init1RAW-baseS.
if (init1='t') nltB1=init1RAW-baseT.
if (init1='u') nltB1=init1RAW-baseU.
if (init1='v') nltB1=init1RAW-baseV.
if (init1='w') nltB1=init1RAW-baseW.
if (init1='x') nltB1=init1RAW-baseX.
if (init1='y') nltB1=init1RAW-baseY.
if (init1='z') nltB1=init1RAW-baseZ.
execute.

if (init2='a') nltB2=init2RAW-baseA.
if (init2='b') nltB2=init2RAW-baseB.
if (init2='c') nltB2=init2RAW-baseC.
if (init2='d') nltB2=init2RAW-baseD.
if (init2='e') nltB2=init2RAW-baseE.
if (init2='f') nltB2=init2RAW-baseF.
if (init2='g') nltB2=init2RAW-baseG.
if (init2='h') nltB2=init2RAW-baseH.
if (init2='i') nltB2=init2RAW-baseI.
if (init2='j') nltB2=init2RAW-baseJ.
if (init2='k') nltB2=init2RAW-baseK.
if (init2='l') nltB2=init2RAW-baseL.
if (init2='m') nltB2=init2RAW-baseM.
if (init2='n') nltB2=init2RAW-baseN.
if (init2='o') nltB2=init2RAW-baseO.
if (init2='p') nltB2=init2RAW-baseP.
if (init2='q') nltB2=init2RAW-baseQ.
if (init2='r') nltB2=init2RAW-baseR.
if (init2='s') nltB2=init2RAW-baseS.
if (init2='t') nltB2=init2RAW-baseT.
if (init2='u') nltB2=init2RAW-baseU.
if (init2='v') nltB2=init2RAW-baseV.
if (init2='w') nltB2=init2RAW-baseW.
if (init2='x') nltB2=init2RAW-baseX.
if (init2='y') nltB2=init2RAW-baseY.
if (init2='z') nltB2=init2RAW-baseZ.
execute.

*****************.
***S-algorithm***.
*****************.
***first, compute mean non-initial letter rating within-participant***.
compute meanNonInitials = mean(nonA,nonB,nonC,nonD,nonE,nonF,nonG,nonH,nonI,nonJ,nonK,nonL,nonM,nonN,nonO,nonP,nonQ,nonR,nonS,nonT,nonU,nonV,nonW,nonX,nonY,nonZ).
execute.

compute nltS1 = init1RAW - meanNonInitials.
compute nltS2 = init2RAW - meanNonInitials.

*****************.
***D-algorithm***.
*****************.
***first, compute mean letter rating of ALL letters within-participant***.
compute meanAllLetters = mean(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z).
execute.

compute nltD1 = nltB1/meanAllLetters.
compute nltD2 = nltB2/meanAllLetters.

*****************.
***I-algorithm***.
*****************.
***first, need to adjust for mean non-initials within-participants before computing normative baselines***.
compute ips_a = a - meanNonInitials.
compute ips_b = b - meanNonInitials.
compute ips_c = c - meanNonInitials.
compute ips_d = d - meanNonInitials.
compute ips_e = e - meanNonInitials.
compute ips_f = f - meanNonInitials.
compute ips_g = g - meanNonInitials.
compute ips_h = h - meanNonInitials.
compute ips_i = i - meanNonInitials.
compute ips_j = j - meanNonInitials.
compute ips_k = k - meanNonInitials.
compute ips_l = l - meanNonInitials.
compute ips_m = m - meanNonInitials.
compute ips_n = n - meanNonInitials.
compute ips_o = o - meanNonInitials.
compute ips_p = p - meanNonInitials.
compute ips_q = q - meanNonInitials.
compute ips_r = r - meanNonInitials.
compute ips_s = s - meanNonInitials.
compute ips_t = t - meanNonInitials.
compute ips_u = u - meanNonInitials.
compute ips_v = v - meanNonInitials.
compute ips_w = w - meanNonInitials.
compute ips_x = x - meanNonInitials.
compute ips_y = y - meanNonInitials.
compute ips_z = z - meanNonInitials.
execute.

if (init1<>'a' and init2<>'a') nonIpsA = ips_a.
if (init1<>'b' and init2<>'b') nonIpsB = ips_b.
if (init1<>'c' and init2<>'c') nonIpsC = ips_c.
if (init1<>'d' and init2<>'d') nonIpsD = ips_d.
if (init1<>'e' and init2<>'e') nonIpsE = ips_e.
if (init1<>'f' and init2<>'f') nonIpsF = ips_f.
if (init1<>'g' and init2<>'g') nonIpsG = ips_g.
if (init1<>'h' and init2<>'h') nonIpsH = ips_h.
if (init1<>'i' and init2<>'i') nonIpsI = ips_i.
if (init1<>'j' and init2<>'j') nonIpsJ = ips_j.
if (init1<>'k' and init2<>'k') nonIpsK = ips_k.
if (init1<>'l' and init2<>'l') nonIpsL = ips_l.
if (init1<>'m' and init2<>'m') nonIpsM = ips_m.
if (init1<>'n' and init2<>'n') nonIpsN = ips_n.
if (init1<>'o' and init2<>'o') nonIpsO = ips_o.
if (init1<>'p' and init2<>'p') nonIpsP = ips_p.
if (init1<>'q' and init2<>'q') nonIpsQ = ips_q.
if (init1<>'r' and init2<>'r') nonIpsR = ips_r.
if (init1<>'s' and init2<>'s') nonIpsS = ips_s.
if (init1<>'t' and init2<>'t') nonIpsT = ips_t.
if (init1<>'u' and init2<>'u') nonIpsU = ips_u.
if (init1<>'v' and init2<>'v') nonIpsV = ips_v.
if (init1<>'w' and init2<>'w') nonIpsW = ips_w.
if (init1<>'x' and init2<>'x') nonIpsX = ips_x.
if (init1<>'y' and init2<>'y') nonIpsY = ips_y.
if (init1<>'z' and init2<>'z') nonIpsZ = ips_z.
execute.

AGGREGATE OUTFILE='c:\temp2.sav'
	/PRESORTED
	/BREAK=nobreak
	/baseIpsA=MEAN(nonIpsA)
	/baseIpsB=MEAN(nonIpsB)
	/baseIpsC=MEAN(nonIpsC)
	/baseIpsD=MEAN(nonIpsD)
	/baseIpsE=MEAN(nonIpsE)
	/baseIpsF=MEAN(nonIpsF)
	/baseIpsG=MEAN(nonIpsG)
	/baseIpsH=MEAN(nonIpsH)
	/baseIpsI=MEAN(nonIpsI)
	/baseIpsJ=MEAN(nonIpsJ)
	/baseIpsK=MEAN(nonIpsK)
	/baseIpsL=MEAN(nonIpsL)
	/baseIpsM=MEAN(nonIpsM)
	/baseIpsN=MEAN(nonIpsN)
	/baseIpsO=MEAN(nonIpsO)
	/baseIpsP=MEAN(nonIpsP)
	/baseIpsQ=MEAN(nonIpsQ)
	/baseIpsR=MEAN(nonIpsR)
	/baseIpsS=MEAN(nonIpsS)
	/baseIpsT=MEAN(nonIpsT)
	/baseIpsU=MEAN(nonIpsU)
	/baseIpsV=MEAN(nonIpsV)
	/baseIpsW=MEAN(nonIpsW)
	/baseIpsX=MEAN(nonIpsX)
	/baseIpsY=MEAN(nonIpsY)
	/baseIpsZ=MEAN(nonIpsZ).
execute.

MATCH FILES FILE=*
	/TABLE='c:\temp2.sav'
	/BY=nobreak.
execute.

***assign respective ipsatized letter ratings***.
do if (init1='a').
compute init1_Ips = ips_a.
else if (init1='b').
compute init1_Ips = ips_b.
else if (init1='c').
compute init1_Ips = ips_c.
else if (init1='d').
compute init1_Ips = ips_d.
else if (init1='e').
compute init1_Ips = ips_e.
else if (init1='f').
compute init1_Ips = ips_f.
else if (init1='g').
compute init1_Ips = ips_g.
else if (init1='h').
compute init1_Ips = ips_h.
else if (init1='i').
compute init1_Ips = ips_i.
else if (init1='j').
compute init1_Ips = ips_j.
else if (init1='k').
compute init1_Ips = ips_k.
else if (init1='l').
compute init1_Ips = ips_l.
else if (init1='m').
compute init1_Ips = ips_m.
else if (init1='n').
compute init1_Ips = ips_n.
else if (init1='o').
compute init1_Ips = ips_o.
else if (init1='p').
compute init1_Ips = ips_p.
else if (init1='q').
compute init1_Ips = ips_q.
else if (init1='r').
compute init1_Ips = ips_r.
else if (init1='s').
compute init1_Ips = ips_s.
else if (init1='t').
compute init1_Ips = ips_t.
else if (init1='u').
compute init1_Ips = ips_u.
else if (init1='v').
compute init1_Ips = ips_v.
else if (init1='w').
compute init1_Ips = ips_w.
else if (init1='x').
compute init1_Ips = ips_x.
else if (init1='y').
compute init1_Ips = ips_y.
else if (init1='z').
compute init1_Ips = ips_z.
end if.
execute.

do if (init2='a').
compute init2_Ips = ips_a.
else if (init2='b').
compute init2_Ips = ips_b.
else if (init2='c').
compute init2_Ips = ips_c.
else if (init2='d').
compute init2_Ips = ips_d.
else if (init2='e').
compute init2_Ips = ips_e.
else if (init2='f').
compute init2_Ips = ips_f.
else if (init2='g').
compute init2_Ips = ips_g.
else if (init2='h').
compute init2_Ips = ips_h.
else if (init2='i').
compute init2_Ips = ips_i.
else if (init2='j').
compute init2_Ips = ips_j.
else if (init2='k').
compute init2_Ips = ips_k.
else if (init2='l').
compute init2_Ips = ips_l.
else if (init2='m').
compute init2_Ips = ips_m.
else if (init2='n').
compute init2_Ips = ips_n.
else if (init2='o').
compute init2_Ips = ips_o.
else if (init2='p').
compute init2_Ips = ips_p.
else if (init2='q').
compute init2_Ips = ips_q.
else if (init2='r').
compute init2_Ips = ips_r.
else if (init2='s').
compute init2_Ips = ips_s.
else if (init2='t').
compute init2_Ips = ips_t.
else if (init2='u').
compute init2_Ips = ips_u.
else if (init2='v').
compute init2_Ips = ips_v.
else if (init2='w').
compute init2_Ips = ips_w.
else if (init2='x').
compute init2_Ips = ips_x.
else if (init2='y').
compute init2_Ips = ips_y.
else if (init2='z').
compute init2_Ips = ips_z.
end if.
execute.

if (init1='a') nltI1=init1_Ips-baseIpsA.
if (init1='b') nltI1=init1_Ips-baseIpsB.
if (init1='c') nltI1=init1_Ips-baseIpsC.
if (init1='d') nltI1=init1_Ips-baseIpsD.
if (init1='e') nltI1=init1_Ips-baseIpsE.
if (init1='f') nltI1=init1_Ips-baseIpsF.
if (init1='g') nltI1=init1_Ips-baseIpsG.
if (init1='h') nltI1=init1_Ips-baseIpsH.
if (init1='i') nltI1=init1_Ips-baseIpsI.
if (init1='j') nltI1=init1_Ips-baseIpsJ.
if (init1='k') nltI1=init1_Ips-baseIpsK.
if (init1='l') nltI1=init1_Ips-baseIpsL.
if (init1='m') nltI1=init1_Ips-baseIpsM.
if (init1='n') nltI1=init1_Ips-baseIpsN.
if (init1='o') nltI1=init1_Ips-baseIpsO.
if (init1='p') nltI1=init1_Ips-baseIpsP.
if (init1='q') nltI1=init1_Ips-baseIpsQ.
if (init1='r') nltI1=init1_Ips-baseIpsR.
if (init1='s') nltI1=init1_Ips-baseIpsS.
if (init1='t') nltI1=init1_Ips-baseIpsT.
if (init1='u') nltI1=init1_Ips-baseIpsU.
if (init1='v') nltI1=init1_Ips-baseIpsV.
if (init1='w') nltI1=init1_Ips-baseIpsW.
if (init1='x') nltI1=init1_Ips-baseIpsX.
if (init1='y') nltI1=init1_Ips-baseIpsY.
if (init1='z') nltI1=init1_Ips-baseIpsZ.
execute.

if (init2='a') nltI2=init2_Ips-baseIpsA.
if (init2='b') nltI2=init2_Ips-baseIpsB.
if (init2='c') nltI2=init2_Ips-baseIpsC.
if (init2='d') nltI2=init2_Ips-baseIpsD.
if (init2='e') nltI2=init2_Ips-baseIpsE.
if (init2='f') nltI2=init2_Ips-baseIpsF.
if (init2='g') nltI2=init2_Ips-baseIpsG.
if (init2='h') nltI2=init2_Ips-baseIpsH.
if (init2='i') nltI2=init2_Ips-baseIpsI.
if (init2='j') nltI2=init2_Ips-baseIpsJ.
if (init2='k') nltI2=init2_Ips-baseIpsK.
if (init2='l') nltI2=init2_Ips-baseIpsL.
if (init2='m') nltI2=init2_Ips-baseIpsM.
if (init2='n') nltI2=init2_Ips-baseIpsN.
if (init2='o') nltI2=init2_Ips-baseIpsO.
if (init2='p') nltI2=init2_Ips-baseIpsP.
if (init2='q') nltI2=init2_Ips-baseIpsQ.
if (init2='r') nltI2=init2_Ips-baseIpsR.
if (init2='s') nltI2=init2_Ips-baseIpsS.
if (init2='t') nltI2=init2_Ips-baseIpsT.
if (init2='u') nltI2=init2_Ips-baseIpsU.
if (init2='v') nltI2=init2_Ips-baseIpsV.
if (init2='w') nltI2=init2_Ips-baseIpsW.
if (init2='x') nltI2=init2_Ips-baseIpsX.
if (init2='y') nltI2=init2_Ips-baseIpsY.
if (init2='z') nltI2=init2_Ips-baseIpsZ.
execute.

*****************.
***Z-algorithm***.
*****************.
***first, need to z-transform within-participants before computing normative baselines***.
compute pptSD = SD(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z).
execute.

compute z_a = (a - meanAllLetters)/pptSD.
compute z_b = (b - meanAllLetters)/pptSD.
compute z_c = (c - meanAllLetters)/pptSD.
compute z_d = (d - meanAllLetters)/pptSD.
compute z_e = (e - meanAllLetters)/pptSD.
compute z_f = (f - meanAllLetters)/pptSD.
compute z_g = (g - meanAllLetters)/pptSD.
compute z_h = (h - meanAllLetters)/pptSD.
compute z_i = (i - meanAllLetters)/pptSD.
compute z_j = (j - meanAllLetters)/pptSD.
compute z_k = (k - meanAllLetters)/pptSD.
compute z_l = (l - meanAllLetters)/pptSD.
compute z_m = (m - meanAllLetters)/pptSD.
compute z_n = (n - meanAllLetters)/pptSD.
compute z_o = (o - meanAllLetters)/pptSD.
compute z_p = (p - meanAllLetters)/pptSD.
compute z_q = (q - meanAllLetters)/pptSD.
compute z_r = (r - meanAllLetters)/pptSD.
compute z_s = (s - meanAllLetters)/pptSD.
compute z_t = (t - meanAllLetters)/pptSD.
compute z_u = (u - meanAllLetters)/pptSD.
compute z_v = (v - meanAllLetters)/pptSD.
compute z_w = (w - meanAllLetters)/pptSD.
compute z_x = (x - meanAllLetters)/pptSD.
compute z_y = (y - meanAllLetters)/pptSD.
compute z_z = (z - meanAllLetters)/pptSD.
execute.

if (init1<>'a' and init2<>'a') nonZA = Z_a.
if (init1<>'b' and init2<>'b') nonZB = Z_b.
if (init1<>'c' and init2<>'c') nonZC = Z_c.
if (init1<>'d' and init2<>'d') nonZD = Z_d.
if (init1<>'e' and init2<>'e') nonZE = Z_e.
if (init1<>'f' and init2<>'f') nonZF = Z_f.
if (init1<>'g' and init2<>'g') nonZG = Z_g.
if (init1<>'h' and init2<>'h') nonZH = Z_h.
if (init1<>'i' and init2<>'i') nonZI = Z_i.
if (init1<>'j' and init2<>'j') nonZJ = Z_j.
if (init1<>'k' and init2<>'k') nonZK = Z_k.
if (init1<>'l' and init2<>'l') nonZL = Z_l.
if (init1<>'m' and init2<>'m') nonZM = Z_m.
if (init1<>'n' and init2<>'n') nonZN = Z_n.
if (init1<>'o' and init2<>'o') nonZO = Z_o.
if (init1<>'p' and init2<>'p') nonZP = Z_p.
if (init1<>'q' and init2<>'q') nonZQ = Z_q.
if (init1<>'r' and init2<>'r') nonZR = Z_r.
if (init1<>'s' and init2<>'s') nonZS = Z_s.
if (init1<>'t' and init2<>'t') nonZT = Z_t.
if (init1<>'u' and init2<>'u') nonZU = Z_u.
if (init1<>'v' and init2<>'v') nonZV = Z_v.
if (init1<>'w' and init2<>'w') nonZW = Z_w.
if (init1<>'x' and init2<>'x') nonZX = Z_x.
if (init1<>'y' and init2<>'y') nonZY = Z_y.
if (init1<>'z' and init2<>'z') nonZZ = Z_z.
execute.

AGGREGATE OUTFILE='c:\temp3.sav'
	/PRESORTED
	/BREAK=nobreak
	/baseZA=MEAN(nonZA)
	/baseZB=MEAN(nonZB)
	/baseZC=MEAN(nonZC)
	/baseZD=MEAN(nonZD)
	/baseZE=MEAN(nonZE)
	/baseZF=MEAN(nonZF)
	/baseZG=MEAN(nonZG)
	/baseZH=MEAN(nonZH)
	/baseZI=MEAN(nonZI)
	/baseZJ=MEAN(nonZJ)
	/baseZK=MEAN(nonZK)
	/baseZL=MEAN(nonZL)
	/baseZM=MEAN(nonZM)
	/baseZN=MEAN(nonZN)
	/baseZO=MEAN(nonZO)
	/baseZP=MEAN(nonZP)
	/baseZQ=MEAN(nonZQ)
	/baseZR=MEAN(nonZR)
	/baseZS=MEAN(nonZS)
	/baseZT=MEAN(nonZT)
	/baseZU=MEAN(nonZU)
	/baseZV=MEAN(nonZV)
	/baseZW=MEAN(nonZW)
	/baseZX=MEAN(nonZX)
	/baseZY=MEAN(nonZY)
	/baseZZ=MEAN(nonZZ).
execute.

MATCH FILES FILE=*
	/TABLE='c:\temp3.sav'
	/BY=nobreak.
execute.

***assign respective z-transformed letter ratings***.
do if (init1='a').
compute init1_Z = Z_a.
else if (init1='b').
compute init1_Z = Z_b.
else if (init1='c').
compute init1_Z = Z_c.
else if (init1='d').
compute init1_Z = Z_d.
else if (init1='e').
compute init1_Z = Z_e.
else if (init1='f').
compute init1_Z = Z_f.
else if (init1='g').
compute init1_Z = Z_g.
else if (init1='h').
compute init1_Z = Z_h.
else if (init1='i').
compute init1_Z = Z_i.
else if (init1='j').
compute init1_Z = Z_j.
else if (init1='k').
compute init1_Z = Z_k.
else if (init1='l').
compute init1_Z = Z_l.
else if (init1='m').
compute init1_Z = Z_m.
else if (init1='n').
compute init1_Z = Z_n.
else if (init1='o').
compute init1_Z = Z_o.
else if (init1='p').
compute init1_Z = Z_p.
else if (init1='q').
compute init1_Z = Z_q.
else if (init1='r').
compute init1_Z = Z_r.
else if (init1='s').
compute init1_Z = Z_s.
else if (init1='t').
compute init1_Z = Z_t.
else if (init1='u').
compute init1_Z = Z_u.
else if (init1='v').
compute init1_Z = Z_v.
else if (init1='w').
compute init1_Z = Z_w.
else if (init1='x').
compute init1_Z = Z_x.
else if (init1='y').
compute init1_Z = Z_y.
else if (init1='z').
compute init1_Z = Z_z.
end if.
execute.

do if (init2='a').
compute init2_Z = Z_a.
else if (init2='b').
compute init2_Z = Z_b.
else if (init2='c').
compute init2_Z = Z_c.
else if (init2='d').
compute init2_Z = Z_d.
else if (init2='e').
compute init2_Z = Z_e.
else if (init2='f').
compute init2_Z = Z_f.
else if (init2='g').
compute init2_Z = Z_g.
else if (init2='h').
compute init2_Z = Z_h.
else if (init2='i').
compute init2_Z = Z_i.
else if (init2='j').
compute init2_Z = Z_j.
else if (init2='k').
compute init2_Z = Z_k.
else if (init2='l').
compute init2_Z = Z_l.
else if (init2='m').
compute init2_Z = Z_m.
else if (init2='n').
compute init2_Z = Z_n.
else if (init2='o').
compute init2_Z = Z_o.
else if (init2='p').
compute init2_Z = Z_p.
else if (init2='q').
compute init2_Z = Z_q.
else if (init2='r').
compute init2_Z = Z_r.
else if (init2='s').
compute init2_Z = Z_s.
else if (init2='t').
compute init2_Z = Z_t.
else if (init2='u').
compute init2_Z = Z_u.
else if (init2='v').
compute init2_Z = Z_v.
else if (init2='w').
compute init2_Z = Z_w.
else if (init2='x').
compute init2_Z = Z_x.
else if (init2='y').
compute init2_Z = Z_y.
else if (init2='z').
compute init2_Z = Z_z.
end if.
execute.

if (init1='a') nltZ1=init1_Z-baseZA.
if (init1='b') nltZ1=init1_Z-baseZB.
if (init1='c') nltZ1=init1_Z-baseZC.
if (init1='d') nltZ1=init1_Z-baseZD.
if (init1='e') nltZ1=init1_Z-baseZE.
if (init1='f') nltZ1=init1_Z-baseZF.
if (init1='g') nltZ1=init1_Z-baseZG.
if (init1='h') nltZ1=init1_Z-baseZH.
if (init1='i') nltZ1=init1_Z-baseZI.
if (init1='j') nltZ1=init1_Z-baseZJ.
if (init1='k') nltZ1=init1_Z-baseZK.
if (init1='l') nltZ1=init1_Z-baseZL.
if (init1='m') nltZ1=init1_Z-baseZM.
if (init1='n') nltZ1=init1_Z-baseZN.
if (init1='o') nltZ1=init1_Z-baseZO.
if (init1='p') nltZ1=init1_Z-baseZP.
if (init1='q') nltZ1=init1_Z-baseZQ.
if (init1='r') nltZ1=init1_Z-baseZR.
if (init1='s') nltZ1=init1_Z-baseZS.
if (init1='t') nltZ1=init1_Z-baseZT.
if (init1='u') nltZ1=init1_Z-baseZU.
if (init1='v') nltZ1=init1_Z-baseZV.
if (init1='w') nltZ1=init1_Z-baseZW.
if (init1='x') nltZ1=init1_Z-baseZX.
if (init1='y') nltZ1=init1_Z-baseZY.
if (init1='z') nltZ1=init1_Z-baseZZ.
execute.

if (init2='a') nltZ2=init2_Z-baseZA.
if (init2='b') nltZ2=init2_Z-baseZB.
if (init2='c') nltZ2=init2_Z-baseZC.
if (init2='d') nltZ2=init2_Z-baseZD.
if (init2='e') nltZ2=init2_Z-baseZE.
if (init2='f') nltZ2=init2_Z-baseZF.
if (init2='g') nltZ2=init2_Z-baseZG.
if (init2='h') nltZ2=init2_Z-baseZH.
if (init2='i') nltZ2=init2_Z-baseZI.
if (init2='j') nltZ2=init2_Z-baseZJ.
if (init2='k') nltZ2=init2_Z-baseZK.
if (init2='l') nltZ2=init2_Z-baseZL.
if (init2='m') nltZ2=init2_Z-baseZM.
if (init2='n') nltZ2=init2_Z-baseZN.
if (init2='o') nltZ2=init2_Z-baseZO.
if (init2='p') nltZ2=init2_Z-baseZP.
if (init2='q') nltZ2=init2_Z-baseZQ.
if (init2='r') nltZ2=init2_Z-baseZR.
if (init2='s') nltZ2=init2_Z-baseZS.
if (init2='t') nltZ2=init2_Z-baseZT.
if (init2='u') nltZ2=init2_Z-baseZU.
if (init2='v') nltZ2=init2_Z-baseZV.
if (init2='w') nltZ2=init2_Z-baseZW.
if (init2='x') nltZ2=init2_Z-baseZX.
if (init2='y') nltZ2=init2_Z-baseZY.
if (init2='z') nltZ2=init2_Z-baseZZ.
execute.

compute nltB = MEAN(nltB1,nltB2).
compute nltS = mean(nltS1,nltS2).
compute nltD = mean(nltD1,nltD2).
compute nltI = MEAN(nltI1,nltI2).
compute nltZ = MEAN(nltZ1,nltZ2).
execute.

SAVE OUTFILE="c:\NLT_OUTPUT.sav".

RELIABILITY
  /VARIABLES=nltB1 nltB2
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA.
RELIABILITY
  /VARIABLES=nltS1 nltS2
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA.
RELIABILITY
  /VARIABLES=nltD1 nltD2
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA.
RELIABILITY
  /VARIABLES=nltI1 nltI2
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA.
RELIABILITY
  /VARIABLES=nltZ1 nltZ2
  /FORMAT=NOLABELS
  /SCALE(ALPHA)=ALL/MODEL=ALPHA.