; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020819-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo() nounwind uwtable {
entry:
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %ccp_bad = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %ccp_bad, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 10
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @foo()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  store i32 1, i32* %ccp_bad, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %2 = load i32* %j, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %3 = load i32* %ccp_bad, align 4
  %cmp4 = icmp ne i32 %3, 0
  %conv = zext i1 %cmp4 to i32
  store i32 %conv, i32* %k, align 4
  %4 = load i32* %k, align 4
  %tobool5 = icmp ne i32 %4, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %for.end
  br label %for.inc8

for.inc8:                                         ; preds = %if.end7
  %5 = load i32* %i, align 4
  %inc9 = add nsw i32 %5, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
