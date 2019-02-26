#!/bin/bash

# how to use:
# $ bash thesis.sh [tex|default:pdf]>

arguments() {
	# -- parameters
	INPUT="chapters/*.md"
	BUILD="build_thesis"
	OUTPUT="thesis.pdf"

	# output extension: options pdf, text, ... (see: pandoc extnesions)
	ext=${1-tex}  # arg1 or default to tex "LaTex"
	echo -e '\t' "converting markdown to" $ext " ..."
	BUILDext=$BUILD"."$ext
}
arguments

move_local_figures_to_root_assets_folder() {
	# -- move locally added figures to the parent "assets/" folder
	# -- after copy/pasting some figures, markdown-plugin will automatically store them into a folder 'assets' in the current directory
	if [ -d chapters/assets ]; then
		echo -e '\t' "moving newly added figures ... "
		mv chapters/assets/*.png assets/
		rm -rf chapters/assets
	fi
}
move_local_figures_to_root_assets_folder


convert_markdown_to_latex(){

	# pandoc arguments
	args="	-t latex
			--mathjax
			-s -S --natbib
			--bibliography /Users/Aziz/Dropbox/thesis/myref.bib
			--template ./assets/default.latex
			--filter pandoc-eqnos
			--filter pandoc-fignos
			--filter pandoc-tablenos
			--number-sections
			--toc-depth=3
			--highlight-style tango
			"

	pandoc $INPUT $args -o $BUILDext
}
convert_markdown_to_latex


clean_converted_latex(){
	# -- remove the annoying cpation prefixes in tables and figures .tex source
	# -- these were produced after pandoc converted .md to .tex
	sed -i -e "s/\\\begin{no-prefix-figure-caption}//g" $BUILD.tex
	sed -i -e "s/\\\end{no-prefix-figure-caption}//g" $BUILD.tex
	sed -i -e "s/\\\begin{no-prefix-table-caption}//g" $BUILD.tex
	sed -i -e "s/\\\end{no-prefix-table-caption}//g" $BUILD.tex
}
clean_converted_latex


compile_pdf_with_references(){
	# -- Use cmd commands to build pdf with references (citations) from the generate latex file "$BUILD.tex"
	if [[ $# -eq 0 ]]; then
		echo -e '\t' "compiling thesis pdf ...";
		pdflatex $BUILDext > /dev/null

		echo -e '\t' "bibing thesis references ...";
		bibtex -terse $BUILD > /dev/null

		echo -e '\t' "compiling thesis references ...";
		pdflatex $BUILD > /dev/null

		echo -e '\t' "finalizing pdf ...";
		xelatex $BUILD > /dev/null

		# clean up
		cp $BUILD".pdf" $OUTPUT
		mkdir -p output/.texout
		mv -f $BUILD* output/.texout/
		mv $OUTPUT output/
	fi

}
compile_pdf_with_references


echo 'DONE building the dissertation document.'
echo
