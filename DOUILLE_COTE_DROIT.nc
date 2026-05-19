%
O00001
(DOUILLE - COTE DROIT / ПРАВА СТОРОНА)
(MATERIAU : C35   BRUT : PHI50 X 52MM)
(DESSIN N535 - HAAS CNC LATHE)
(Z0 = FACE DROITE FINIE)
(
(OUTILS :
(T01 - OUTIL CHARIOTER/DRESSER EXT - CNMG 120408)
(T02 - FORET CENTRER PHI5)
(T03 - FORET PHI22 HSS-CO)
(T04 - BARRE ALESAGE INT - DCMT 11T308)
(T05 - OUTIL FILETER EXT 60DEG M35X1.5)

(====================================================)
(  PHASE 10 : DRESSAGE FACE DROITE                  )
(====================================================)
T0101
G97 S800 M03
G00 X54. Z5. M08
G96 S200
G50 S3000
G00 Z0.5
G01 X-1.6 F0.15
G00 Z2.
G28 U0. W0. M09

(====================================================)
(  PHASE 20 : EBAUCHE EXTERIEURE - CYCLE G71        )
(  Profil : chanfrein 1.5x45 + M35 + cone 20deg     )
(====================================================)
T0101
G96 S200 M03
G50 S3000
G00 X54. Z2. M08

G71 U1.5 R0.5
G71 P100 Q110 U0.3 W0.1 F0.25

(--- PROFIL FINI COTE DROIT ---)
N100 G00 X32.
     G01 Z0.   F0.1
     G01 X35.  Z-1.5          (CHANFREIN 1.5X45DEG)
     G01 Z-15.                (CYLINDRE M35 - 15MM)
     G01 X44.5 Z-17.8         (CONE 20DEG VERS CORPS)
     G01 X50.
N110 G01 Z-18.

(====================================================)
(  PHASE 30 : FINITION EXTERIEURE - CYCLE G70       )
(====================================================)
G70 P100 Q110 F0.1 S230

G00 X54. Z2.
G28 U0. W0. M09

(====================================================)
(  PHASE 40 : CENTRAGE PHI5                         )
(====================================================)
T0202
G97 S1200 M03
G00 X0. Z2. M08
G01 Z-4. F0.05
G00 Z5.
G28 U0. W0. M09

(====================================================)
(  PHASE 50 : PERCAGE PHI22 AVEC DEBOURRAGE         )
(  n = Vc*1000/(pi*D) = 30000/69.1 = 434 tr/min    )
(====================================================)
T0303
G97 S434 M03
G00 X0. Z2. M08
G83 Z-54. Q4. R2. F0.18
G80
G00 Z5.
G28 U0. W0. M09

(====================================================)
(  PHASE 60 : ALESAGE INTERIEUR PHI25 H8            )
(  H8 PHI25 : +0.033 / 0.000                        )
(  COTE VISEE : PHI25.016 (MILIEU TOLERANCE)         )
(  TOLERANCE CYLINDRICITE : PHI0.02 / A              )
(====================================================)
T0404
G96 S120 M03
G50 S2000
G00 X22. Z2. M08

(EBAUCHE ALESAGE - LAISSER 0.3MM PAR COTE)
G71 U0.4 R0.3
G71 P200 Q210 U-0.3 W0.0 F0.12
(U NEGATIF = SUREP. SUR ALESAGE INTERIEUR)

N200 G00 X25.616
     G01 Z0.   F0.08
     G01 Z-52.
N210 G00 X22.

(FINITION ALESAGE PHI25.016 - Ra 1.6)
G70 P200 Q210 F0.06 S130

G00 X22. Z5.
G28 U0. W0. M09

(====================================================)
(  PHASE 70 : FILETAGE EXTERIEUR M35 X 1.5          )
(  PROFIL ISO 60DEG                                  )
(  HAUTEUR FILET  H = 0.812 MM                       )
(  DIAM FOND      d1 = 35 - 2x0.812 = 33.376 MM     )
(  LONGUEUR UTILE : 13.5 MM (Z-1.5 A Z-15)          )
(====================================================)
T0505
G97 S500 M03
G00 X37. Z4. M08

(CYCLE FILETAGE G76 - HAAS)
G76 P021060 Q100 R0.05
G76 X33.376 Z-13.5 P812 Q300 F1.5

G00 X54. Z5.
G28 U0. W0. M09

(====================================================)
(  CONTROLE APRES USINAGE                           )
(  PHI25H8  -> TAMPON LISSE + NON-PASSANT           )
(  M35X1.5  -> CALIBRE BAGUE FILETE                 )
(  LONG 15MM -> PALMER +0/-0.1                      )
(  Ra 1.6   -> RUGOSImetre SUR ALESAGE              )
(====================================================)

M05
M30
%
