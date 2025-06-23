all: turnover-2025.png turnover-2025.gml turnover-2025-editted-yEd-pdf.png

turnover-2025.gml: turnover-2025.gv
	gv2gml turnover-2025.gv -oturnover-2025.gml

turnover-2025.png: turnover-2025.gv
	dot -Gsize="4,7" -Tpng turnover-2025.gv -o turnover-2025.png & eog turnover-2025.png

turnover-2025-editted-yEd-pdf.png: turnover-2025-editted-yEd.pdf
	convert -verbose -density 300 -trim -quality 100 -flatten -sharpen 0x1.0 -resize "3000x" turnover-2025-editted-yEd.pdf turnover-2025-editted-yEd-pdf.png
