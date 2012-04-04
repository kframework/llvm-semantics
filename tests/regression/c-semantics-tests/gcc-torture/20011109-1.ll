; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011109-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @fail1() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @abort() noreturn nounwind

define void @fail2() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define void @fail3() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define void @fail4() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define void @foo(i64 %x) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %x.addr, align 8
  switch i64 %0, label %sw.default [
    i64 -6, label %sw.bb
    i64 0, label %sw.bb1
    i64 1, label %sw.bb2
    i64 2, label %sw.bb2
    i64 3, label %sw.bb3
    i64 4, label %sw.bb3
    i64 5, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  call void @fail1()
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  call void @fail2()
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry, %entry
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry, %entry, %entry
  call void @fail3()
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @fail4()
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %1 = load i64* %x.addr, align 8
  switch i64 %1, label %sw.default8 [
    i64 -3, label %sw.bb4
    i64 0, label %sw.bb5
    i64 4, label %sw.bb5
    i64 1, label %sw.bb6
    i64 3, label %sw.bb6
    i64 2, label %sw.bb7
    i64 8, label %sw.bb7
  ]

sw.bb4:                                           ; preds = %sw.epilog
  call void @fail1()
  br label %sw.epilog9

sw.bb5:                                           ; preds = %sw.epilog, %sw.epilog
  call void @fail2()
  br label %sw.epilog9

sw.bb6:                                           ; preds = %sw.epilog, %sw.epilog
  br label %sw.epilog9

sw.bb7:                                           ; preds = %sw.epilog, %sw.epilog
  call void @abort() noreturn nounwind
  unreachable

sw.default8:                                      ; preds = %sw.epilog
  call void @fail4()
  br label %sw.epilog9

sw.epilog9:                                       ; preds = %sw.default8, %sw.bb6, %sw.bb5, %sw.bb4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i64 1)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
