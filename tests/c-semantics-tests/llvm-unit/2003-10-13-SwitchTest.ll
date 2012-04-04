; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-10-13-SwitchTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"GOOD\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"BAD\0A\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32* %argc.addr, align 4
  switch i32 %0, label %sw.default [
    i32 100, label %sw.bb
    i32 101, label %sw.bb
    i32 1023, label %sw.bb
  ]

sw.default:                                       ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %retval
  br label %return

sw.bb:                                            ; preds = %entry, %entry, %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %sw.bb, %sw.default
  %1 = load i32* %retval
  ret i32 %1
}

declare i32 @printf(i8*, ...)
