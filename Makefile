bouncing-smiley.prg: main.bas border.bas smiley.bas frowney.bas
	awk 1 main.bas border.bas smiley.bas frowney.bas | petcat -w2 -o bouncing-smiley.prg

smiley.bas: smiley.bmp
	python sprite-converter.py smiley.bmp 1000 > smiley.bas

frowney.bas: frowney.bmp
	python sprite-converter.py frowney.bmp 2000 > frowney.bas

run: bouncing-smiley.prg
	x64 -autostart bouncing-smiley.prg

clean:
	rm -f *.prg smiley.bas frowney.bas

NAME := $(shell git show -s --format='%an' HEAD)
MAIL := $(shell git show -s --format='%ae' HEAD)

release: bouncing-smiley.prg
	mv bouncing-smiley.prg tmp.prg
	git checkout builds
	mv tmp.prg bouncing-smiley.prg
	git add bouncing-smiley.prg
	git config user.email "$(MAIL)"
	git config user.name "$(NAME)"
	git commit --allow-empty -m "New build"
	git push

.PHONY: run clean release
