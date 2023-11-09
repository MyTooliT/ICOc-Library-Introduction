SOURCE_FILE := ICOc.md
OUTPUT_FILE := $(SOURCE_FILE:.md=.html)

watch:
	(marp -w $(SOURCE_FILE) &); open $(OUTPUT_FILE) || true

.PHONY: build
build:
	marp --pdf $(SOURCE_FILE)
