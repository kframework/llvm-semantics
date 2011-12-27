; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr29798.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %if.end11, %entry
  %indvar = phi i32 [ %phitmp, %if.end11 ], [ 1, %entry ]
  %div134 = phi double [ %div13, %if.end11 ], [ 1.000000e+00, %entry ]
  %tmp82 = phi double [ %tmp83, %if.end11 ], [ 0.000000e+00, %entry ]
  %tmp141 = phi double [ %mul, %if.end11 ], [ undef, %entry ]
  %cmp = icmp slt i32 %indvar, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %mul = fmul double %div134, %div134
  %cmp5 = icmp eq i32 %indvar, 1
  br i1 %cmp5, label %if.end, label %if.then

if.then:                                          ; preds = %for.body
  %div = fdiv double %mul, %tmp141
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %tmp83 = phi double [ %tmp82, %for.body ], [ %div, %if.then ]
  %cmp9 = fcmp oeq double %tmp83, 1.000000e+00
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end
  %div13 = fmul double %div134, 5.000000e-01
  %phitmp = add i32 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
