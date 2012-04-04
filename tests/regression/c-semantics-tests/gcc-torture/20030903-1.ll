; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030903-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@test = internal global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load volatile i32* @test, align 4
  switch i32 %0, label %sw.epilog [
    i32 1, label %sw.bb
    i32 2, label %sw.bb1
    i32 3, label %sw.bb2
    i32 4, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  call void @y(i32 1)
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  call void @y(i32 2)
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  call void @y(i32 3)
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  call void @y(i32 4)
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  ret i32 0
}

define internal void @y(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @abort() noreturn nounwind
