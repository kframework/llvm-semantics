; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930622-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 1, align 4
@b = common global i32 0, align 4

define i32 @g() nounwind uwtable readnone {
entry:
  ret i32 0
}

define void @h(i32 %x) nounwind uwtable readnone {
entry:
  ret void
}

define i32 @f() nounwind uwtable {
entry:
  store i32 0, i32* @a, align 4
  ret i32 0
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store i32 0, i32* @a, align 4
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
