%
O0001
(============================================================)
(  DOUILLE - COTE DROIT / ПРАВА СТОРОНА                     )
(  Dessin N° 535   -   A.F.P.A. 2007                        )
(  Matière : C35   -   Brut : Ø50 x 52 mm                   )
(  Machine : Tour CNC (FANUC compatible)                     )
(  Tolérances générales : ISO 2768 - fH                      )
(  Etat de surface : Ra 1,6                                  )
(============================================================)
(                                                            )
(  REPERE PIECE : Z=0 face droite finie, Z- vers la gauche   )
(  X = cote en diametre                                      )
(                                                            )
(  DIMENSIONS COTE DROIT :                                   )
(    - Longueur section droite   : 15 mm                     )
(    - Filetage exterieur        : M35 x 1,5                 )
(    - Alesage interieur         : Ø25 H8 (+0,033 / 0)       )
(    - Chanfrein entree          : 1,5 x 45°                 )
(    - Chanfrein sortie filet    : 20°                       )
(    - Conicite surface 7/24                                 )
(    - Tolerance geometrique     : ⌀0,02 | A                 )
(============================================================)
(                                                            )
(  LISTE DES OUTILS :                                        )
(  T01 - Outil dresser / charioter exterieur droit           )
(       Plaquette : CNMG 120408  Vc=200 m/min f=0.2 mm/tr   )
(  T02 - Foret a centrer Ø5                                  )
(       Vc=20 m/min  f=0.05 mm/tr                            )
(  T03 - Foret Ø22 HSS-Co                                    )
(       Vc=30 m/min  f=0.18 mm/tr                            )
(  T04 - Barre d'alesage interieure                          )
(       Plaquette : DCMT 11T308  Vc=120 m/min f=0.06 mm/tr  )
(  T05 - Outil fileter exterieur M35 x 1,5                   )
(       Plaquette filet 60°  n=500 tr/min                    )
(============================================================)

(------------------------------------------------------------)
(  PHASE 10 : DRESSAGE FACE DROITE                           )
(  Dresser la face droite a Z=0                              )
(------------------------------------------------------------)
N10  G21               (Unites millimetres)
N20  G18               (Plan de travail XZ)
N30  G40               (Annulation correction rayon outil)
N40  G90               (Mode coordonnees absolues)

N50  T0101 M06         (Appel outil T01 - dresser/charioter)
N60  G96 S200 M03      (Vitesse de coupe Vc=200 m/min - sens horaire)
N70  G00 X54.0 Z2.0 M08 (Approche rapide + arrosage ON)

(Dressage face droite - passe unique jusqu'au centre)
N80  G00 Z0.5
N90  G00 X52.0
N100 G01 X-1.6 F0.15   (Dressage Ø52 -> centre, avance 0.15 mm/tr)
N110 G00 Z2.0
N120 G00 X54.0

(------------------------------------------------------------)
(  PHASE 20 : EBAUCHE EXTERIEURE - SECTION M35               )
(  Charioter Ø50 -> Ø35.6 sur 15 mm (surépaisseur 0.3 mm)   )
(------------------------------------------------------------)
(Passe 1 : Ø50 -> Ø46)
N130 G00 X46.0 Z2.0
N140 G01 Z-16.0 F0.25
N150 X50.0
N160 G00 Z2.0

(Passe 2 : Ø46 -> Ø42)
N170 G00 X42.0 Z2.0
N180 G01 Z-16.0 F0.25
N190 X46.0
N200 G00 Z2.0

(Passe 3 : Ø42 -> Ø38)
N210 G00 X38.0 Z2.0
N220 G01 Z-16.0 F0.25
N230 X42.0
N240 G00 Z2.0

(Passe 4 : Ø38 -> Ø35.6 - derniere passe ebauche)
N250 G00 X35.6 Z2.0
N260 G01 Z0.0 F0.2
N270 X35.0 Z-1.5        (Chanfrein 1,5 x 45° - ebauche)
N280 G01 Z-16.0 F0.2    (Chariotage Ø35.6 jusqu'a Z=-16 mm)
N290 X50.0              (Degagement vers epaulement)
N300 G00 Z2.0
N310 G00 X54.0

(------------------------------------------------------------)
(  PHASE 30 : CONE 20° - CHANFREIN EPAULEMENT               )
(  Degagement 20° a la jonction section droite / corps       )
(  Transition Ø35 -> Ø44.5 sur Z=-15 a Z=-20               )
(  tan(20°) = 0.364 -> deltaX = 0.364 * deltaZ              )
(------------------------------------------------------------)
N320 T0101 M06          (Meme outil, recorriger offset si besoin)
N330 G96 S180 M03
N340 G00 X35.0 Z-14.8
N350 G01 X44.5 Z-17.8 F0.12  (Cone 20° approx entre Z=-15 et corps)
N360 G00 X54.0 Z2.0

(------------------------------------------------------------)
(  PHASE 40 : PERCAGE - FORET A CENTRER Ø5                  )
(------------------------------------------------------------)
N400 T0202 M06          (Appel outil T02 - foret centrer)
N410 G97 S1200 M03      (Vitesse constante 1200 tr/min)
N420 G00 X0.0 Z2.0
N430 G01 Z-4.0 F0.05    (Centrage profondeur 4 mm)
N440 G00 Z5.0
N450 G00 X54.0

(------------------------------------------------------------)
(  PHASE 50 : PERCAGE Ø22 - PREPARER ALESAGE Ø25H8          )
(  Foret Ø22 - laisser 1.5 mm par cote pour l'alesage        )
(------------------------------------------------------------)
N500 T0303 M06          (Appel outil T03 - foret Ø22)
N510 G97 S435 M03       (n = Vc*1000/(pi*D) = 30000/(3.14*22) = 435 tr/min)
N520 G00 X0.0 Z2.0

(Cycle de percage avec debourrage G83 - Q=4mm par debourrage)
N530 G83 Z-54.0 Q4000 R2.0 F0.18
N540 G80               (Annulation cycle percage)
N550 G00 X54.0 Z5.0

(------------------------------------------------------------)
(  PHASE 60 : ALESAGE INTERIEUR Ø25 H8                      )
(  H8 pour Ø25 : ecart superieur = +0.033 mm                )
(               ecart inferieur  = 0 mm                      )
(  Objectif : Ø25.016 mm (milieu tolerance)                  )
(  Tolerance cylindricite : ⌀0.02 / A                        )
(------------------------------------------------------------)
N600 T0404 M06          (Appel outil T04 - barre alesage)
N610 G96 S120 M03       (Vc=120 m/min - alesage de precision)
N620 G00 X22.0 Z2.0

(Ebauche alesage - laisser 0.3 mm par cote -> Ø24.4)
N630 G00 X24.4 Z2.0
N640 G01 Z0.0 F0.1
N650 G01 Z-52.0 F0.12   (Alesage ebauche Ø24.4 sur toute longueur)
N660 G00 X22.0
N670 G00 Z2.0

(Semi-finition - laisser 0.1 mm -> Ø24.8)
N680 G00 X24.8 Z2.0
N690 G01 Z0.0 F0.08
N700 G01 Z-52.0 F0.08
N710 G00 X22.0
N720 G00 Z2.0

(Finition alesage Ø25.016 mm - Ra 1.6)
N730 G00 X25.016 Z2.0
N740 G01 Z0.0 F0.06
N750 G01 Z-52.0 F0.06   (Finition - avance reduite pour Ra 1.6)
N760 G00 X22.0
N770 G00 Z5.0

(------------------------------------------------------------)
(  PHASE 70 : FINITION EXTERIEURE ZONE FILETAGE M35          )
(  Finir Ø35h6 avant filetage                                )
(  Chanfrein entree 1,5 x 45° - finition                     )
(------------------------------------------------------------)
N800 T0101 M06          (Retour outil T01 pour finition)
N810 G96 S220 M03
N820 G00 X37.0 Z2.0

(Finition cylindrique Ø35 +0/-0.1  longueur 15 mm)
N830 G01 Z0.5 F0.1
N840 X35.0 Z-1.5        (Chanfrein 1,5 x 45° - finition)
N850 G01 Z-15.5 F0.1    (Finition Ø35 + depassement 0.5 pour filet)
N860 G00 X54.0 Z2.0

(------------------------------------------------------------)
(  PHASE 80 : FILETAGE EXTERIEUR M35 x 1,5                   )
(  Profil ISO metrique 60°                                   )
(  Hauteur filet h = 0.6495 * p = 0.6495 * 1.5 = 0.974 mm  )
(  Diametre flanc   d2 = 35 - 1.5*0.6495*2 = 35-1.948=33.05 )
(  Diametre fond    d1 = 35 - 2*0.974*1.25 = 35-2.435=32.56 )
(  Cote programmee : X32.565 (fond de filet)                 )
(  Longueur filet utile : 13.5 mm (depart Z=-1.5 fin Z=-15) )
(------------------------------------------------------------)
N900 T0505 M06          (Appel outil T05 - outil filetage)
N910 G97 S500 M03       (Vitesse constante pour filetage - pas de G96)
N920 G00 X37.0 Z4.0     (Position initiale au-dessus du filet)

(Cycle de filetage multi-passes G76 - FANUC)
(G76 P[finition][depart][angle]  Q[prof.mini]  R[surlargeur finition])
(G76 X[Xfond]  Z[Zfin]  P[hauteur*1000]  Q[profondeur 1ere passe*1000]  F[pas])
N930 G76 P021060 Q100 R0.05
(    P02 = 2 passes finition | 10 = depart filet 10° | 60 = angle 60°)
(    Q100 = prof.mini 0.1 mm | R0.05 = surlargeur finition 0.05 mm)
N940 G76 X32.565 Z-13.5 P974 Q300 F1.5
(    X32.565 = diametre fond filet)
(    Z-13.5  = fin filet = Z(-15 + 1 sortie de filet 1.5mm))
(    P974    = hauteur filet 0.974 mm)
(    Q300    = profondeur 1ere passe 0.3 mm)
(    F1.5    = pas du filet 1.5 mm)

N950 G00 X54.0 Z5.0

(------------------------------------------------------------)
(  CONTROLE APRES USINAGE                                    )
(  - Verifier Ø25H8 au tampon lisse et tampon non-passant    )
(  - Verifier M35x1.5 au calibre bague filete                )
(  - Verifier Ra 1.6 sur l'alesage (toleree ⌀0.02/A)        )
(  - Verifier longueur 15 mm +0/-0.1                         )
(  - Chanfrein 1.5x45° et sortie de filet 20°               )
(------------------------------------------------------------)

(------------------------------------------------------------)
(  FIN DE PROGRAMME                                          )
(------------------------------------------------------------)
N990 G00 X100.0 Z100.0 M09  (Retrait outil securite + arrosage OFF)
N995 M05                     (Arret broche)
N999 M30                     (Fin programme - rebobinage)
%
