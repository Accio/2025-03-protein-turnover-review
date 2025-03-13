all: turnover-2025.png turnover-2025.gml

turnover-2025.gml: turnover-2025.gv
	gv2gml turnover-2025.gv -oturnover-2025.gml

turnover-2025.png: turnover-2025.gv
	dot -Gsize="4,7" -Tpng turnover-2025.gv -o turnover-2025.png & eog turnover-2025.png

