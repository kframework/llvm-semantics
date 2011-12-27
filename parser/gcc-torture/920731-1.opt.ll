; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/920731-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %x) nounwind uwtable readnone {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %shr1 = phi i32 [ %x, %entry ], [ %shr, %for.inc ]
  %0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %land.rhs, label %for.end

land.rhs:                                         ; preds = %for.cond
  %and = and i32 %shr1, 1
  %cmp2 = icmp eq i32 %and, 0
  br i1 %cmp2, label %for.inc, label %for.end

for.inc:                                          ; preds = %land.rhs
  %shr = ashr i32 %shr1, 1
  %inc = add nsw i32 %0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond, %land.rhs
  ret i32 %0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %land.rhs.i

land.rhs.i:                                       ; preds = %entry, %for.inc.i
  %shr1.i = phi i32 [ 4, %entry ], [ %shr.i, %for.inc.i ]
  %and.i = and i32 %shr1.i, 1
  %cmp2.i = icmp eq i32 %and.i, 0
  br i1 %cmp2.i, label %for.inc.i, label %if.end

for.inc.i:                                        ; preds = %land.rhs.i
  %shr.i = ashr i32 %shr1.i, 1
  br label %land.rhs.i

if.end:                                           ; preds = %land.rhs.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
