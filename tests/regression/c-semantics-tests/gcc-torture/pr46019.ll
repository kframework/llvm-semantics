; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr46019.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l = alloca i64, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  store i64 4398046511104, i64* %l, align 8
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %n, align 4
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64* %l, align 8
  %2 = load i32* %n, align 4
  %sh_prom = zext i32 %2 to i64
  %shl = shl i64 8589934592, %sh_prom
  %div = udiv i64 %1, %shl
  %3 = load i32* %n, align 4
  %shr = ashr i32 512, %3
  %conv = sext i32 %shr to i64
  %cmp1 = icmp ne i64 %div, %conv
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i32* %n, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
