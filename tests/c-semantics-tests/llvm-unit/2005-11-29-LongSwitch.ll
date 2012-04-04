; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2005-11-29-LongSwitch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"foo = %d\0A\00", align 1

define i32 @foo(i64 %v) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %v.addr = alloca i64, align 8
  store i64 %v, i64* %v.addr, align 8
  %0 = load i64* %v.addr, align 8
  switch i64 %0, label %sw.epilog [
    i64 0, label %sw.bb
    i64 -1, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry
  store i32 1, i32* %retval
  br label %return

sw.bb1:                                           ; preds = %entry
  store i32 2, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %entry
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb1, %sw.bb
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i64 4294967295)
  store i32 %call, i32* %r, align 4
  %0 = load i32* %r, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %0)
  %1 = load i32* %r, align 4
  ret i32 %1
}

declare i32 @printf(i8*, ...)
