; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/960218-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@glob = common global i32 0, align 4

define i32 @g(i32 %x) nounwind uwtable {
entry:
  store i32 %x, i32* @glob, align 4
  ret i32 0
}

define void @f(i32 %x) nounwind uwtable {
entry:
  %tobool1 = icmp eq i32 %x, -1
  br i1 %tobool1, label %while.end, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %entry
  %neg = xor i32 %x, -1
  store i32 %neg, i32* @glob, align 4
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store i32 -4, i32* @glob, align 4
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
