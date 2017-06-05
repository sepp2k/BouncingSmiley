bouncing-smiley.prg: main.bas border.bas smiley.bas
	awk 1 main.bas border.bas smiley.bas | petcat -w2 -o bouncing-smiley.prg

smiley.bas: smiley.bmp
	python sprite-converter.py smiley.bmp 1000 > smiley.bas

run: bouncing-smiley.prg
	x64 -autostart bouncing-smiley.prg

clean:
	rm -f *.prg smiley.bas
