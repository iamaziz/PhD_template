#!/bin/bash

# how to use:
# $ bash slides.sh [ tex | None ] (default: pdf)

INPUT="slides/*.md"
BUILD="build_slides"
OUTPUT="slides.pdf"


if [[ -n $1 ]]; then
	ext=$1;
	echo -e '\t' "converting markdown to $1 ..."
else
	ext="tex";
	echo -e '\t' "converting markdown to tex ...";
fi

BUILDext=$BUILD"."$ext

# pandoc arguments
args="	  -t beamer
		  --mathjax
		  -s -S --natbib
		  --bibliography /Users/Aziz/Dropbox/thesis/myref.bib
		  --template ./assets/default.beamer
		  --filter pandoc-eqnos
		  --filter pandoc-fignos
		  --filter pandoc-tablenos
		  -V fontsize=13pt
		"

pandoc $args $INPUT -o $BUILDext

# compile to build tex file and generate references
if [[ $# -eq 0 ]]; then

	echo -e '\t' "compiling slides pdf ..."
	pdflatex $BUILDext > /dev/null

	echo -e '\t' "bibing slides references ..."
	bibtex -terse $BUILD > /dev/null

	echo -e '\t' "compiling slides references ...";
	pdflatex $BUILD > /dev/null
	# For some reason, need to do this again so the references will be generated
	pdflatex $BUILD > /dev/null

	# clean up
	cp $BUILD".pdf" $OUTPUT
	mkdir -p output/.texout_slides
	mv -f $BUILD* output/.texout_slides/
	mv $OUTPUT output/

fi



echo 'DONE building the dissertation slides.'
echo
