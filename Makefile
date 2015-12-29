.PHONY: all

replies = $(patsubst %.tex,%.pdf,$(wildcard subs/*/*.tex))
all: Paper.pdf Appendix.pdf $(replies)

Appendix.pdf Paper.pdf: %.pdf: %.tex preamble.tex
	texi2dvi $< -p -b -q -c

$(replies): %.pdf: %.tex
	cd $(@D) && texi2dvi $(<F) -p -b -q -c
