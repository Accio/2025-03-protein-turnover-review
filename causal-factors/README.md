Directed Acyclic Graph of factors affecting protein turnover
===
Jitao David Zhang, March 2025

The original graphviz file was produced for a Bioinfo Club presentation in 2022. For the review, I updated the graph by adding new factors, and for simplicity, removing edges between factors. The resulting file, `turnover-2025.gv`, contains the full directed acyclic graph, though most of the edges are hidden.

The file was converted to the GML format, and manually edited with the yEd software. The output is stored in GraphML format, and exported as PDF file.

Finally, the Makefile implements an semi-automatic process to convert the PDF file into a reasonably sized PNG file (turnover-2025-editted-yEd-pdf.png). I used it for the publication.
