; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-04-22-Switch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"C\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"A\0A\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"B\0A\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"D\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp ult i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %call = call i32 @func(i32 %1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4
  %inc = add i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

define internal i32 @func(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %X = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 4, i32* %X, align 4
  %0 = load i32* %i.addr, align 4
  switch i32 %0, label %sw.default [
    i32 8, label %sw.bb
    i32 0, label %sw.bb1
    i32 3, label %sw.bb1
    i32 2, label %sw.bb1
    i32 1, label %sw.bb3
    i32 7, label %sw.bb3
    i32 9, label %sw.bb4
  ]

sw.bb:                                            ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0))
  store i32 6, i32* %X, align 4
  br label %sw.bb1

sw.bb1:                                           ; preds = %entry, %entry, %entry, %sw.bb
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry, %entry
  store i32 7, i32* %X, align 4
  br label %sw.bb4

sw.bb4:                                           ; preds = %entry, %sw.bb3
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0))
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  store i32 1, i32* %X, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb4, %sw.bb1
  %1 = load i32* %X, align 4
  ret i32 %1
}

declare i32 @printf(i8*, ...)
