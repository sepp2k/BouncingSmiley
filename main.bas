003 poke 53280, 6 : rem outer border = dark blue
006 poke 53281, 0 : rem background = black
010 gosub 500
020 v=53248 : rem VIC
030 poke v+21,12 : rem Enable sprite 2 and 3
035 poke v+41,7  : rem Smiley color = yellow
037 poke v+42,15 : rem Frowney color = grey
040 poke 2042,13 : rem Sprite 2 data from block 13
045 poke 2043,14 : rem Sprite 3 data from block 14
050 for i=0 to 62
060   read q
070   poke 832+i,q
080 next i
081 for i=0 to 62
082   read q
083   poke 896+i,q
084 next i
085 x = 25
090 y = 50
093 xd = 2
096 yd = 2
100 if x > 255 then poke v+4, x-255 : poke v+6, x-255 : poke v+16, 255
105 if x <= 255 then poke v+4, x : poke v+6, x : poke v+16, 0
110 poke v+5, y : poke v+7, 280-y
120 x = x + xd
130 y = y + yd
140 if x >= 320 or x <= 25 then xd = xd * -1
150 if y >= 230 or y <= 50 then yd = yd * -1
160 goto 100