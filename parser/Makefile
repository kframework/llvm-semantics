Terms = $(wildcard tests/*)

test: llvm.tbl
	@for Term in $(Terms) ;\
	do \
		sglr -t -p llvm.tbl -i $$Term -o /dev/null ; \
	done
	
parse-%: llvm.tbl %
	sglr -t -v -p llvm.tbl -i $*

llvm.def: llvm.sdf
	pack-sdf -i $< -o $@

llvm.tbl: llvm.def
	sdf2table -m llvm -i $< -o $@
	
clean:
	rm -f llvm.tbl llvm.def
