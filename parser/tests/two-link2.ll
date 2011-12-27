; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/two-link2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@foo = external global i8*

define i32 @main(i32 %argv, i8** %argc) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argv.addr = alloca i32, align 4
  %argc.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argv, i32* %argv.addr, align 4
  store i8** %argc, i8*** %argc.addr, align 8
  store i8* null, i8** @foo, align 8
  %0 = load i32* %retval
  ret i32 %0
}
