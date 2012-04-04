; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-6.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c = alloca i8, align 1
  %d = alloca i8, align 1
  %nbits = alloca i32, align 4
  store i32 0, i32* %retval
  store i8 -1, i8* %c, align 1
  store i32 1, i32* %nbits, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %nbits, align 4
  %cmp = icmp slt i32 %0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %nbits, align 4
  %shl = shl i32 1, %1
  %sub = sub nsw i32 %shl, 1
  %conv = trunc i32 %sub to i8
  store i8 %conv, i8* %d, align 1
  %2 = load i8* %d, align 1
  %conv1 = sext i8 %2 to i32
  %3 = load i8* %c, align 1
  %conv2 = sext i8 %3 to i32
  %cmp3 = icmp eq i32 %conv1, %conv2
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i32* %nbits, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %nbits, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %5 = load i32* %nbits, align 4
  %cmp5 = icmp eq i32 %5, 100
  br i1 %cmp5, label %if.then7, label %if.end8

if.then7:                                         ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %for.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
