.PHONY: all clean burn zip

TeXFLAGS := -p -b -q -c

all: Paper.pdf

Paper.pdf: Paper.tex VERSION
	texi2dvi $< $(TeXFLAGS)

%.pdf: %.tex
	$(R) CMD texi2dvi $< $(TeXFLAGS)