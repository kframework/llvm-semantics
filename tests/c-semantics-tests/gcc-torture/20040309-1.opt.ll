; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040309-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i16 zeroext %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i16 %x, 0
  br i1 %cmp, label %cond.true, label %cond.end

cond.true:                                        ; preds = %entry
  %sub = xor i16 %x, -32768
  %phitmp = zext i16 %sub to i32
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %phitmp, %cond.true ], [ 0, %entry ]
  ret i32 %cond
}

define i32 @main() nounwind uwtable {
if.end16:
  ret i32 0
}
