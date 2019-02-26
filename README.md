# Markdown-LaTeX PhD Template

<hr>

Template for a PhD dissertation using Markdown and Pandoc. It can be used to generate both the final pdf document (based on `.md` files under the folder: `chapters/`) and the Beamer slides (based on the markdown files under the folder: `slides/`)



#### Getting Started

Basic structure of the directory:

```bash
$ tree
.
├── assets
│   ├── default.beamer
│   ├── default.latex
│   ├── mylogo.png
│   └── myref.bib
├── chapters
│   ├── 00-title.md
│   ├── 01-ch01.md
│   ├── 02-ch02.md
│   ├── 03-ch03.md
│   ├── 04-ch04.md
│   ├── 05-ch05.md
│   └── 06-ch06.md
├── output
│   ├── slides.pdf
│   └── thesis.pdf
├── slides
│   ├── 00-title.md
│   └── 01-slides.md
├── Makefile
├── README.md
├── requirements.txt
├── slides.sh
└── thesis.sh

4 directories, 20 files
```

<hr>

### Requirements


- Install [Pandoc](https://pandoc.org/installing.html)
- LaTeX Engine
- To add support for Tables/Figures/Equations numbering and reference, install the required packages in `requirements.txt`. To install all at once, run this:
    - `pip instal -r requirements.txt`


> NOTE: after installation is completed, make sure pandoc and latex are added to your system PATH.

<hr>

### How to use:

- Add your own contents inside the markdown files in the folders `chapters/` and `slides/` then just run:

```
make
```

<hr>

Sample run with log:

```
$ make
/Users/Aziz/Dropbox/thesis/template/thesis.sh
	 converting markdown to tex  ...
	 compiling thesis pdf ...
	 bibing thesis references ...
	 compiling thesis references ...
	 finalizing pdf ...
DONE building the dissertation document.

/Users/Aziz/Dropbox/thesis/template/slides.sh
	 converting markdown to tex ...
	 compiling slides pdf ...
	 bibing slides references ...
	 compiling slides references ...
DONE building the dissertation slides.
```
