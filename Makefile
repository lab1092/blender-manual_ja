
# full paths
CHAPTERS_FULL:=$(filter %/, $(wildcard manual/*/))
# names only
CHAPTERS:=$(notdir $(sort $(CHAPTERS_FULL:%/=%)))
# intersect make goals and possible chapters
QUICKY_CHAPTERS=$(filter $(MAKECMDGOALS),$(CHAPTERS))

$(CHAPTERS): all
all:
	# './' (input), './html/en/' (output)
	QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
	sphinx-build -b html ./manual ./html/en
	@echo "firefox" $(shell pwd)"/html/en"

allja:
	# './' (input), './html/ja/' (output)
	QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
	sphinx-build -D language='ja' -b html ./manual ./html/ja
	@echo "firefox" $(shell pwd)"/html/ja"

    
gettext:
	# './' (input), './locale/' (output)
	QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
	sphinx-build -b gettext ./manual ./locale/pot
	@echo "pot files are updated. "
	@echo "next you can update the po files. "


pdf:
	QUICKY_CHAPTERS=$(QUICKY_CHAPTERS) \
	sphinx-build -b latex ./manual ./latex
	make -C ./latex
	@echo "evince latex/blender_manual.pdf"


clean:
	rm -rf html latex locale/pot


# -----------------------------------------------------------------------------
# Help for build targets
help:
	@echo ""
	@echo "Convenience targets provided for building docs"
	@echo "- gettext    - create a POT file"
	@echo "- pdf        - create a PDF with latex"
	@echo "  ... otherwise defaults to HTML"
	@echo ""
	@echo "Chapters - for quickly building a single chapter"

	@$(foreach ch,$(CHAPTERS),echo "- "$(ch);)
	

