; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990804-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gfbyte() nounwind uwtable {
entry:
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @gfbyte()
  store i32 %call, i32* %i, align 4
  %0 = load i32* %i, align 4
  %add = add nsw i32 %0, 1
  store i32 %add, i32* %i, align 4
  %1 = load i32* %i, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* %k, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load i32* %i, align 4
  %add1 = add nsw i32 %2, 0
  store i32 %add1, i32* %k, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32* %i, align 4
  %cmp2 = icmp ne i32 %3, 1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  store i32 1, i32* %k, align 4
  %4 = load i32* %k, align 4
  %5 = load i32* %i, align 4
  %cmp5 = icmp sle i32 %4, %5
  br i1 %cmp5, label %if.then6, label %if.end9

if.then6:                                         ; preds = %if.end4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then6
  %call7 = call i32 @gfbyte()
  store i32 %call7, i32* %j, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %6 = load i32* %k, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %k, align 4
  %7 = load i32* %i, align 4
  %cmp8 = icmp slt i32 %6, %7
  br i1 %cmp8, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %if.end9

if.end9:                                          ; preds = %do.end, %if.end4
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
