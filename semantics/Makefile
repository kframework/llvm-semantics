CURRTEST ?= ../tests/gcc-torture/20000113-1.ll

llvm-compiled.maude: llvm.k llvm-syntax.k llvm-semantics.k
	$(K_BASE)/core/kompile -u llvm

test: llvm-compiled.maude $(CURRTEST)
	$(K_BASE)/core/krun $(CURRTEST)

linked:
	../dist/bin/llvm-semantics-link ../dist/share/libc.ll $(CURRTEST) -o -

xml:
	../dist/bin/llvm-dis-xml $(CURRTEST) -o - | xmllint --format -

kast:
	cat $(CURRTEST) | ../dist/bin/llvm-dis-xml $(CURRTEST) -o - | perl ../dist/bin/xmlToK.pl

ll:
	cat $(CURRTEST)

clean:
	rm -f llvm-compiled.maude


# build c parser
# build k
