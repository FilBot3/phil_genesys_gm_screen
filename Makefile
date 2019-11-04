.DEFAULT_TARGET := default

default: install

install:
	sudo dnf install -y texlive texlive-biblatex biber texlive-fontawesome texlive-tabu latexmk

init:
	# Install RubyGems and things
	bundle install

guard-init:
	# Intitalize a Guardfile. However this is already done.
	# This is there for my documentation sake.
	bundle exec guard init

guard:
	# Run Ruby GuardGem and watch files.
	bundle exec guard

bib:
	# Generate Bibliography References
	biber biblography.bcf

pdfdoc:
	# Generate a PDF Doc with Bibliography.
	pdflatex genesys_pokemon_setting.tex
	biber genesys_pokemon_setting.bcf
	pdflatex genesys_pokemon_setting.tex
	pdflatex genesys_pokemon_setting.tex

lualatex:
	# Call lualatex instead of pdflatex or xelatex
	lualatex -interaction=nonstopmode -halt-on-error -file-line-error GameMasterScreen.tex

clean:
	# Remove any artifacts.
	rm *.log *.aux *.run.xml *.pdf *.bbl *.bcf *.blg *.toc
