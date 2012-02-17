; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000605-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.F = type { i32 }

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

define void @f1(%struct.F* %x, %struct.F* %y) nounwind uwtable {
entry:
  %i = getelementptr inbounds %struct.F* %x, i64 0, i32 0
  %i3 = getelementptr inbounds %struct.F* %y, i64 0, i32 0
  %tmp1.pre = load i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = phi i32 [ %inc10, %for.inc ], [ %tmp1.pre, %entry ]
  %indvar = phi i32 [ %phitmp, %for.inc ], [ 1, %entry ]
  %tmp4 = load i32* %i3, align 4
  %cmp = icmp slt i32 %tmp1, %tmp4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %cmp6 = icmp sgt i32 %indvar, 5
  br i1 %cmp6, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body
  %inc10 = add nsw i32 %tmp1, 1
  store i32 %inc10, i32* %i, align 4
  %phitmp = add i32 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %0 = phi i32 [ %inc10.i, %for.inc.i ], [ 0, %entry ]
  %cmp.i = icmp slt i32 %0, 1
  br i1 %cmp.i, label %for.inc.i, label %f1.exit

for.inc.i:                                        ; preds = %for.cond.i
  %inc10.i = add nsw i32 %0, 1
  br label %for.cond.i

f1.exit:                                          ; preds = %for.cond.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
