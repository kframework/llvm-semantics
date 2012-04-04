; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050124-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %i, i32 %j) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  %0 = load i32* %i.addr, align 4
  %add = add nsw i32 %0, 1
  store i32 %add, i32* %k, align 4
  %1 = load i32* %j.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  %2 = load i32* %k, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.then
  %3 = load i32* %k, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %k, align 4
  br label %if.end4

if.else:                                          ; preds = %if.then
  %4 = load i32* %k, align 4
  %cmp2 = icmp slt i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %5 = load i32* %k, align 4
  %dec = add nsw i32 %5, -1
  store i32 %dec, i32* %k, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.else
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then1
  br label %if.end5

if.end5:                                          ; preds = %if.end4, %entry
  %6 = load i32* %k, align 4
  ret i32 %6
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i32 -2, i32 0)
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @foo(i32 -1, i32 0)
  %cmp2 = icmp ne i32 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @foo(i32 0, i32 0)
  %cmp6 = icmp ne i32 %call5, 1
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 @foo(i32 1, i32 0)
  %cmp10 = icmp ne i32 %call9, 2
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i32 @foo(i32 -2, i32 1)
  %cmp14 = icmp ne i32 %call13, -2
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i32 @foo(i32 -1, i32 1)
  %cmp18 = icmp ne i32 %call17, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i32 @foo(i32 0, i32 1)
  %cmp22 = icmp ne i32 %call21, 2
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i32 @foo(i32 1, i32 1)
  %cmp26 = icmp ne i32 %call25, 3
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  ret i32 0
}

declare void @abort() noreturn nounwind
