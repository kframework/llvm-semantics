GRAMMAR = llvm

# Keep all intermediate files:
.SECONDARY:

default: $(GRAMMAR).tbl

# Simple test harness
# We (naively) assume clang will compile all of the C tests without error.
C_TESTS_DIRS = $(C_SEMANTICS)/tests/csmith $(C_SEMANTICS)/tests/cil $(C_SEMANTICS)/tests/unitTests
C_TESTS = $(foreach dir, $(C_TESTS_DIRS), $(wildcard $(dir)/*.c))
LL_TESTS_DIRS = tests/general tests/gcc-torture tests/csmith tests/csmith-shalamar-clang-3.0
LL_TESTS = $(foreach dir, $(LL_TESTS_DIRS), $(wildcard $(dir)/*.ll))

lltests: $(GRAMMAR).tbl $(patsubst %.ll,%.test,$(LL_TESTS))
ctests: $(GRAMMAR).tbl $(patsubst %.c,%.test,$(C_TESTS)) $(patsubst %.c,%.opt.test,$(C_TESTS))
alltests: lltests ctests

%.test: %.ll
	@if grep -x 'CLANG FAILURE' $< >/dev/null; then \
		echo -n "CLANG FAIL"; \
	else \
		if $(MAKE) --assume-new=$< -s $*.imploded >/dev/null 2>&1; then \
			if grep 'amb(' $*.imploded >/dev/null ; then \
				echo -n "AMBI"; \
			else \
				echo -n "PASS"; \
			fi \
		else \
			echo -n "FAIL"; \
		fi \
	fi; \
	echo "   $<"

%.ll: %.c
	@if ! clang -w -emit-llvm -S $< -o $@; then \
		echo "CLANG FAILURE" > $@; \
		echo "clang failed to compile $<"; \
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
# pack-sdf -i $< -o $@
	echo 'definition' | cat - $< > $@
# not sure why pack-sdf doesn't always work

# TODO: should create a Main module which imports llvm
%.tbl: %.def
	sdf2table -m llvm -i $< -o $@

clean:
	rm -f $(GRAMMAR).tbl $(GRAMMAR).def
	rm -f *.parsetree *.imploded
# rm -f $(LL_TESTS_DIR)/*.parsetree $(LL_TESTS_DIR)/*.imploded
	$(foreach dir, $(LL_TESTS_DIRS), rm -f $(dir)/*.parsetree $(dir)/*.imploded;)
	$(foreach dir, $(C_TESTS_DIRS), rm -f $(dir)/*.ll $(dir)/*.parsetree $(dir)/*.imploded;)
