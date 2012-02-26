.PHONY: all clean

all: dist

tools/llvm-xml-ir/build/tools/llvm-dis-xml: tools/llvm-xml-ir/lib/ASMXMLWriter/*
	mkdir -p tools/llvm-xml-ir/build
	cd tools/llvm-xml-ir/build && cmake ..
	$(MAKE) -C tools/llvm-xml-ir/build
	
dist: dist/dist.done

dist/dist.done: tools/llvm-xml-ir/build/tools/llvm-dis-xml tools/c2ll tools/xmlToK.pl semantics/llvm-compiled.maude
	mkdir -p dist
	cp tools/llvm-xml-ir/build/tools/llvm-dis-xml dist/
	cp tools/c2ll dist/
	cp tools/xmlToK.pl dist/
	cp semantics/llvm-compiled.maude dist/
	touch dist/dist.done

semantics/llvm-semantics.k: semantics/*.k
	$(MAKE) -C semantics
	
clean:
	rm -rf tools/llvm-xml-ir/build
	rm -f semantics/llvm-compiled.maude