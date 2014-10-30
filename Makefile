
# full paths
CHAPTERS_FULL:=$(filter %/, $(wildcard manual/*/))
# names only
CHAPTERS:=$(notdir $(sort $(CHAPTERS_FULL:%/=%)))
# intersect make goals and possible chapters
QUICKY_CHAPTERS=$(filter $(MAKECMDGOALS),$(CHAPTERS))

$(CHAPTERS): all gettext

all:
	# './' (input), './html/' (output)
	QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
	sphinx-build -b html ./manual ./html
	@echo "firefox" $(shell pwd)"/html/"

allja:
	# './' (input), './html/' (output)
	QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
	sphinx-build -D language='ja' -b html ./manual ./html
	@echo "firefox" $(shell pwd)"/html/"

    
gettext:
	# './' (input), './locale/' (output)
	QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
	sphinx-build -b gettext ./manual ./locale
	@echo "pot files are updated. "

pdf:
	sphinx-build -b gettext -a -E -c ./manual . ./locale/
	make -C ./latex
	@echo "evince latex/blender_manual.pdf"



clean:
	rm -rf html latex locale


# -----------------------------------------------------------------------------
# Help for build targets
help:
	@echo ""
	@echo "Convenience targets provided for building docs"
	@echo "- pdf        - create a PDF with latex"
	@echo "  ... otherwise defaults to HTML"
	@echo ""
	@echo "Chapters - for quickly building a single chapter"

	@$(foreach ch,$(CHAPTERS),echo "- "$(ch);)
	

