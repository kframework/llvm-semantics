; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051021-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = global i32 0, align 4

define i32 @foo1() nounwind uwtable {
entry:
  %0 = load i32* @count, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @count, align 4
  ret i32 0
}

define i32 @foo2() nounwind uwtable {
entry:
  %0 = load i32* @count, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @count, align 4
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo1()
  %cmp = icmp eq i32 %call, 1
  %conv = zext i1 %cmp to i32
  %call1 = call i32 @foo2()
  %cmp2 = icmp eq i32 %call1, 1
  %conv3 = zext i1 %cmp2 to i32
  %and = and i32 %conv, %conv3
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %0 = load i32* @count, align 4
  %cmp4 = icmp ne i32 %0, 2
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
