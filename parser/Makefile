GRAMMAR = llvm

# Keep all intermediate files:
.SECONDARY:

default: $(GRAMMAR).tbl

# Simple test harness
# We (naively) assume clang will compile all of the C tests without error.
# TODO: $C_SEMANTICS env variable?
C_TESTS_DIRS = ~/c-semantics/tests/unitTests
C_TESTS = $(foreach dir, $(C_TESTS_DIRS), $(wildcard $(dir)/*.c))
LL_TESTS_DIRS = tests gcc-torture
LL_TESTS = $(foreach dir, $(LL_TESTS_DIRS), $(wildcard $(dir)/*.ll))

lltests: $(GRAMMAR).tbl $(patsubst %.ll,%.test,$(LL_TESTS))
ctests: $(GRAMMAR).tbl $(patsubst %.c,%.test,$(C_TESTS)) $(patsubst %.c,%.opt.test,$(C_TESTS))
alltests: lltests ctests

%.test: %.ll
	@if make -s $*.imploded >/dev/null 2>&1; then \
		if grep 'amb(' $*.imploded ; then \
			echo "AMBI  " $<; \
		else \
			echo "PASS  " $<; \
		fi \
	else \
		echo "FAIL  " $<; \
	fi

%.ll: %.c
	@if ! clang -w -emit-llvm -S $< -o $@; then \
		touch $@; \
		echo "FAIL (clang) $<"; \
	fi

%.opt.ll: %.ll
	@opt -S -std-compile-opts $< > $@
	
%.parsetree: %.ll $(GRAMMAR).tbl
	sglr -2 -A -t -v -p $(GRAMMAR).tbl -i $< -o $@

%.imploded: %.parsetree
	implode-asfix < $< > $@

%.pp: %.imploded
	pp-aterm < $< > $@

%.def: %.sdf
	pack-sdf -i $< -o $@

# TODO: should create a Main module which imports llvm
%.tbl: %.def
	sdf2table -m llvm -i $< -o $@

clean:
	rm -f $(GRAMMAR).tbl $(GRAMMAR).def
	rm -f *.parsetree *.imploded
# rm -f $(LL_TESTS_DIR)/*.parsetree $(LL_TESTS_DIR)/*.imploded
	$(foreach dir, $(LL_TESTS_DIRS), rm -f $(dir)/*.parsetree $(dir)/*.imploded;)
	$(foreach dir, $(C_TESTS_DIRS), rm -f $(dir)/*.ll $(dir)/*.parsetree $(dir)/*.imploded;)
