; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930408-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32 }

@s = common global %struct.anon zeroinitializer, align 4

define void @p() nounwind uwtable {
entry:
  call void @abort() noreturn
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @abort() noreturn

define void @f() nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds (%struct.anon* @s, i32 0, i32 0), align 4
  switch i32 %0, label %sw.epilog [
    i32 0, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry
  call void @p()
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* getelementptr inbounds (%struct.anon* @s, i32 0, i32 0), align 4
  call void @f()
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
