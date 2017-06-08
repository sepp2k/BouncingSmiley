500 print "{clear}"
510 poke 1024, 79: poke 55296, 1
520 for i=1 to 38
530   poke 1024+i, 119: poke 55296+i, 1
540 next i
550 poke 1063, 80: poke 55335, 1
560 for i=1 to 23
570   poke 1024 + 40*i, 116: poke 55296 + 40*i, 1
580   poke 1024 + 40*i+39, 106: poke 55296 + 40*i+39, 1
590 next i
600 poke 1984, 76: poke 56256, 1
610 for i=1 to 38
620   poke 1984+i, 111: poke 56256+i, 1
630 next i
640 poke 2023, 122: poke 56295, 1
650 return