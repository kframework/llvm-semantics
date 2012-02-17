; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930614-2.ll'
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

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc68, %entry
  %indvar8 = phi i64 [ %indvar.next9, %for.inc68 ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar8 to i32
  %cmp = icmp slt i32 %storemerge, 8
  br i1 %cmp, label %for.cond2, label %for.end71

for.cond2:                                        ; preds = %for.cond, %for.inc64
  %indvar6 = phi i64 [ %indvar.next7, %for.inc64 ], [ 0, %for.cond ]
  %tmp18 = add i64 %indvar8, %indvar6
  %storemerge1 = trunc i64 %tmp18 to i32
  %cmp4 = icmp slt i32 %storemerge1, 8
  br i1 %cmp4, label %for.cond6, label %for.inc68

for.cond6:                                        ; preds = %for.cond2, %for.inc60
  %indvar4 = phi i64 [ %indvar.next5, %for.inc60 ], [ 0, %for.cond2 ]
  %storemerge2 = trunc i64 %indvar4 to i32
  %cmp8 = icmp slt i32 %storemerge2, 2
  br i1 %cmp8, label %for.cond10, label %for.inc64

for.cond10:                                       ; preds = %for.cond6, %for.inc
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %for.cond6 ]
  %storemerge3 = trunc i64 %indvar to i32
  %cmp12 = icmp slt i32 %storemerge3, 2
  br i1 %cmp12, label %for.inc, label %for.inc60

for.inc:                                          ; preds = %for.cond10
  %indvar.next = add i64 %indvar, 1
  br label %for.cond10

for.inc60:                                        ; preds = %for.cond10
  %indvar.next5 = add i64 %indvar4, 1
  br label %for.cond6

for.inc64:                                        ; preds = %for.cond6
  %indvar.next7 = add i64 %indvar6, 1
  br label %for.cond2

for.inc68:                                        ; preds = %for.cond2
  %indvar.next9 = add i64 %indvar8, 1
  br label %for.cond

for.end71:                                        ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
