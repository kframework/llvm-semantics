llvm-compiled.maude: llvm.k llvm-syntax.k llvm-semantics.k
	kompile llvm
	
test: llvm-compiled.maude sumn.ll
	krun sumn.ll

xml: sumn.format.xml
	cat $<

kast: sumn.format.xml
	cat $< | perl ../tools/xmlToK.pl
	
	
%.xml: %.ll
	../tools/llvm-xml-ir/build/tools/llvm-dis-xml $< -o $@
	
%.format.xml: %.xml
	xmllint --format $< > $@
		
	
clean:
	rm -f llvm-compiled.maude
	
	
# build c parser
# build k
