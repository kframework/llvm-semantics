; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-10.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = internal global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %iNbr = alloca i32, align 4
  %test = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %iNbr, align 4
  store i32 0, i32* %test, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32* %test, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @inc()
  %1 = load i32* %iNbr, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  br label %while.end

if.else:                                          ; preds = %while.body
  call void @inc()
  %2 = load i32* %iNbr, align 4
  %dec = add nsw i32 %2, -1
  store i32 %dec, i32* %iNbr, align 4
  br label %if.end

if.end:                                           ; preds = %if.else
  store i32 1, i32* %test, align 4
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  %3 = load i32* @count, align 4
  %cmp2 = icmp ne i32 %3, 2
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %while.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %while.end
  ret i32 0
}

define internal void @inc() nounwind uwtable {
entry:
  %0 = load i32* @count, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @count, align 4
  ret void
}

declare void @abort() noreturn nounwind
