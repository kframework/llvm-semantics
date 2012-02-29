TEST_DIRECTORIES = general gcc-torture
TEST_TARGETS = $(foreach dir,  $(TEST_DIRECTORIES), $(dir)/results/krun-results.xml)

# regression tests
REGRESSION_DIRECTORIES = regression/general regression/gcc-torture
REGRESSION_TARGETS = $(foreach dir,  $(REGRESSION_DIRECTORIES), $(dir)/results/krun-results.xml)

ALL_DIRECTORIES = $(TEST_DIRECTORIES) $(REGRESSION_DIRECTORIES)
CLEAN_TARGETS = $(foreach dir, $(ALL_DIRECTORIES), clean-$(dir))

all: $(TEST_TARGETS)

regression: $(REGRESSION_TARGETS)

%/results/krun-results.xml:
	@perl $(K_BASE)/tools/tester.pl -d $*/results -f "--k-definition=../dist/llvm --desk-file=../dist/llvm.desk --no-color" -n $*

clean: $(CLEAN_TARGETS)

clean-%:
	rm -f ./$*/results/*.xml ./$*/results/*.stderr ./$*/results/*.stdout ./$*/results/*.diff

clean-regression/%:
	rm -f regression/$*/results/*.xml regression/$*/results/*.stderr regression/$*/results/*.stdout regression/$*/results/*.diff
