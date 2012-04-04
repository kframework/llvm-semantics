; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051110-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bytes = common global [5 x i8] zeroinitializer, align 1

define void @add_unwind_adjustsp(i64 %offset) nounwind uwtable {
entry:
  %sub = add nsw i64 %offset, -516
  %shr = ashr i64 %sub, 2
  %tobool7 = icmp eq i64 %shr, 0
  br i1 %tobool7, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %while.body ], [ 0, %entry ]
  %o.09 = phi i64 [ %shr1, %while.body ], [ %shr, %entry ]
  %o.0.tr = trunc i64 %o.09 to i8
  %conv = and i8 %o.0.tr, 127
  %arrayidx = getelementptr inbounds [5 x i8]* @bytes, i64 0, i64 %indvars.iv
  %shr1 = lshr i64 %o.09, 7
  %tobool2 = icmp eq i64 %shr1, 0
  %or = or i8 %o.0.tr, -128
  %conv.or = select i1 %tobool2, i8 %conv, i8 %or
  store i8 %conv.or, i8* %arrayidx, align 1
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %tobool2, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  store i8 -120, i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 0), align 1
  store i8 7, i8* getelementptr inbounds ([5 x i8]* @bytes, i64 0, i64 1), align 1
  ret i32 0
}
