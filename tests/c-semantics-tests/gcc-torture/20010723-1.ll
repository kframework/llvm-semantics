; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010723-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @test() nounwind uwtable {
entry:
  %biv = alloca i32, align 4
  %giv = alloca i32, align 4
  store i32 0, i32* %biv, align 4
  store i32 0, i32* %giv, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %giv, align 4
  %cmp = icmp ne i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %biv, align 4
  %mul = mul nsw i32 %1, 8
  store i32 %mul, i32* %giv, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %biv, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %biv, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %3 = load i32* %giv, align 4
  ret i32 %3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test()
  %cmp = icmp ne i32 %call, 8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
