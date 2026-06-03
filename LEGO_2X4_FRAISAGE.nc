%
O0200
(BRIQUE LEGO 2X4 - FRAISAGE CNC - ISO / FANUC)
(MATERIAU : ABS  /  ALUMINIUM EN AW-5083)
(BRUT : 33 X 17 X 12 MM)
(REF DESSIN : BARTNECK 27/03/19)
(COTES FINIES : 31.8 X 15.8 X 9.6 MM + PLOTS H=1.8)
(HAUTEUR TOTALE : 11.4 MM)
(
(REPERE PIECE :)
(  Z0 = FACE INFERIEURE PIECE)
(  Z+ = VERS LE HAUT)
(  X0Y0 = COIN INF-GAUCHE PIECE VU DE DESSUS)
(
(PLOTS (STUDS) : 8 PLOTS PHI4.8 - PAS 8MM)
(  RANGEE 1 : Y=3.9  ->  X = 3.9 / 11.9 / 19.9 / 27.9)
(  RANGEE 2 : Y=11.9 ->  X = 3.9 / 11.9 / 19.9 / 27.9)
(
(TUBES ANTI-PLOTS : 3 TUBES Y=7.9 -> X = 7.9 / 15.9 / 23.9)
(  PHI EXT=6.51 / PHI INT=4.8 / TROU AXIAL=PHI2.6)
(
(OUTILS :)
(  T01 - FRAISE 2 TAILLES PHI6  - CONTOUR + POCHE)
(  T02 - FRAISE 2 TAILLES PHI3  - PLOTS + TUBES)
(  T03 - FORET PHI2.6            - TROUS AXIAUX TUBES)

G21 G17 G40 G49 G80 G90

(====================================================)
(  PHASE 10 : DRESSAGE FACE SUPERIEURE              )
(  Brut Z=12. -> Face finie Z=11.4                  )
(====================================================)
T01 M06
G43 H01
S8000 M03
M08

G00 X-3. Y-3. Z15.
G00 Z12.5
G01 Z11.4 F400
(Zig-zag planage face sup - pas Y=4mm - fraise PHI6)
G01 X35. F2000
G00 Y2.
G01 X-3. F2000
G00 Y6.
G01 X35. F2000
G00 Y10.
G01 X-3. F2000
G00 Y14.
G01 X35. F2000
G00 Y18.
G01 X-3. F2000
G00 Z15.

(====================================================)
(  PHASE 20 : PROFIL EXTERIEUR                      )
(  Contour 31.8 x 15.8 - passes Z de 9.6 a 0       )
(  Compensation rayon G42 - fraise a droite          )
(====================================================)

(--- PASSE Z=9.6 ---)
G00 X-4. Y-4. Z15.
G01 Z9.6 F400
G42 D01
G01 X0.   Y0.   F1500
G01 X31.8 Y0.
G01 X31.8 Y15.8
G01 X0.   Y15.8
G01 X0.   Y0.
G40
G00 Z15.

(--- PASSE Z=8.0 ---)
G00 X-4. Y-4.
G01 Z8. F400
G42 D01
G01 X0.   Y0.   F1500
G01 X31.8 Y0.
G01 X31.8 Y15.8
G01 X0.   Y15.8
G01 X0.   Y0.
G40
G00 Z15.

(--- PASSE Z=6.0 ---)
G00 X-4. Y-4.
G01 Z6. F400
G42 D01
G01 X0.   Y0.   F1500
G01 X31.8 Y0.
G01 X31.8 Y15.8
G01 X0.   Y15.8
G01 X0.   Y0.
G40
G00 Z15.

(--- PASSE Z=4.0 ---)
G00 X-4. Y-4.
G01 Z4. F400
G42 D01
G01 X0.   Y0.   F1500
G01 X31.8 Y0.
G01 X31.8 Y15.8
G01 X0.   Y15.8
G01 X0.   Y0.
G40
G00 Z15.

(--- PASSE Z=2.0 ---)
G00 X-4. Y-4.
G01 Z2. F400
G42 D01
G01 X0.   Y0.   F1500
G01 X31.8 Y0.
G01 X31.8 Y15.8
G01 X0.   Y15.8
G01 X0.   Y0.
G40
G00 Z15.

(--- PASSE Z=0.0 - FOND ---)
G00 X-4. Y-4.
G01 Z0. F400
G42 D01
G01 X0.   Y0.   F1500
G01 X31.8 Y0.
G01 X31.8 Y15.8
G01 X0.   Y15.8
G01 X0.   Y0.
G40
G00 Z15.

M09
M05

(====================================================)
(  PHASE 30 : DEGAGEMENT ZONE PLOTS                 )
(  Fraisage autour des 8 plots PHI4.8               )
(  Plots de Z=9.6 a Z=11.4 (H=1.8)                 )
(  Outil T02 PHI3 - Rayon traj = R_plot+R_outil     )
(    R_plot=2.4 / R_outil=1.5 -> R_traj=3.9         )
(  Bandes degagees sur face Z=9.6 :                  )
(    - Avant rangee 1 : Y=0 a Y=1.4                 )
(    - Entre rangees  : Y=6.4 a Y=9.4               )
(    - Apres rangee 2 : Y=14.4 a Y=15.8             )
(====================================================)
T02 M06
G43 H02
S12000 M03
M08

(--- BANDE Y=0 -> Y=1.4 (bord avant rangee 1) ---)
G00 X0. Y0. Z15.
G01 Z9.6 F300
G01 X31.8 F1200
G00 Y0.7
G01 X0. F1200
G00 Y1.4
G01 X31.8 F1200
G00 Z15.

(--- BANDE Y=6.4 -> Y=9.4 (inter-rangees) ---)
G00 X0. Y6.4 Z15.
G01 Z9.6 F300
G01 X31.8 F1200
G00 Y7.1
G01 X0. F1200
G00 Y7.9
G01 X31.8 F1200
G00 Y8.7
G01 X0. F1200
G00 Y9.4
G01 X31.8 F1200
G00 Z15.

(--- BANDE Y=14.4 -> Y=15.8 (bord apres rangee 2) ---)
G00 X0. Y14.4 Z15.
G01 Z9.6 F300
G01 X31.8 F1200
G00 Y15.1
G01 X0. F1200
G00 Y15.8
G01 X31.8 F1200
G00 Z15.

(--- FRAISAGE CIRCULAIRE AUTOUR CHAQUE PLOT ---)
(Trajectoire outil : G03 cercle R=3.9 autour centre plot)
(Passe unique de Z=11.4 a Z=9.6 en spirale descendante)

(PLOT 1 : X=3.9  Y=3.9)
G00 X7.8 Y3.9 Z15.
G01 Z11.4 F300
G03 X7.8 Y3.9 I-3.9 J0. Z9.6 F800
G03 X7.8 Y3.9 I-3.9 J0. F800
G00 Z15.

(PLOT 2 : X=11.9  Y=3.9)
G00 X15.8 Y3.9 Z15.
G01 Z11.4 F300
G03 X15.8 Y3.9 I-3.9 J0. Z9.6 F800
G03 X15.8 Y3.9 I-3.9 J0. F800
G00 Z15.

(PLOT 3 : X=19.9  Y=3.9)
G00 X23.8 Y3.9 Z15.
G01 Z11.4 F300
G03 X23.8 Y3.9 I-3.9 J0. Z9.6 F800
G03 X23.8 Y3.9 I-3.9 J0. F800
G00 Z15.

(PLOT 4 : X=27.9  Y=3.9)
G00 X31.8 Y3.9 Z15.
G01 Z11.4 F300
G03 X31.8 Y3.9 I-3.9 J0. Z9.6 F800
G03 X31.8 Y3.9 I-3.9 J0. F800
G00 Z15.

(PLOT 5 : X=3.9  Y=11.9)
G00 X7.8 Y11.9 Z15.
G01 Z11.4 F300
G03 X7.8 Y11.9 I-3.9 J0. Z9.6 F800
G03 X7.8 Y11.9 I-3.9 J0. F800
G00 Z15.

(PLOT 6 : X=11.9  Y=11.9)
G00 X15.8 Y11.9 Z15.
G01 Z11.4 F300
G03 X15.8 Y11.9 I-3.9 J0. Z9.6 F800
G03 X15.8 Y11.9 I-3.9 J0. F800
G00 Z15.

(PLOT 7 : X=19.9  Y=11.9)
G00 X23.8 Y11.9 Z15.
G01 Z11.4 F300
G03 X23.8 Y11.9 I-3.9 J0. Z9.6 F800
G03 X23.8 Y11.9 I-3.9 J0. F800
G00 Z15.

(PLOT 8 : X=27.9  Y=11.9)
G00 X31.8 Y11.9 Z15.
G01 Z11.4 F300
G03 X31.8 Y11.9 I-3.9 J0. Z9.6 F800
G03 X31.8 Y11.9 I-3.9 J0. F800
G00 Z15.

M09
M05
G00 Z150.

(====================================================)
(  === RETOURNEMENT PIECE ===                        )
(  Bloquer sur la face superieure (face des plots)   )
(  Nouveau Z0 = face inferieure (maintenant en haut) )
(  Refaire la mise a zero Z sur face inf retournee   )
(====================================================)

(====================================================)
(  PHASE 40 : POCHE INTERIEURE                      )
(  Poche X=1.2->30.6  Y=1.2->14.6  Prof=7.9mm      )
(  Epaisseur paroi : 1.2mm  /  Fond : 1.7mm         )
(  3 BOSSES TUBES laisses : X=7.9/15.9/23.9  Y=7.9 )
(    (servent de base pour les tubes anti-plots)     )
(====================================================)
T01 M06
G43 H01
S8000 M03
M08

(--- ZONE SUD : Y=1.2 a Y=4.5 (sous les tubes) ---)
G00 X1.2 Y1.2 Z5.
G01 Z-2. F300
G01 X30.6 F1500
G00 Y2.
G01 X1.2 F1500
G00 Y2.8
G01 X30.6 F1500
G00 Y3.6
G01 X1.2 F1500
G00 Y4.4
G01 X30.6 F1500

G00 Z5.
G00 X1.2 Y1.2
G01 Z-4. F300
G01 X30.6 F1500
G00 Y2.
G01 X1.2 F1500
G00 Y2.8
G01 X30.6 F1500
G00 Y3.6
G01 X1.2 F1500
G00 Y4.4
G01 X30.6 F1500

G00 Z5.
G00 X1.2 Y1.2
G01 Z-6. F300
G01 X30.6 F1500
G00 Y2.
G01 X1.2 F1500
G00 Y2.8
G01 X30.6 F1500
G00 Y3.6
G01 X1.2 F1500
G00 Y4.4
G01 X30.6 F1500

G00 Z5.
G00 X1.2 Y1.2
G01 Z-7.9 F300
G01 X30.6 F1500
G00 Y2.
G01 X1.2 F1500
G00 Y2.8
G01 X30.6 F1500
G00 Y3.6
G01 X1.2 F1500
G00 Y4.4
G01 X30.6 F1500
G00 Z5.

(--- ZONE NORD : Y=11.1 a Y=14.6 (au-dessus tubes) ---)
G00 X1.2 Y11.1 Z5.
G01 Z-2. F300
G01 X30.6 F1500
G00 Y11.9
G01 X1.2 F1500
G00 Y12.7
G01 X30.6 F1500
G00 Y13.5
G01 X1.2 F1500
G00 Y14.3
G01 X30.6 F1500
G00 Y14.6
G01 X1.2 F1500

G00 Z5.
G00 X1.2 Y11.1
G01 Z-4. F300
G01 X30.6 F1500
G00 Y11.9
G01 X1.2 F1500
G00 Y12.7
G01 X30.6 F1500
G00 Y13.5
G01 X1.2 F1500
G00 Y14.3
G01 X30.6 F1500
G00 Y14.6
G01 X1.2 F1500

G00 Z5.
G00 X1.2 Y11.1
G01 Z-6. F300
G01 X30.6 F1500
G00 Y11.9
G01 X1.2 F1500
G00 Y12.7
G01 X30.6 F1500
G00 Y13.5
G01 X1.2 F1500
G00 Y14.3
G01 X30.6 F1500
G00 Y14.6
G01 X1.2 F1500

G00 Z5.
G00 X1.2 Y11.1
G01 Z-7.9 F300
G01 X30.6 F1500
G00 Y11.9
G01 X1.2 F1500
G00 Y12.7
G01 X30.6 F1500
G00 Y13.5
G01 X1.2 F1500
G00 Y14.3
G01 X30.6 F1500
G00 Y14.6
G01 X1.2 F1500
G00 Z5.

(--- FINITION PAROIS POCHE ---)
G00 X1.2 Y1.2 Z5.
G01 Z-7.9 F300
G42 D01
G01 X1.2 Y1.2 F800
G01 X30.6 Y1.2
G01 X30.6 Y14.6
G01 X1.2  Y14.6
G01 X1.2  Y1.2
G40
G00 Z5.

M09
M05

(====================================================)
(  PHASE 50 : TUBES ANTI-PLOTS - ZONE CENTRALE      )
(  Fraisage zone Y=4.5 a Y=11.1 en evitant bosses   )
(  Puis fraisage des profils tubes PHI6.51 et PHI4.8 )
(  Outil : T02 PHI3                                  )
(====================================================)
T02 M06
G43 H02
S12000 M03
M08

(--- DEGAGEMENT ZONE CENTRALE INTER-TUBES ---)
(Fraisage de la zone autour des 3 bosses tubes)
(Passes en X entre les bosses tubes - 4 corridors)

(Corridor 1 : X=1.2 a X=4.645 (avant tube1))
G00 X1.2 Y4.6 Z5.
G01 Z-7.9 F300
G01 X4.6 F1200
G00 Y5.4
G01 X1.2 F1200
G00 Y6.2
G01 X4.6 F1200
G00 Y7.0
G01 X1.2 F1200
G00 Y7.9
G01 X4.6 F1200
G00 Y8.7
G01 X1.2 F1200
G00 Y9.5
G01 X4.6 F1200
G00 Y10.3
G01 X1.2 F1200
G00 Y11.1
G01 X4.6 F1200
G00 Z5.

(Corridor 2 : X=11.155 a X=12.645 (entre tube1 et tube2))
G00 X11.2 Y4.6 Z5.
G01 Z-7.9 F300
G01 X12.6 F1200
G00 Y5.4
G01 X11.2 F1200
G00 Y6.2
G01 X12.6 F1200
G00 Y7.0
G01 X11.2 F1200
G00 Y7.9
G01 X12.6 F1200
G00 Y8.7
G01 X11.2 F1200
G00 Y9.5
G01 X12.6 F1200
G00 Y10.3
G01 X11.2 F1200
G00 Y11.1
G01 X12.6 F1200
G00 Z5.

(Corridor 3 : X=19.155 a X=20.645 (entre tube2 et tube3))
G00 X19.2 Y4.6 Z5.
G01 Z-7.9 F300
G01 X20.6 F1200
G00 Y5.4
G01 X19.2 F1200
G00 Y6.2
G01 X20.6 F1200
G00 Y7.0
G01 X19.2 F1200
G00 Y7.9
G01 X20.6 F1200
G00 Y8.7
G01 X19.2 F1200
G00 Y9.5
G01 X20.6 F1200
G00 Y10.3
G01 X19.2 F1200
G00 Y11.1
G01 X20.6 F1200
G00 Z5.

(Corridor 4 : X=27.155 a X=30.6 (apres tube3))
G00 X27.2 Y4.6 Z5.
G01 Z-7.9 F300
G01 X30.6 F1200
G00 Y5.4
G01 X27.2 F1200
G00 Y6.2
G01 X30.6 F1200
G00 Y7.0
G01 X27.2 F1200
G00 Y7.9
G01 X30.6 F1200
G00 Y8.7
G01 X27.2 F1200
G00 Y9.5
G01 X30.6 F1200
G00 Y10.3
G01 X27.2 F1200
G00 Y11.1
G01 X30.6 F1200
G00 Z5.

(--- PROFIL EXTERIEUR TUBE 1 : X=7.9, Y=7.9, PHI=6.51 ---)
(Trajectoire centre outil : R = PHI_ext/2 - R_outil)
(R_traj = 3.255 - 1.5 = 1.755 mm)
G00 X9.655 Y7.9 Z5.
G01 Z-6.2 F200
G03 X9.655 Y7.9 I-1.755 J0. F800
G00 Z5.

(--- ALESAGE INTERIEUR TUBE 1 : PHI=4.8 ---)
(Trajectoire centre outil : R = PHI_int/2 + R_outil)
(R_traj = 2.4 + 1.5 = 3.9 mm)
G00 X11.8 Y7.9 Z5.
G01 Z-6.2 F200
G02 X11.8 Y7.9 I-3.9 J0. F800
G00 Z5.

(--- PROFIL EXTERIEUR TUBE 2 : X=15.9, Y=7.9 ---)
G00 X17.655 Y7.9 Z5.
G01 Z-6.2 F200
G03 X17.655 Y7.9 I-1.755 J0. F800
G00 Z5.

(--- ALESAGE INTERIEUR TUBE 2 ---)
G00 X19.8 Y7.9 Z5.
G01 Z-6.2 F200
G02 X19.8 Y7.9 I-3.9 J0. F800
G00 Z5.

(--- PROFIL EXTERIEUR TUBE 3 : X=23.9, Y=7.9 ---)
G00 X25.655 Y7.9 Z5.
G01 Z-6.2 F200
G03 X25.655 Y7.9 I-1.755 J0. F800
G00 Z5.

(--- ALESAGE INTERIEUR TUBE 3 ---)
G00 X27.8 Y7.9 Z5.
G01 Z-6.2 F200
G02 X27.8 Y7.9 I-3.9 J0. F800
G00 Z5.

M09
M05

(====================================================)
(  PHASE 60 : PERCAGE TROUS AXIAUX TUBES PHI2.6     )
(  3 TROUS : X=7.9 / X=15.9 / X=23.9  Y=7.9        )
(  Traversants : Z=2. -> Z=-9.0 (percage complet)   )
(====================================================)
T03 M06
G43 H03
S15000 M03
M08

G98 G81 X7.9  Y7.9 Z-9. R2. F200
     X15.9 Y7.9
     X23.9 Y7.9
G80

(====================================================)
(  FIN DE PROGRAMME                                 )
(====================================================)
M09
M05
G00 Z150.
G28 G91 Z0.
G28 X0. Y0.
M30
%
