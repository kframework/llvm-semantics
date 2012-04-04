; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920506-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@l = global [2 x i32] [i32 0, i32 1], align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32* getelementptr inbounds ([2 x i32]* @l, i32 0, i32 0), i32** %p, align 8
  %0 = load i32** %p, align 8
  %incdec.ptr = getelementptr inbounds i32* %0, i32 1
  store i32* %incdec.ptr, i32** %p, align 8
  %1 = load i32* %0, align 4
  switch i32 %1, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.epilog
    i32 2, label %sw.epilog
    i32 3, label %sw.bb1
    i32 4, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

sw.bb1:                                           ; preds = %entry, %entry
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.bb1, %entry, %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind
