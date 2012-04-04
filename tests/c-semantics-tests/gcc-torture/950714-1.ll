; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950714-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@array = global [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end6

for.body:                                         ; preds = %for.cond
  store i32* getelementptr inbounds ([10 x i32]* @array, i32 0, i64 0), i32** %p, align 8
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32** %p, align 8
  %cmp2 = icmp ne i32* %1, getelementptr inbounds ([10 x i32]* @array, i32 0, i64 9)
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32** %p, align 8
  %3 = load i32* %2, align 4
  %4 = load i32* %i, align 4
  %cmp4 = icmp eq i32 %3, %4
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  br label %label

if.end:                                           ; preds = %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load i32** %p, align 8
  %incdec.ptr = getelementptr inbounds i32* %5, i32 1
  store i32* %incdec.ptr, i32** %p, align 8
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc5

for.inc5:                                         ; preds = %for.end
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end6:                                         ; preds = %for.cond
  br label %label

label:                                            ; preds = %for.end6, %if.then
  %7 = load i32* %i, align 4
  %cmp7 = icmp ne i32 %7, 1
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %label
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %label
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
