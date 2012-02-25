llvm-compiled.maude: llvm.k llvm-syntax.k llvm-semantics.k
	kompile llvm
	
test: llvm-compiled.maude cool.ll
	krun cool.ll

xml: cool.format.xml
	cat $<
	
	
%.xml: %.ll
	../tools/llvm-xml-ir/build/tools/llvm-dis-xml $< -o $@
	
%.format.xml: %.xml
	xmllint --format $< > $@
		
	
clean:
	rm -f llvm-compiled.maude
	
	
# build c parser
# build k
