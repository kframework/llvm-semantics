CURRTEST ?= ../tests/gcc-torture/20000113-1.ll

llvm-compiled.maude: llvm.k llvm-syntax.k llvm-semantics.k
	$(K_BASE)/core/kompile -u llvm

test: llvm-compiled.maude $(CURRTEST)
	$(K_BASE)/core/krun $(CURRTEST)

xml:
	../dist/llvm-dis-xml $(CURRTEST) -o - | xmllint --format -

kast:
	cat $(CURRTEST) | ../dist/llvm-dis-xml $(CURRTEST) -o - | perl ../dist/xmlToK.pl

ll:
	cat $(CURRTEST)

clean:
	rm -f llvm-compiled.maude


# build c parser
# build k
