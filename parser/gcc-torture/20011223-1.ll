; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20011223-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@i = internal global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -1, i32* @i, align 4
  %tmp = load i32* @i, align 4
  %conv = trunc i32 %tmp to i8
  %conv1 = sext i8 %conv to i32
  switch i32 %conv1, label %sw.default [
    i32 255, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry
  call void @abort() noreturn
  unreachable

sw.default:                                       ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
