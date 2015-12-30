# Copyright 2015, Gray Calhoun
.PHONY: all VERSION.tex
all: Paper.pdf Appendix.pdf

Appendix.pdf Paper.pdf: %.pdf: %.tex preamble.tex VERSION.tex
	texi2dvi $< -p -b -q -c

# Always generate a new VERSION.tex file because we're going to use
# 'texi2dvi' to manage the build process for the pdfs anyway.
VERSION.tex:
	echo "\date{$$(./version_git.sh)}" > $@
