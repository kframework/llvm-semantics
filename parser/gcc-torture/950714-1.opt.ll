; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/950714-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@array = global [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], align 16

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

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = phi i32 [ 0, %entry ], [ %inc, %for.inc10 ]
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.cond1, label %if.then15

for.cond1:                                        ; preds = %for.cond, %for.inc
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %for.cond ]
  %storemerge1 = getelementptr [10 x i32]* @array, i64 0, i64 %indvar
  %cmp3 = icmp eq i32* %storemerge1, getelementptr inbounds ([10 x i32]* @array, i64 0, i64 9)
  br i1 %cmp3, label %for.inc10, label %for.body4

for.body4:                                        ; preds = %for.cond1
  %tmp6 = load i32* %storemerge1, align 4
  %cmp8 = icmp eq i32 %tmp6, %0
  br i1 %cmp8, label %label, label %for.inc

for.inc:                                          ; preds = %for.body4
  %indvar.next = add i64 %indvar, 1
  br label %for.cond1

for.inc10:                                        ; preds = %for.cond1
  %inc = add nsw i32 %0, 1
  br label %for.cond

label:                                            ; preds = %for.body4
  %cmp14 = icmp eq i32 %0, 1
  br i1 %cmp14, label %if.end16, label %if.then15

if.then15:                                        ; preds = %for.cond, %label
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %label
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
