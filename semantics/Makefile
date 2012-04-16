CURRTEST ?= ../tests/gcc-torture/20000113-1.ll
IGNORED_MODULES = "LLVM-STANDARD-LIBRARY-PREPROCESS\|LLVM-SYSCALLS-SYNTAX\|LLVM-SYSCALLS-PREPROCESS\|LLVM-CLEAN-TREE\|LLVM-HELPERS\|LLVM-START-AND-STOP\|LLVM-HELPERS-SPLIT-BYTES\|LLVM-HELPERS-JOIN-BYTES\|LLVM-SEMANTICS"
PDF_MODULES = LLVM-SYNTAX `sed -n 's/module \(.*\) is/\1/p' llvm-semantics.k | grep -v $(IGNORED_MODULES)`

llvm-compiled.maude: llvm.k llvm-syntax.k llvm-semantics.k
	$(K_BASE)/core/kompile -u llvm

test: llvm-compiled.maude $(CURRTEST)
	@$(K_BASE)/core/krun $(CURRTEST)

testq: llvm-compiled.maude $(CURRTEST)
	$(K_BASE)/core/krun --output-mode=none $(CURRTEST)

pdf: llvm.k llvm-syntax.k llvm-semantics.k
	$(K_BASE)/core/kompile -topmatter latex/topmatter.tex -pdf $(PDF_MODULES) llvm

png: llvm.k llvm-syntax.k llvm-semantics.k
	$(K_BASE)/core/kompile -topmatter latex/topmatter.tex -png $(PDF_MODULES) llvm

latex: llvm.k llvm-syntax.k llvm-semantics.k
	$(K_BASE)/core/kompile -topmatter latex/topmatter.tex -latex $(PDF_MODULES) llvm

linked:
	@../dist/bin/llvm-semantics-link ../dist/share/libc.ll $(CURRTEST) -o -

xml:
	@../dist/bin/llvm-semantics-link ../dist/share/libc.ll $(CURRTEST) -o - | ../dist/bin/llvm-dis-xml -o - | xmllint --format -

kast:
	@../dist/bin/llvm-semantics-link ../dist/share/libc.ll $(CURRTEST) -o - | ../dist/bin/llvm-dis-xml -o - | perl ../dist/bin/xml2k

ll:
	@cat $(CURRTEST)

clean:
	rm -f llvm-compiled.maude


# build c parser
# build k
