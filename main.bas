010 print "{clear}"
020 v=53248 : rem VIC
030 poke v+21,4 : rem Enable sprite 2
035 poke v+41,7 : rem Sprite color = yellow
040 poke 2042,13 : rem Sprite 2 data from block 13
050 for n=0 to 62
060   read q
070   poke 832+n,q
080 next n
085 x = 25
090 y = 50
093 xd = 2
096 yd = 2
100 if x > 255 then poke v+4, x-255 : poke v+16, 255
105 if x <= 255 then poke v+4, x : poke v+16, 0
110 poke v+5, y
120 x = x + xd
130 y = y + yd
140 if x >= 320 or x <= 25 then xd = xd * -1
150 if y >= 230 or y <= 50 then yd = yd * -1
160 goto 100