; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr21964-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32 %n, i32 %m) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  %0 = load i32* %m.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  %1 = load i32* %n.addr, align 4
  %cmp1 = icmp ne i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.else3:                                         ; preds = %if.else
  %2 = load i32* %n.addr, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %n.addr, align 4
  %3 = load i32* %m.addr, align 4
  %sub = sub nsw i32 %3, 1
  call void @foo(i32 %2, i32 %sub)
  br label %if.end

if.end:                                           ; preds = %if.else3
  br label %if.end4

if.end4:                                          ; preds = %if.end
  ret void
}

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  call void @foo(i32 0, i32 4)
  ret i32 0
}
