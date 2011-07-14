.PHONY: all clean burn zip

TeXFLAGS := -p -b -q -c
R := R
Rscript := Rscript
RFLAGS := --vanilla
sqlite := sqlite3
sqliteFLAGS := $(empty)

all: Paper.pdf # zip Online

Paper.pdf: Paper.tex
	texi2dvi $< $(TeXFLAGS)

%.pdf: %.tex
	$(R) CMD texi2dvi $< $(TeXFLAGS)
%.tex: %.Rnw
	$(R) CMD Sweave $<


# Automatically create an archive file
archfile = calhoun-2011-statboot.tar.gz
zip: $(archfile)
$(archfile): $(filter-out .bzrignore, $(shell bzr ls -R -V --kind=file)) Paper.pdf AllRefs.bib
	tar chzf $@ $^

# Put the archive file on my website
Online: $(archfile)
	scp $? gcalhoun@econ22.econ.iastate.edu:public_html/software
	touch $@