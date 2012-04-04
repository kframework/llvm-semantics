; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030120-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %status) nounwind uwtable {
entry:
  %status.addr = alloca i32, align 4
  %s = alloca i32, align 4
  store i32 %status, i32* %status.addr, align 4
  store i32 0, i32* %s, align 4
  %0 = load i32* %status.addr, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %s, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32* %status.addr, align 4
  %cmp1 = icmp eq i32 %1, 3
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 3, i32* %s, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %2 = load i32* %status.addr, align 4
  %cmp4 = icmp eq i32 %2, 4
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  store i32 4, i32* %s, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end3
  %3 = load i32* %s, align 4
  ret i32 %3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i32 3)
  %cmp = icmp ne i32 %call, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
