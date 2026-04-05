# ============================================================
# Makefile — CC421 Grupo 7
# Uso: make        → compila el PDF
#       make clean  → elimina archivos auxiliares
#       make view   → abre el PDF (Linux/Mac)
# ============================================================

MAIN = main
LATEX = pdflatex
BIBTEX = bibtex
FLAGS = -interaction=nonstopmode -halt-on-error

.PHONY: all clean view

all:
	$(LATEX) $(FLAGS) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(LATEX) $(FLAGS) $(MAIN).tex
	$(LATEX) $(FLAGS) $(MAIN).tex
	@echo ""
	@echo "✓ Compilado exitosamente: $(MAIN).pdf"

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz
	@echo "✓ Archivos auxiliares eliminados"

view: all
	xdg-open $(MAIN).pdf 2>/dev/null || open $(MAIN).pdf 2>/dev/null || echo "Abre manualmente: $(MAIN).pdf"
