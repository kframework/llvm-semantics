Terms = $(wildcard tests/*)

test: llvm.tbl
	@time for Prog in $(Terms) ;\
	do \
		if sglr -A -t -p llvm.tbl -i $$Prog -o out.parsetree ; then \
			if cat out.parsetree | implode-asfix | pp-aterm | grep 'amb(' > out.ambs ; then \
				cat out.ambs; \
				echo "FAIL  " $$Prog; \
			else \
				echo "PASS  " $$Prog; \
			fi \
		else \
			echo "FAIL  " $$Prog; \
		fi \
	done
#-o /dev/null
	
parse-%: llvm.tbl %
	sglr -A -t -v -p llvm.tbl -i $* | implode-asfix | pp-aterm
#	-o /dev/null

llvm.def: llvm.sdf
	pack-sdf -i $< -o $@

llvm.tbl: llvm.def
	sdf2table -m llvm -i $< -o $@

clean:
	rm -f llvm.tbl llvm.def
