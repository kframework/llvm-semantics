; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/medce-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ok.b = internal unnamed_addr global i1 false

define void @bar() nounwind uwtable {
entry:
  store i1 true, i1* @ok.b, align 1
  ret void
}

define void @foo(i32 %x) nounwind uwtable {
entry:
  %cond = icmp eq i32 %x, 1
  br i1 %cond, label %sw.bb1, label %sw.epilog

sw.bb1:                                           ; preds = %entry
  store i1 true, i1* @ok.b, align 1
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.bb1
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  store i1 true, i1* @ok.b, align 1
  ret i32 0
}
