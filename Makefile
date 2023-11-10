# -- Variables -----------------------------------------------------------------

SOURCE_FILE := ICOc.md
OUTPUT_FILE := $(SOURCE_FILE:.md=.html)

# -- Rules ---------------------------------------------------------------------

.PHONY: watch
watch:
	(marp -w $(SOURCE_FILE) &); open $(OUTPUT_FILE) || true

.PHONY: build
build:
	marp --pdf --allow-local-files $(SOURCE_FILE)
