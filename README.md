The previous version of LLVM semantics is created by David Lazar from MIT
and Chucky Ellison from Google.
It is located in https://github.com/kframework/llvm-semantics-old.

Versions of tools used to generate the .ll files:

LLVM (http://llvm.org/):
  LLVM version 3.4
  
  Optimized build.
  Built Mar  5 2014 (17:05:10).
  Default target: x86_64-pc-linux-gnu
  Host CPU: core-avx-i

Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)
Target: x86_64-pc-linux-gnu
Thread model: posix

Currently, the K parser cannot parse LLVM comments. They need to be
removed from your LLVM program before you call the kast tool on them.
For your convenience, we provide a java program that does that, called
DeleteLLVMComments:

$ java DeleteLVMComments myprogram.ll

will output the resulting LLVM program to standard output, while

$ krun --parser "java DeleteLVMComments" --directory mysemanticsdirectory myprogram.ll

will forward it to the kast tool. Therefore, if your LLVM program
contains comments, make sure that you use the pipe command
above as external parser to the krun tool when you execute your
program with the LLVM semantics.

