.PHONY: all clean

all: dist

tools/llvm-dis-xml/build/tools/llvm-dis-xml: tools/llvm-dis-xml/lib/ASMXMLWriter/*
	mkdir -p tools/llvm-dis-xml/build
	cd tools/llvm-dis-xml/build && cmake ..
	$(MAKE) -C tools/llvm-dis-xml/build

check-vars:
#ifeq ($(K_BASE),)
#	@echo "ERROR: Please set K_BASE to the full path of your K installation."
#	@echo "Make sure you do NOT include a trailing slash\\"
#	@echo "One way to do this is to type 'export K_BASE=/path/to/k/framework', and then rerun 'make'"
#	@exit 1
#endif

dist: check-vars dist/dist.done

dist/dist.done: tools/llvm-dis-xml/build/tools/llvm-dis-xml tools/c2ll tools/xml2k semantics/llvm-compiled.maude
	rm -rf done
	mkdir -p dist/bin dist/share
	cp tools/llvm-dis-xml/build/tools/llvm-dis-xml dist/bin
	cp tools/c2ll dist/bin
	cp tools/xml2k dist/bin
	cp tools/llvm-semantics-link dist/bin
	cp semantics/llvm-compiled.maude dist/share
	cp semantics/llvm.desk dist/share
	cp stdlib/libc.ll dist/share
	touch dist/dist.done

semantics/llvm-compiled.maude: semantics/*.k
# $(MAKE) -C semantics # no idea why this doesn't work, maybe bug in K?
	cd semantics && $(MAKE)

test: dist
	$(MAKE) -C tests

regression: dist
	$(MAKE) -C tests regression

clean:
	rm -rf dist
	rm -rf tools/llvm-dis-xml/build
	$(MAKE) -C semantics clean
