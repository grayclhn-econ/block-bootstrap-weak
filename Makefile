# Copyright 2015, Gray Calhoun
.PHONY: all VERSION.tex
.DELETE_ON_ERROR:

replies = $(patsubst %.tex,%.pdf,$(wildcard subs/*/*.tex))
all: Paper.pdf Appendix.pdf Paper_diffed.pdf $(replies)

Appendix.pdf Paper.pdf Paper_diffed.pdf: %.pdf: %.tex preamble.tex VERSION.tex
	texi2dvi $< -p -b -q -c

$(wildcard subs/ETr2/*.tex): preamble.tex subs/ETr2/summary
$(replies): %.pdf: %.tex
	cd $(@D) && texi2dvi $(<F) -p -b -q

# Always generate a new VERSION.tex file because we're going to use
# 'texi2dvi' to manage the build process for the pdfs anyway.
VERSION.tex:
	echo "\date{$$(./version_git.sh)}" > $@
