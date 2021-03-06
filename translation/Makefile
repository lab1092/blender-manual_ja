
SPHINXOPTS    =
PAPER         =
SPHINXBUILD   = sphinx-build
BUILDDIR      = build

# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) manual
# the i18n builder cannot share the environment and doctrees with the others
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) manual

# full paths
CHAPTERS_FULL:=$(filter %/, $(wildcard manual/*/))
# names only
CHAPTERS:=$(notdir $(sort $(CHAPTERS_FULL:%/=%)))
# intersect make goals and possible chapters
QUICKY_CHAPTERS=$(filter $(MAKECMDGOALS),$(CHAPTERS))

$(CHAPTERS): all

all: FORCE
	# './' (input), './html/' (output)
	QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
	$(SPHINXBUILD) -b html $(SPHINXOPTS) ./manual $(BUILDDIR)/html/en
	@echo "firefox" $(shell pwd)"/$(BUILDDIR)/html/"

# NOTE: PDF is giving warnings, non-trivial to fix, disable for now.
#~ pdf: FORCE
#~ 	QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
#~ 	sphinx-build -b latex ./manual ./latex
#~ 	make -C ./latex
#~ 	@echo "evince latex/blender_manual.pdf"

readme: FORCE
	rst2html readme.rst > readme.html

check_syntax: FORCE
	- python3 tools/rst_check_syntax.py --long > rst_check_syntax.log
	- @echo "Lines:" `cat rst_check.log  | wc -l`
	- gvim --nofork -c "cfile rst_check_syntax.log" -c "cope" -c "clast"
	- rm rst_check_syntax.log

check_structure: FORCE
	- python3 tools/rst_check_structure.py --long > rst_check_structure.log
	- @echo "Lines:" `cat rst_check.log  | wc -l`
	- gvim --nofork -c "cfile rst_check_structure.log" -c "cope" -c "clast"
	- rm rst_check_structure.log

gettext: FORCE
	$(SPHINXBUILD) -b gettext $(I18NSPHINXOPTS) $(BUILDDIR)/locale/pot
	@echo
	@echo "Build finished. The message catalogs are in $(BUILDDIR)/locale."


clean: FORCE
	rm -rf $(BUILDDIR)/html $(BUILDDIR)/latex


# -----------------------------------------------------------------------------
# Help for build targets
help:
	@echo ""
	@echo "Convenience targets provided for building docs"
	#~ @echo "- pdf        - create a PDF with latex"
	@echo "- readme     - create 'readme.html'"
	@echo "  ... otherwise defaults to HTML"
	@echo ""
	@echo "Chapters - for quickly building a single chapter"

	@$(foreach ch,$(CHAPTERS),echo "- "$(ch);)

FORCE:
