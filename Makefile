all: figures/open-models.pdf figures/2025-06-20-half-life-ridgeline-and-KRAS.png figures/open-models-eq.pdf

figures/open-models.pdf: open-models.tex
	pdflatex open-models.tex
	mv open-models.pdf figures/

figures/2025-06-20-half-life-ridgeline-and-KRAS.png: figures/2025-06-20-half-life-ridgeline-and-KRAS.pdf
	convert -density 300 -trim -quality 100 -flatten -sharpen 0x1.0 figures/2025-06-20-half-life-ridgeline-and-KRAS.pdf figures/2025-06-20-half-life-ridgeline-and-KRAS.png

figures/open-models-eq.pdf: open-models-eq.tex
	pdflatex open-models-eq.tex
	mv open-models-eq.pdf figures/
