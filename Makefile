.PHONY: all
all: Paper.pdf Appendix.pdf

Appendix.pdf Paper.pdf: %.pdf: %.tex preamble.tex
	texi2dvi $< -p -b -q -c
