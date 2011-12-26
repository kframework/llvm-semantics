Terms = $(wildcard tests/*)

test: llvm.tbl
	@time for Prog in $(Terms) ;\
	do \
		if sglr -2 -A -t -p llvm.tbl -i $$Prog -o out.parsetree ; then \
			if cat out.parsetree | implode-asfix | grep 'amb(' > out.ambs ; then \
				echo "AMBI  " $$Prog; \
			else \
				echo "PASS  " $$Prog; \
			fi \
		else \
			echo "FAIL  " $$Prog; \
		fi \
	done
#-o /dev/null
	
parse-%: llvm.tbl %
	sglr -2 -A -t -v -p llvm.tbl -i $* | implode-asfix | pp-aterm
#	-o /dev/null

time: llvm.tbl tests/schorr-waite.ll
#sglr -2 -A -t -v -p llvm.tbl -i tests/schorr-waite.ll -o /dev/null
#sglr -2 -A -t -v -p llvm.tbl -i tests/gaussianElimination.ll -o /dev/null
	time sglr -2 -A -t -v -p llvm.tbl -i tests/md5.ll -o out.parsetree
	
#	-o /dev/null

llvm.def: llvm.sdf
	pack-sdf -i $< -o $@

llvm.tbl: llvm.def
	sdf2table -m llvm -i $< -o $@

clean:
	rm -f llvm.tbl llvm.def
