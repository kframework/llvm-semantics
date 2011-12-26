Terms = $(wildcard tests/*)

test: llvm.tbl
	@for Prog in $(Terms) ;\
	do \
		if sglr -t -p llvm.tbl -i $$Prog -o /dev/null; then \
			echo "PASS  " $$Prog; \
		else \
			echo "FAIL  " $$Prog; \
		fi \
	done
#-o /dev/null
	
parse-%: llvm.tbl %
	sglr -t -v -p llvm.tbl -i $*

llvm.def: llvm.sdf
	pack-sdf -i $< -o $@

llvm.tbl: llvm.def
	sdf2table -m llvm -i $< -o $@

clean:
	rm -f llvm.tbl llvm.def
