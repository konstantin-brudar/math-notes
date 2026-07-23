NOTES_DIR = notes
BUILD_DIR = build
ENGINE = pdflatex
LATEXMK_FLAGS = -pdf -pdflatex="$(ENGINE)" -cd
SUBJECTS = mathematical-analysis

.PHONY: all clean $(SUBJECTS)

all: $(SUBJECTS)

$(SUBJECTS): %:
	@mkdir -p $(BUILD_DIR)/$*
	@find $* -type d -exec mkdir -p $(BUILD_DIR)/{} \;
	@latexmk $(LATEXMK_FLAGS) -outdir=../$(BUILD_DIR)/$* $*/main.tex
	@mkdir -p $(NOTES_DIR)
	@cp $(BUILD_DIR)/$*/main.pdf $(NOTES_DIR)/$*.pdf

clean:
	@rm -rf $(BUILD_DIR)
