; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010106-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %i) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  switch i32 %0, label %sw.default [
    i32 -2, label %sw.bb
    i32 -1, label %sw.bb1
    i32 0, label %sw.bb2
    i32 1, label %sw.bb3
    i32 2, label %sw.bb4
    i32 3, label %sw.bb5
    i32 4, label %sw.bb6
  ]

sw.bb:                                            ; preds = %entry
  store i32 33, i32* %retval
  br label %return

sw.bb1:                                           ; preds = %entry
  store i32 0, i32* %retval
  br label %return

sw.bb2:                                           ; preds = %entry
  store i32 7, i32* %retval
  br label %return

sw.bb3:                                           ; preds = %entry
  store i32 4, i32* %retval
  br label %return

sw.bb4:                                           ; preds = %entry
  store i32 3, i32* %retval
  br label %return

sw.bb5:                                           ; preds = %entry
  store i32 15, i32* %retval
  br label %return

sw.bb6:                                           ; preds = %entry
  store i32 9, i32* %retval
  br label %return

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f(i32 -1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

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

declare void @exit(i32) noreturn nounwind
