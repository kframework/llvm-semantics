GRAMMAR = llvm

# Keep all intermediate files:
.SECONDARY:

default: $(GRAMMAR).tbl

# Simple test harness
# We (naively) assume clang will compile all of the C tests without error.
# TODO: $C_SEMANTICS env variable?
C_TESTS_DIR = ~/c-semantics/tests/unitTests
C_TESTS = $(wildcard $(C_TESTS_DIR)/*.c)
LL_TESTS_DIR = tests
LL_TESTS = $(wildcard $(LL_TESTS_DIR)/*.ll)

lltests: $(GRAMMAR).tbl $(patsubst %.ll,%.test,$(LL_TESTS))
ctests: $(GRAMMAR).tbl $(patsubst %.c,%.test,$(C_TESTS))
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
	@clang -w -emit-llvm -S $< -o $@
	
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
	rm -f $(LL_TESTS_DIR)/*.parsetree $(LL_TESTS_DIR)/*.imploded
	rm -f $(C_TESTS_DIR)/*.ll $(C_TESTS_DIR)/*.parsetree $(C_TESTS_DIR)/*.imploded
